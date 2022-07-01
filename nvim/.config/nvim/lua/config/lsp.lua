local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspsaga').setup()

local lspkind = require('lspkind')
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
lspkind.init({
    symbol_map = kind_icons
})

local nvim_lsp = require('lspconfig')
local configs = require'lspconfig.configs'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Attach lsp_signature
    require "lsp_signature".on_attach()

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    --vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<space>e', '<CMD>Lspsaga show_line_diagnostics<CR>', bufopts)
    --vim.keymap.set('n', 'gj', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', 'gj', '<CMD>Lspsaga diagnostic_jump_next<CR>', bufopts)
    --vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', 'gk', '<CMD>Lspsaga diagnostic_jump_prev<CR>', bufopts)

    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, bufopts)

    vim.keymap.set("n", "<C-u>", "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<CR>", {})
    vim.keymap.set("n", "<C-d>", "<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<CR>", {})

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>', bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    --vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>rn', '<CMD>Lspsaga rename<CR>', bufopts)
    --vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>ca', '<CMD>Lspsaga code_action<CR>', bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require('lspconfig')['html'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['cssls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['jsonls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- disable formatting so null-ls will
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        on_attach(client, bufnr)
    end,
    flags = lsp_flags,
}

require('lspconfig')['svelte'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['gopls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['pyright'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['sqlls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['eslint'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['emmet_ls'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
                'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'},
    flags = lsp_flags,
}

require('lspconfig')['tailwindcss'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}

USER = vim.fn.expand('$USER')
local sumneko_root_path = "/home/" .. USER .. "/.local/share/nvim/lua-language-server"
local sumneko_binary = "/home/" .. USER .. "/.local/share/nvim/lua-language-server/bin/lua-language-server"

require('lspconfig')['sumneko_lua'].setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}
