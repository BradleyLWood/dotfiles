return {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    --ft = 'markdown',
    event = {
        'BufReadPre ' .. vim.fn.expand('~') .. '/notes/*/*.md',
        'BufNewFile ' .. vim.fn.expand('~') .. '/notes/*/*.md',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        workspaces = {
            {
                name = 'vault',
                path = '~/notes/vault',
            },
            {
                name = 'work',
                path = '~/notes/work',
            },
        },
        templates = {
            folder = 'Templates',
            date_format = '%Y-%m-%d-%a',
            time_format = '%H:%M',
        },
    },
    ui = { enable = false, },
}
