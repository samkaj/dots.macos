require("codeql").setup({
	results = {
		max_paths = 10,
		max_path_depth = nil,
	},
	panel = {
		width = 50,
		pos = "botright",
		group_by = "sink", -- "source"
		show_filename = true,
		long_filename = false,
		context_lines = 3,
	},
	max_ram = 8000,
	job_timeout = 15000,
	format_on_save = true,
	mappings = {
		run_query = { modes = { "n" }, lhs = "<space>qr", desc = "run query" },
		quick_eval = { modes = { "x", "n" }, lhs = "<space>qe", desc = "quick evaluate" },
		quick_eval_predicate = { modes = { "n" }, lhs = "<space>qp", desc = "quick evaluate enclosing predicate" },
	},
})
