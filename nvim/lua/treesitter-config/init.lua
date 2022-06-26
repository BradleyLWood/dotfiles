require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"css",
		"dart",
		"dockerfile",
		"erlang",
		"fish",
		"go",
		"graphql",
		"haskell",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"php",
		"python",
		"regex",
		"rust",
		"scss",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"vim",
	},

	sync_install = false,
	ignore_install = {},

	indent = {
		enable = false
	},

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
}
