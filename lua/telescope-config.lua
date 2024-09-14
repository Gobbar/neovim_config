require("telescope").setup {
	defaults = {
		file_ignore_patterns = {"node_modules"}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
			}

		}
	}
}

require("telescope").load_extension("ui-select")
vim.lsp.buf.code_action()
