--lua vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd.colorscheme "carbonfox"

--light scheme
--lua vim.cmd.colorscheme "vscode"; vim.o.background = "light";
--lua vim.cmd.colorscheme "github_light_high_contrast"
--lua vim.cmd.colorscheme "catppuccin-latte"
--lua vim.cmd.colorscheme "oxocarbon"; vim.o.background = "light";

--lua vim.cmd.colorscheme "vscode"
--lua vim.cmd.colorscheme "gotham"
--lua vim.cmd.colorscheme "termschool"

require("lsp-config")
require("cmp-config")
require("telescope-config")
require("oil").setup()
require("neogit").setup {}


