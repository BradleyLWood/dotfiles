local wk = require('which-key')

wk.setup({
	window = {
		border = "single",
	},
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		["<space>"] = "SPACE",
		--["<cr>"] = "ENTER",
		--["<tab>"] = "TAB",
	},
	show_help = false,
})

wk.register({
	["<Leader>"] = {
		["<Space>"] = { "Clear search highlight" },

		-- Telescope
		f = {
			name = "Telescope",
			f = { "Find file" },
			d = { "File browser"},
			r = { "Open recent file" },
			g = { "Grep" },
			b = { "Buffers" },
			h = { "Help tags" },
		},

		-- NvimTree
		n = {
			name = "NvimTree",
			t = { "File tree" },
			f = { "Select" },
			r = { "Refresh" },
		},

		-- Harpoon
		a = { "Mark harpoon file" },
		h = { 
			name = "Harpoon & GitSigns",
			l = { "Harpoon file menu" },
			c = { "Harpoon command menu" },
		},

		-- Buffers
		b = {
			name = "Buffers",
			j = { "Next buffer" },
			k = { "Prev buffer" },
		},

		-- Tabs
		t = {
			name = "Tabs",
			e = { "Open" },
			j = { "Next tab" },
			k = { "Prev tab" },
		},

		-- Markdown
		m = {
			name = "Markdown",
			d = { "Markdown preview" },
			s = { "Stop markdown Preview" },
		},

		-- Splits
		s = {
			name = "Split",
			v = { "Vertical" },
			s = { "Horizontal" },
		},

		-- VimWiki
		w = {
			name = "Wiki",
			i = { "Diary" },
			s = { "Select" },
			t = { "Tab index" },
			w = { "Index" },
			["<Space>"] = {
				i = { "Diary generate links" },
				m = { "Make tomorrow diary note" },
				t = { "Make tab diary note" },
				w = { "Make diary note" },
				y = { "Make yesterday diary note" },
			},
		},

		r = {
			name = "Resize",
			p = { "Resize to 100%" },
		},

		j = { "Next local list item" },
		k = { "Prev local list item" },

		d = { "Delete without yank" },
	},

	["<C-w>"] = {
		["<C-h>"] = { "Increase width" },
		["<C-j>"] = { "Increase height" },
		["<C-k>"] = { "Decrease height" },
		["<C-l>"] = { "Decrease width" },
	},
})
