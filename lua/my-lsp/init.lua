--vim.lsp.start({
--	name = "angular",
--	cmd = {
--		"ngserver --stdio --tsProbeLocations %%USERPROFILE%%\\AppData\\Roaming\\npm\\node_modules --ngProbeLocations %%USERPROFILE%%\\AppData\\Roaming\\npm\\node_modules",
--	},
--	root_dir = vim.fs.dirname(vim.fs.find({"project.json"}, { upward = true })[1]),
--})
require('mason').setup()
require('mason-lspconfig').setup()
--require('mason-lspconfig').setup_handlers()
require('mason-lspconfig').setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {}
	end,
}
--require('lspmappings')
