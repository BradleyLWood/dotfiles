require('lualine').setup{
    options = {
        theme = 'auto',
        --theme = 'dracula-nvim',
        --theme = 'gruvbox',
        --theme = 'nord',
        --theme = 'onedark',
        section_separators = { left = '', right = ''},
        extensions = {
            'fzf',
            'nvim-dap-ui',
            'nvim-tree',
            'quickfix',
        }
    },
    sections = {
        lualine_a = {'✝', 'mode'},
        lualine_b = {
            'branch',
            {'diff',
                symbols = {
                    added = '+',
                    modified = '~',
                    removed = '-'
                }
            },
            'diagnostics'
        },
        lualine_c = {
            {
                'filename',
                symbols = {
                    modified = ' 📝 ',      -- Text to show when the file is modified.
                    readonly = ' 🚫 ',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '-----', -- Text to show for unnamed buffers.
                }
            }
        },
        lualine_z = {'location'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'}
    }
}
