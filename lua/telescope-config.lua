require("telescope").setup {
	defaults = {
		file_ignore_patterns = {"node_modules"},
		layout_strategy = "center",
		layout_config = {
			center = { width = 0.95, height = 0.20 },
		}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
			}

		},
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		}
	}
}

require("telescope").load_extension("ui-select")
vim.lsp.buf.code_action()
