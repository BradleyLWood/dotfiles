-- Load Lua Scripts ==========================================
require('plugins')
require('keymap')
require('options')

-- Plugin Configuration ======================================
require('config.cmp')
require('config.lsp')
require('config.null-ls')
require('config.treesitter')
require('config.telescope')
require('config.nvim-tree')
require('config.autopairs')
require('config.neogit')
require('config.which-key')
require('config.prettier')

-- Load Theme ================================================
require('themes.nord')
require('config.lualine')
