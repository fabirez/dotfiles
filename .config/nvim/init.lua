require("keymaps")
require("settings")
require("autocommands")
require("usercommands")
require("plugins.statusline")

vim.lsp.enable('oxfmt-ls')
vim.lsp.enable('ts-ls')
vim.lsp.enable('astro-ls')
vim.lsp.enable('css-ls')
vim.lsp.enable('emmet-ls')
vim.lsp.enable('go-ls')
vim.lsp.enable('lua-ls')
vim.lsp.enable('py-ls')
vim.lsp.enable('tw-ls')

local function run_build(name, cmd, cwd)
	local result = vim.system(cmd, { cwd = cwd }):wait()
	if result.code ~= 0 then
		local stderr = result.stderr or ''
		local stdout = result.stdout or ''
		local output = stderr ~= '' and stderr or stdout
		if output == '' then output = 'No output from build command.' end
		vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
	end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if kind ~= 'install' and kind ~= 'update' then return end

		if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
			run_build(name, { 'make' }, ev.data.path)
			return
		end

		if name == 'LuaSnip' then
			if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
			return
		end

		if name == 'nvim-treesitter' then
			if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
			vim.cmd 'TSUpdate'
			return
		end
	end,
})

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  { src = gh "nvim-telescope/telescope.nvim" },
			{ src = gh "nvim-lua/plenary.nvim" },
	-- Autocompletion
	-- { src = gh "saghen/blink.cmp", version = vim.version.range "1.*" },
		{ src = gh "L3MON4D3/LuaSnip", version = vim.version.range "2.*" },

	-- Autoformat
	-- { src = gh "stevearc/conform.nvim" },
	-- General
  { src = gh "echasnovski/mini.nvim" },
  { src = gh "obsidian-nvim/obsidian.nvim" },
  { src = gh "MeanderingProgrammer/render-markdown.nvim" },
		-- Highlight, edit, and navigate code
		{ src = gh "nvim-treesitter/nvim-treesitter" }, 
		
	-- colorscheme 
  { src = gh "rose-pine/neovim" },
  { src = gh "folke/tokyonight.nvim" },


})

-- config of plugins
require("plugins.telescope")
require("plugins.colorscheme")
require("plugins.obsidian")
require("plugins.treesitter")

-- require("plugins.autoformat")

