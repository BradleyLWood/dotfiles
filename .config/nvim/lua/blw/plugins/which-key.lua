return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>b', group = '[B]uffer' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>W', group = '[W]orkspace' },
        { '<leader>w', group = '[W]indow' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk' },
        { '<leader>gh', group = '[G]it [H]unk', mode = 'v' },
      }
    end,
  },
}
