return {
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				light_style = "day", -- The theme is used when the background is set to light
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

				--- You can override specific color groups to use other groups or a hex color
				--- function will be called with a ColorScheme table
				---@param colors ColorScheme
				on_colors = function(colors) end,

				--- You can override specific highlights to use other groups or a hex color
				--- function will be called with a Highlights and ColorScheme table
				---@param highlights Highlights
				---@param colors ColorScheme
				on_highlights = function(highlights, colors) end,
			}),
			-- vim.cmd 'colorscheme tokyonight'
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				palette = {
					-- Override the builtin palette per variant
					--c3e88d for string ?
					main = {
						-- pine = '#9ecbff', -- main keywords (function, return, if else....)
						-- foam = '#f77685', -- variables (parameter, arguments, nested methods) x2
						-- gold = '#faaa75', -- strings x2
						-- text = '#d1d4c7', -- strings and number of columns:selected
						-- rose = '#79bfff', -- keywords (boolean) and nested function
						-- iris = '#b392f0', -- Special Comments  ( NOTE:)
						-- base = '#1C1C1C', -- bg
						-- subtle = '#5F5F87', --comments,brackets, operators
						------
						-- Secondary
						--------
						-- surface = '#24292e', -- lines between {}, bg autosuggesiotn, telescope etc..
						-- overlay = '#2b3036', --  bg cursor
						-- muted = '#636b74', -- relative number color
						-- love = '#f77685', -- variables
						-- love = '#c88f99', -- variables
						-- leaf = '#2D9FA5',
						-- highlight_low = '#EDD2B2',
						-- highlight_med = '#2D9FA5',
						-- highlight_high = '#929aa5',
					},
				},

				-- NOTE: Highlight groups are extended (merged) by default. Disable this
				-- per group via `inherit = false`
				highlight_groups = {
					-- StatusLine = { fg = "love", bg = "love", blend = 15 },
					-- VertSplit = { fg = "muted", bg = "muted" },
					-- Visual = { fg = "base", bg = "text", inherit = false },
					---- Set background color for current line number (optional)
					LineNr = { bg = "#16191d", fg = "#636b74" },
					CursorLineNr = { bg = "#16191d", fg = "#9ecbff" },
					["@markup.strong"] = { bold = true },
					["@markup.italic"] = { italic = true },
					-- ['@spell.markdown'] = {fg='#d1e6ff'},
					-- markdownH3 = {fg= '#ff0000' }
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			}),
				vim.cmd("colorscheme rose-pine-moon")
}

