return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        --preset = 'obsidian',
        max_file_size = 10.0,
        debounce = 200,
        checkbox = {
            enabled = false,
            bullet = false,
            --right_pad = 1,
            --unchecked = { icon = '☐' },
            --checked = { icon = '☑' },
        },
        bullet = {
            left_pad = 2,
            right_pad = 1,
        },
    },
}
