require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require("mason-lspconfig").setup()
require("roslyn").setup()

local on_attach = function(_, _)
	--vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {})
	vim.keymap.set('i', '<C-Space>', vim.lsp.codelens.run, {})
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
end

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach
		}
	end
}
