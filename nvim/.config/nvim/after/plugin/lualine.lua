require('lualine').setup {
    options = {
        icons_enabled = true,
        --theme = 'onedark',
        theme = 'nord',
        component_separators = '|',
        section_separators = '',
    },
    sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end, color={bg='#B48EAD'} } },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { },
        lualine_z = { 'location' }
    },
}
