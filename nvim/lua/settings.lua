-- Leader is space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.copilot_filetypes = { markdown = false, tex = false }

vim.cmd([[ autocmd FileType tex set textwidth=80 ]])
vim.cmd([[ autocmd FileType md set textwidth=80 ]])
-- enable spell check for tex and md files 
vim.cmd([[ autocmd FileType tex setlocal spell ]])
vim.cmd([[ autocmd FileType md setlocal spell ]])

vim.cmd([[let g:neoformat_enabled_javascript = ['prettier'] ]])

-- Spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- :Wq, Xa, etc. remaps
vim.cmd("command! Wq wq")
vim.cmd("command! W w")
vim.cmd("command! Q q")
vim.cmd("command! X x")
vim.cmd("command! Xa xa")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- Open file explorer
vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fr", ":vspl<CR><Esc>:Ex<CR>", { noremap = true })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fc", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end, opts)

-- Format
vim.api.nvim_set_keymap("n", "<leader>p", ":Neoformat<CR>", { noremap = true })

-- IncRename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- Ouroboros
vim.keymap.set("n", "<leader>oo", ":Ouroboros<CR>")

-- Harpoon
vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<leader>hc", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })

-- No header
vim.cmd("let g:netrw_banner = 0")
vim.cmd("set noshowmode")

-- Yank into system clipboard
vim.opt.clipboard = "unnamedplus"

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})
