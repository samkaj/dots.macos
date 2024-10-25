local fn = vim.fn
local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

executable = function(cmd)
	return fn.executable(cmd) == 1
end

-- Open diagnostics with ctrl space
keymap.set("n", "<C-space>", function()
	diagnostic.open_float({ focusable = false })
end)

api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local float_opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			source = "always",
			prefix = " ",
		}

		if not vim.b.diagnostics_pos then
			vim.b.diagnostics_pos = { nil, nil }
		end

		local cursor_pos = api.nvim_win_get_cursor(0)
		if
			(cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
			and #diagnostic.get() > 0
		then
			diagnostic.open_float(nil, float_opts)
		end

		vim.b.diagnostics_pos = cursor_pos
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

if executable("clangd") then
	lspconfig.clangd.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		filetypes = { "c", "cpp", "cc", "h", "hpp" },
		flags = {
			debounce_text_changes = 500,
		},
		inlay_hints = {
			show_parameter_hints = true,
			parameter_hints_prefix = " ",
			other_hints_prefix = " ",
		},
	})
end

local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

lspconfig.basedpyright.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 500,
	},
	settings = {},
})

if executable("lua-language-server") then
	lspconfig.lua_ls.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("jdtls") then
	lspconfig.jdtls.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		filetypes = { "java" },
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("tsserver") then
	lspconfig.tsserver.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("gopls") then
	lspconfig.gopls.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

if executable("svelteserver") then
	lspconfig.svelte.setup({
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

lspconfig.codeqlls.setup({
	on_attach = custom_attach,
	settings = {
		additional_packs = { "/Users/samkaj/codeql/" },
	},
})

lspconfig.texlab.setup({})

capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup({
	capabilities = capabilities,
})
