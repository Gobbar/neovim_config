--vim.lsp.start({
--	name = "angular",
--	cmd = {
--		"ngserver --stdio --tsProbeLocations %%USERPROFILE%%\\AppData\\Roaming\\npm\\node_modules --ngProbeLocations %%USERPROFILE%%\\AppData\\Roaming\\npm\\node_modules",
--	},
--	root_dir = vim.fs.dirname(vim.fs.find({"project.json"}, { upward = true })[1]),
--})

--require('mason').setup()
--require('mason-lspconfig').setup()
----require('mason-lspconfig').setup_handlers()
--require('mason-lspconfig').setup_handlers {
--	function(server_name)
--		require('lspconfig')[server_name].setup {}
--	end,
--}
--require('lspmappings')


require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = function(_, _)
	--vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})
	vim.keymap.set('n', '<Leader>gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, {})
	vim.keymap.set('i', '<C-Space>', vim.lsp.codelens.run, {})
end

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach
		}
	end
}
