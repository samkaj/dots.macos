-- In your init.lua or plugin config file
require("lualine").setup({
	options = {
		theme = "auto", -- or 'dracula', 'tokyonight', or your preferred theme
		section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		icons_enabled = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { { "mode", upper = true } },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{ "filename", file_status = true, path = 0 }, -- 0 = just filename, 1 = relative path, 2 = absolute path
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", file_status = true, path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive", "nvim-tree" },
})
