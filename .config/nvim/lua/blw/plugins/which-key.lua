return {
    {
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            local wk = require('which-key')
            wk.setup()

            -- Document existing key chains
            wk.add({
                { '<leader>b', group = 'Buffer' },
                { '<leader>c', group = 'Code' },
                { '<leader>r', group = 'Rename' },
                { '<leader>s', group = 'Search' },
                { '<leader>W', group = 'Workspace' },
                { '<leader>w', group = 'Window' },
                { '<leader>t', group = 'Toggle' },
                { '<leader>h', group = 'Git Hunk' },
                { '<leader>gh', group = 'Git Hunk', mode = 'v' },
            })
        end,
    },
}
