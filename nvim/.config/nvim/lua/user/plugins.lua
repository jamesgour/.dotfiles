-- Plugins

-- Packer Plugin Manager
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Nvim Tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Bufferline
	use("akinsho/bufferline.nvim")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Colorschemes - change using :colorscheme <theme>
	use("morhetz/gruvbox") -- Gruvbox!
	-- use("luisiacc/gruvbox-baby") -- Treesitter support
	use("lunarvim/darkplus.nvim") -- VSCode Dark+
	-- use("folke/tokyonight.nvim") -- Tokyo Night
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out

	-- Autocompletion - cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions for cmp
	use("hrsh7th/cmp-nvim-lua") -- lua completions

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- Language Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("johnpapa/vscode-angular-snippets") -- Angular 13 Snippets
	use("1tontech/bootstrap4-snippets") -- Bootstrap 4 Snippets
	use("HansUXdev/B5-Snippets") -- Bootstrap 5 Snippets

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim") --Faster fuzzy finding
	use("BurntSushi/ripgrep") -- Required for live_grep & grep_string

	-- Harpoon
	use("ThePrimeagen/harpoon") -- Quicker file switching

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Easy Commenting & Todos
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("folke/todo-comments.nvim") -- TODO highlighting

	-- Autopairs / Surrounding / Indentation
	use("windwp/nvim-autopairs") -- Integrates with both cmp and treesitter
	use("tpope/vim-surround") -- Auto-surrounding
	use("lukas-reineke/indent-blankline.nvim") -- Indentation lines

	-- Git
	use("lewis6991/gitsigns.nvim") -- Colored lines for file changes like in VSCode

	-- Colorizer
	use("ap/vim-css-color") -- Highlight CSS color codes

	-- Assorted
	-- use("moll/vim-bbye") -- Helps with buffer deletion (Not needed)
	-- use("akinsho/toggleterm.nvim") -- Toggle a floating terminal (Not needed)
	-- use("ahmedkhalf/project.nvim") -- Some sort of project management tool
	-- use("lewis6991/impatient.nvim") -- Speed up Neovim start time
	-- use("goolord/alpha-nvim") -- Start screen for Neovim
	-- use("folke/which-key.nvim") -- Leader key menu

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
