local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    --nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>rn', '<cmd>Lspsaga rename<CR>', '[R]e[n]ame')

    --nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    --nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>D', '<cmd>Lspsaga goto_type_definition<CR>', 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    --  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    --nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('K', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
    --nmap('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('<leader>K', '<cmd>Lspsaga signature_help<CR>', 'Signature Documentation')

    -- Diagnostic keymaps
    nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
    nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
    nmap('<leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', 'Open floating diagnostic message')
    nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostics list')

    nmap('<leader>o', '<cmd>Lspsaga outline<CR>', 'Show outline')

    -- Workspaces
    --nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    --nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- Conflict <leader>wl window navigation
    --nmap('<leader>wl', function()
    --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},

    tsserver = {
        filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
        cmd = { 'typescript-language-server', '--stdio' },
        single_file_support = false,
    },

    cssls = {
        -- unknownAtRules ignored for tailwindcss
        css = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        },
        scss = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        },
        less = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        },
    },

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

require('neodev').setup()

require('lsp_signature').setup()

require('lspsaga').setup({
        ui = {
        code_action = ''
    }
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}
