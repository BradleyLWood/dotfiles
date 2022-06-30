-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Color Schemes
    use 'nvim-lualine/lualine.nvim'
	use 'gruvbox-community/gruvbox'
	use 'joshdick/onedark.vim'
	use 'lifepillar/vim-solarized8'
	use 'shaunsingh/nord.nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind-nvim'
	use 'ray-x/lsp_signature.nvim'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

    use { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }
    use('MunifTanjim/prettier.nvim')

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'
	use 'nvim-treesitter/playground'
    --use 'nvim-treesitter/nvim-treesitter-textobjects'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-fzy-native.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'

    use 'ThePrimeagen/harpoon'

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'folke/which-key.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'mattn/emmet-vim'
	use 'mbbill/undotree'
	use 'NTBBloodbath/rest.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'Pocco81/TrueZen.nvim'
end)
