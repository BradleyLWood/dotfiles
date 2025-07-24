return {
    {
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.

        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

        --'folke/tokyonight.nvim',
        'catppuccin/nvim',
        name = 'catppuccin',
        --'rose-pine/neovim', name = 'rose-pine',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        init = function()
            --vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.colorscheme('catppuccin')
            --vim.cmd.colorscheme 'rose-pine'

            -- You can configure highlights by doing something like:
            vim.cmd.hi('Comment gui=none')
        end,
    },
}
