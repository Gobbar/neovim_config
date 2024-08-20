require("telescope").setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {

			}

		}
	}
}
require("telescope").load_extension("ui-select")
vim.lsp.buf.code_action()
