require("keymaps")
require("settings")
require("plugins.statusline")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

---@type vim.Option
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- defaults = {
	-- 	-- By default, only LazyVim plugins will be lazy-loaded.
	-- 	-- Your custom plugins will load during startup.
	-- 	-- If you know what you're doing,
	-- 	-- you can set this to `true` to have all your custom plugins lazy-loaded by default.
	-- 	lazy = false,
	-- 	-- It's recommended to leave version=false for now,
	-- 	-- since a lot the plugin that support versioning,
	-- 	-- have outdated releases, which may break your Neovim install.
	-- 	version = false, -- always use the latest git commit
	-- 	-- version = "*", -- try installing the latest stable version for plugins that support semver
	-- },
	-- install = {
	-- 	-- install missing plugins on startup. This doesn't increase startup time.
	-- 	missing = true,
	-- 	-- try to load one of these colorschemes on startup
	-- 	colorscheme = { "lunaperche" } 
	-- },
	-- checker = {
	-- 	enabled = false, -- check for plugin updates periodically
	-- 	notify = false, -- notify on update
	-- }, -- automatically check for plugin updates
	-- performance = {
	-- 	rtp = {
	-- 		-- disable some rtp plugins
	-- 		disabled_plugins = {
	-- 			"gzip",
	-- 			-- "matchit",
	-- 			-- "matchparen",
	-- 			-- "netrwPlugin",
	-- 			"tarPlugin",
	-- 			"tohtml",
	-- 			"tutor",
	-- 			"zipPlugin",
	-- 		},
	-- 	},
	-- },
	-- spec = {
	-- 	{ import = "plugins" },
	-- },
	require('plugins.colorscheme'),
	require('plugins.flash'),
	require('plugins.sorround'),
	require('plugins.telescope'),
	require('plugins.treesitter'),
	require('plugins.lsp'),
	require('plugins.autocompletion'),
})
