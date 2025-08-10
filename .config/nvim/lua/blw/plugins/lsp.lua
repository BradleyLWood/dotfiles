local root_files = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
}

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim',
        },

        config = function()
            local cmp = require('cmp')

            local capabilities = vim.tbl_deep_extend(
                'force',
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()
            )

            require('mason').setup({})

            local luasnip = require('luasnip')
            luasnip.config.setup({})
            require('luasnip.loaders.from_vscode').lazy_load()

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    map('<leader>rn', vim.lsp.buf.rename, 'Rename')
                    map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
                            end,
                        })
                    end
                end,
            })

            local servers = {
                clangd = {},
                -- TODO: Fix go
                --gopls = {},
                ocamllsp = {},
                hls = {},
                pyright = {},
                rust_analyzer = {},
                ansiblels = {},
                clojure_lsp = {},
                cssls = {},
                elixirls = {},
                htmx = {},
                tailwindcss = {},
                ts_ls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { 'vim' } },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                },
            }

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua', -- Used to format Lua code
            })

            require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = 'menu,menuone,noinsert' },

                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<M-Space>'] = cmp.mapping.complete({}),
                    -- TODO: fix so doesn't conflict with harpoon
                    --['<C-l>'] = cmp.mapping(function()
                    --    if luasnip.expand_or_locally_jumpable() then
                    --        luasnip.expand_or_jump()
                    --    end
                    --end, { 'i', 's' }),
                    --['<C-h>'] = cmp.mapping(function()
                    --    if luasnip.locally_jumpable(-1) then
                    --        luasnip.jump(-1)
                    --    end
                    --end, { 'i', 's' }),
                }),

                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                },

                window = {
                    completion = {
                        border = 'single',
                    },
                    documentation = {
                        border = 'single',
                    },
                },
            })

            -- `/` cmdline setup.
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                },
            })

            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' },
                        },
                    },
                }),
            })
        end,
    },
}
