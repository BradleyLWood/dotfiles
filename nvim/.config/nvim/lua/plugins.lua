-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end
execute 'packadd packer.nvim'

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Color Schemes
    use { 'shaunsingh/nord.nvim' }
    use { "ellisonleao/gruvbox.nvim" }
    use { 'Mofiqul/dracula.nvim' }
    use { 'folke/tokyonight.nvim' }
    use { 'navarasu/onedark.nvim' }

    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'tami5/lspsaga.nvim' }
    use { 'onsails/lspkind-nvim' }
    use { 'ray-x/lsp_signature.nvim' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { 'MunifTanjim/prettier.nvim' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'nvim-treesitter/playground' }
    --use 'nvim-treesitter/nvim-treesitter-textobjects'

    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-fzy-native.nvim' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    use { 'ThePrimeagen/harpoon' }

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { 'lewis6991/gitsigns.nvim' }

    use { 'mfussenegger/nvim-dap' }
    use { 'David-Kunz/jester' }

    use { "windwp/nvim-autopairs" }

    use { 'folke/which-key.nvim' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'mattn/emmet-vim' }
    use { 'mbbill/undotree' }
    use { 'NTBBloodbath/rest.nvim' }
    use { 'norcalli/nvim-colorizer.lua' }

    use { 'tpope/vim-surround' }
    use { 'tpope/vim-commentary' }

    --use { 'onsails/diaglist.nvim' }
    use { 'simrat39/symbols-outline.nvim' }

    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }

    -- Status Line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }
end)
