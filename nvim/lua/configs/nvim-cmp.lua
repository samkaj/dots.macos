--* nvim-cmp configs *--
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    ["<Esc>"] = cmp.mapping.close(),
	}),
	window = {
		width = 60,
		height = 15,
		completion = cmp.config.window.bordered("rounded"),
		documentation = cmp.config.window.bordered("rounded"),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 2 },
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
})
