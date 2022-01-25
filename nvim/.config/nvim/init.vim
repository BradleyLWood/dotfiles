" Load Plugins ==============================================
runtime ./plugins.vim

" Load Theme ================================================
"runtime ./themes/gruvbox.vim
runtime ./themes/nord.vim
"runtime ./themes/onedark.vim
"runtime ./themes/solarized.vim

" Load Lua Scripts ==========================================
lua require('lsp-config.servers')
lua require('lsp-config.autocomplete')
lua require('luasnip-config')
lua require('telescope-config')
lua require('treesitter-config')
lua require('nvim-tree-config')
lua require('autopairs-config') 
lua require('gitsigns-config')
lua require('rest-nvim-config')
lua require('lualine-config')
lua require('which-key-config')
lua require('keymap-config')
lua require('options')
