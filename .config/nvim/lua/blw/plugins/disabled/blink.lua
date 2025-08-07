return {
    'sghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'saghen/blink.compat', -- Compatibility layer for nvim-cmp sources
        {
            'supermaven-inc/supermaven-nvim',
            opts = {
                --disable_inline_completion = true, -- Disable inline completion for use with blink.cmp
                disable_keymaps = true, -- Disable default keymaps for manual control
            },
        },
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.comp.Config
    opts = {
        keymap = {
            preset = 'default',
            ['<M-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        },

        appearance = {
            nerd_font_variant = 'normal',
        },

        completion = {
            menu = {
                auto_show = true,
                border = 'single',
                winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
                draw = {
                    columns = {
                        { 'label', 'label_description', 'source_name', gap = 1 },
                        { 'kind_icon', 'kind' },
                    },
                },
            },
            documentation = {
                --auto_show = true,
                --auto_show_delay_ms = 500,
                window = {
                    border = 'single',
                },
            },
        },

        signature = {
            enabled = true,
            window = {
                border = 'single',
            },
        },

        cmdline = {
            keymap = { preset = 'inherit' },
            completion = {
                menu = {},
            },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'supermaven' },
            providers = {
                supermaven = {
                    name = 'supermaven',
                    module = 'blink.compat.source',
                    enabled = true,
                    opts = {},
                },
            },
        },

        fuzzy = {
            implementation = 'prefer_rust_with_warning',
            sorts = {
                'exact',
                'score',
                'sort_text',
            },
        },
    },
    opts_extend = { 'sources.default' },
}
