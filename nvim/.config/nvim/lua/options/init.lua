local opt  = vim.opt     -- global
local g  = vim.g     -- global for let options
local wo = vim.wo    -- window local
local bo = vim.bo    -- buffer local
local fn = vim.fn    -- access vim functions
local cmd = vim.cmd  -- vim commands

opt.compatible = false								-- new freshness, not old and busted
opt.number = true									-- show row numbers
opt.relativenumber = true							-- row numbers are relative to current line
opt.numberwidth = 5									-- width of row number column
opt.cursorline = true								-- highlight current row
--opt.colorcolumn = 73								-- highlight column
opt.tabstop = 4										-- tab width
opt.shiftwidth = 4									-- indentation width
opt.softtabstop = 4									-- tab and backspace add and remove this much
opt.expandtab = true								-- use spaces
opt.wrap = false									-- don't wrap text
opt.backspace = {'indent', 'eol', 'start'}			-- don't block backspacing
opt.scrolloff = 3									-- leave 3 rows when scrolling by pages, etc.
opt.encoding = "utf-8"								-- use utf-8 encoding
opt.mouse = "a"										-- allow mouse
opt.ruler = true									-- show cursor row and column on statusline
opt.showmode = false								-- suppress mode
opt.timeoutlen = 500								-- length of timeout in milliseconds
opt.visualbell = true								-- use visualbell
opt.laststatus=2									-- always show statusline
opt.showmode = false								-- suppress mode from cmdline
opt.showcmd = true									-- show counts on cmdline
opt.wildmenu = true									-- enable tab completion for cmdline
opt.wildmode = {'list', 'longest'}					-- tab completion style for cmdline
opt.completeopt = {'menu', 'menuone', 'noselect'}	-- tab completion in insert mode (for cmp lsp autocompletion)
opt.hlsearch = true									-- highlight search matches
opt.incsearch = true								-- go to next match as you type the search
opt.ignorecase = true								-- search ignores case
opt.smartcase = true								-- ignore case only for searches that don't have caps
opt.showmatch = true								-- highlight matching brace, quote, etc.
opt.background = 'dark'								-- use dark variant of the colorscheme

g.gist_clip_command = 'xclip -selection clipboard'	-- Use xclip for gists

g.vimwiki_list = {{									-- vimwiki settings
	path = '~/vimwiki/',
	syntax = 'markdown',
	ext = '.md'
}}

g.instant_markdown_autostart = 0					-- Turns off auto preview
g.instant_markdown_browser = "brave"				-- Uses surf for preview

-- hyphenated words are one word
cmd [[set iskeyword+=-]]

-- Vimscript I don't know how to convert to lua
vim.api.nvim_exec([[
	filetype plugin indent on
	autocmd FileType html,css,jsx,tsx EmmetInstall
]], false)
