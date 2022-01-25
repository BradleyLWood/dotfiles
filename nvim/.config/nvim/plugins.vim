call plug#begin('~/.vim/plugged')
	
	" Color Schemes =============================================
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'gruvbox-community/gruvbox'
	Plug 'joshdick/onedark.vim'
	Plug 'lifepillar/vim-solarized8'
	Plug 'shaunsingh/nord.nvim'
	
	" LSP =======================================================
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind-nvim'
	Plug 'ray-x/lsp_signature.nvim'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
	
	" Git =======================================================
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'mattn/vim-gist'
	Plug 'mattn/webapi-vim'
	
	" Telescope =================================================
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	
	" Treesitter=================================================
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'
	
	" Tools =====================================================
	Plug 'ellisonleao/glow.nvim'
	"Plug 'evanleck/vim-svelte', {'branch': 'main'}
	Plug 'folke/which-key.nvim'
	Plug 'kshenoy/vim-signature'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'mattn/emmet-vim'
	Plug 'mbbill/undotree'
	Plug 'NTBBloodbath/rest.nvim'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'Pocco81/TrueZen.nvim'
	Plug 'sbdchd/neoformat'
	Plug 'simrat39/symbols-outline.nvim'
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
	Plug 'ThePrimeagen/harpoon'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'vimwiki/vimwiki'
	Plug 'voldikss/vim-floaterm'
	Plug 'windwp/nvim-autopairs'
	
call plug#end()
