local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require'cmp'

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

-- Luasnip
local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end	

cmp.setup({
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
			},
		},
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'cmp_tabnine' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local nvim_lsp = require('lspconfig')
local configs = require'lspconfig.configs'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Attach lsp_signature
	require "lsp_signature".on_attach()

	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gdc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gdf', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', 'gsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Emmet configuration
if not configs.ls_emmet then    
	configs.ls_emmet = {
		default_config = {
			cmd = { 'ls_emmet', '--stdio' };
			filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
				'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
			root_dir = function(fname)
				return vim.loop.cwd()
			end;
			settings = {};
		};
	}
end

require'lspconfig'.html.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.cssls.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.jsonls.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.tsserver.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.svelte.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.gopls.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.pyright.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.sqlls.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.eslint.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.ls_emmet.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

require'lspconfig'.tailwindcss.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- TODO not working
-- require'lspconfig'.hsl.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = {
-- 		haskell = {
-- 			hlintOn = true,
-- 			formattingProvider = "fourmolu"
-- 		}
-- 	}
-- })

--local snippets_paths = function()
--	local plugins = { "friendly-snippets" }
--	local paths = {}
--	local path
--	local root_path = vim.env.HOME .. "/.vim/plugged/"
--	for _, plug in ipairs(plugins) do
--		path = root_path .. plug
--		if vim.fn.isdirectory(path) ~= 0 then
--			table.insert(paths, path)
--		end
--	end
--	return paths
--end
--
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	};
})
