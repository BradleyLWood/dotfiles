vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Ex file manager' })

-- J and K in visual mode to move lines up and down and indent correctly
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Don't move cursor when appending line below
vim.keymap.set('n', 'J', 'mzJ`z')
-- Keep cursor centered for half page jump
vim.keymap.set('n','<C-d>', '<C-d>zz')
vim.keymap.set('n','<C-u>', '<C-d>zz')
-- Keep cursor centered for searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<C-n><C-n>', ':set number!<CR>', {})
vim.keymap.set('n', '<C-m><C-m>', ':set relativenumber!<CR>', {})

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
vim.keymap.set('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"',
    { noremap = true, silent = true, expr = true })
vim.keymap.set('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"',
    { noremap = true, silent = true, expr = true })

-- Yank to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- Delete without yank
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', {})
vim.keymap.set({'n', 'v'}, 'x', '"_x', {})

-- Don't put pasted over content in the paste register
vim.keymap.set('x', '<leader>p', '"_dP', {})

-- Q - worst place in the universe
vim.keymap.set('n', 'Q', '<nop>')

-- TODO: Figure out how this works
-- FIXME: Doesn't work
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat' })

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Quick-fix list navigation
vim.keymap.set('n', '<leader><C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<leader><C-j>', '<cmd>cprev<CR>zz')
-- Local list navigation
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Windows
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
vim.keymap.set('n', '<leader>wn', '<C-w>n', { desc = 'New window' })

vim.keymap.set('n', '<leader>ww', '<C-w>p', { desc = 'Switch to previous window' })

vim.keymap.set('n', '<leader>ws', ':split<CR><C-w>w', { desc = 'Split' })
vim.keymap.set('n', '<leader>wvs', ':vsplit<CR><C-w>w', { desc = 'Vertifcal split' })

vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Switch to down window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Switch to up window' })

-- Buffers
vim.keymap.set('n', '<leader>bj', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bk', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = 'List buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close buffer' })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- expand or minimize current buffer in a more natural direction (tmux-like)
-- ':resize <+-n>' or ':vert resize <+-n>' increases or decreasese current
-- window horizontally or vertically. When mapped to '<leader><arrow>' this
-- can get confusing as left might actually be right, etc
-- the below can be mapped to arrows and will work similar to the tmux binds
-- map to: "<cmd>lua require'utils'.resize(false, -5)<CR>"
local resize = function(vertical, margin)
    local cur_win = vim.api.nvim_get_current_win()
    -- go (possibly) right
    vim.cmd(string.format("wincmd %s", vertical and "l" or "j"))
    local new_win = vim.api.nvim_get_current_win()

    -- determine direction cond on increase and existing right-hand buffer
    local not_last = not (cur_win == new_win)
    local sign = margin > 0
    -- go to previous window if required otherwise flip sign
    if not_last == true then
        vim.cmd [[wincmd p]]
    else
        sign = not sign
    end

    local sign_str = sign and "+" or "-"
    local dir = vertical and "vertical " or ""
    local cmd = dir .. "resize " .. sign_str .. math.abs(margin) .. "<CR>"
    vim.cmd(cmd)
end

-- tmux like directional window resizes
vim.keymap.set("n", "<leader><Up>", "<cmd>lua require'utils'.resize(false, -5)<CR>",
    { silent = true, desc = "horizontal split increase" })
vim.keymap.set("n", "<leader><Down>", "<cmd>lua require'utils'.resize(false,  5)<CR>",
    { silent = true, desc = "horizontal split decrease" })
vim.keymap.set("n", "<leader><Left>", "<cmd>lua require'utils'.resize(true,  -5)<CR>",
    { silent = true, desc = "vertical split decrease" })
vim.keymap.set("n", "<leader><Right>", "<cmd>lua require'utils'.resize(true,   5)<CR>",
    { silent = true, desc = "vertical split increase" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
