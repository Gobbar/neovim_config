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
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {})
	vim.keymap.set('i', '<C-Space>', vim.lsp.codelens.run, {})
end

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach
		}
	end

	--function (server_name)
	--	local lspconfig = require("lspconfig")
	--	--if lspconfig == nil then
	--	--	return
	--	--end
	--	if server_name == "omnisharp" then
	--		--print(server_name)
	--		--lspconfig.omnisharp_mono.setup {}
	--		lspconfig[server_name].setup {
	--			cmd = { "dotnet", "C:\\Users\\mrale\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\libexec\\OmniSharp.dll" },
	--			on_attach = on_attach,
	--		}
	--	elseif server_name == "omnisharp_mono" then
	--		lspconfig[server_name].setup {
	--			on_attach = on_attach,
	--			cmd = { "omnisharp_mono" },
	--		}
	--	else
	--		print(server_name)
	--		lspconfig[server_name].setup {
	--			on_attach = on_attach
	--		}
	--	end
	--	--if lspconfig ~= nil and server_name == "omnisharp" then
	--	--	lspconfig.omnisharp_mono.setup {}
	--	--end
	--end
}
