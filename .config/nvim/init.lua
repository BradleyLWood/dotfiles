vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 100

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.wo.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- NOTE: Make sure terminal supports this
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

local TAB_WIDTH = 4
vim.opt.tabstop = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Allow selection of empty space in line block mode
vim.opt.virtualedit = 'block'

-- Don't move cursor when appending line below
vim.keymap.set('n', 'J', 'mzJ`z')
-- Keep cursor centered for half page jump
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Keep cursor centered for searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move selected lines up and down with <Shift>jk
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-n><C-n>', ':set number!<CR>', {})
vim.keymap.set('n', '<C-m><C-m>', ':set relativenumber!<CR>', {})

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
vim.keymap.set('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"', { noremap = true, silent = true, expr = true })
vim.keymap.set('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"', { noremap = true, silent = true, expr = true })

-- Q - "Worst place in the universe." ~ThePrimeagen
vim.keymap.set('n', 'Q', '<nop>')

-- Execute tmux-sessionizer
vim.keymap.set('n', '<M-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- QuickFix List
vim.keymap.set('n', '<leader>ql', ':copen<cr>', { noremap = true, silent = true, desc = 'Open QFL' })
vim.keymap.set('n', '<leader>qd', ':cclose<cr>', { noremap = true, silent = true, desc = 'Close QFL' })
vim.keymap.set('n', '<leader>qn', ':cnext<cr>', { noremap = true, silent = true, desc = 'Next QFL item' })
vim.keymap.set('n', '<leader>qp', ':cprev<cr>', { noremap = true, silent = true, desc = 'Prev QFL item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Windows
-- Easier to use <leader>w then <C-w>
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
vim.keymap.set('n', '<leader>wn', '<C-w>n', { desc = 'New window' })

vim.keymap.set('n', '<leader>ww', '<C-w>p', { desc = 'Switch to previous window' })

vim.keymap.set('n', '<leader>ws', ':split<CR><C-w>w', { desc = 'Split' })
vim.keymap.set('n', '<leader>wvs', ':vsplit<CR><C-w>w', { desc = 'Vertifcal split' })

vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Switch to down window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Switch to up window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })

-- Buffers
vim.keymap.set('n', '<leader>bj', ':bnext<CR>', { desc = 'Next' })
vim.keymap.set('n', '<leader>bk', ':bprevious<CR>', { desc = 'Previous' })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = 'List buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Import custom plugins from lua/blw/plugins
  { import = 'blw.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
