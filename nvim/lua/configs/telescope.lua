local no_preview = function()
	return require("telescope.themes").get_dropdown({
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},
		width = 0.8,
		previewer = false,
		prompt_title = false,
	})
end

require("telescope").setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},
	},
	pickers = {
		find_files = no_preview(),
		buffers = no_preview(),
		oldfiles = no_preview(),
		live_grep = no_preview(),
		git_files = no_preview(),
	},
})
