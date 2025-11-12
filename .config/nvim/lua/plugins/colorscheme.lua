return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            term_colors = true,
            transparent_background = true,
            -- transparent_background = false,
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = 'dark',
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                harpoon = true,
                telescope = true,
                mason = true,
                noice = true,
                notify = true,
                which_key = true,
                fidget = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { 'italic' },
                        hints = { 'italic' },
                        warnings = { 'italic' },
                        information = { 'italic' },
                    },
                    underlines = {
                        errors = { 'underline' },
                        hints = { 'underline' },
                        warnings = { 'underline' },
                        information = { 'underline' },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                mini = {
                    enabled = true,
                    indentscope_color = '',
                },
            },
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
            -- vim.cmd.colorscheme 'catppuccin-mocha'
        end,
    },

    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('cyberdream').setup {
                -- Recommended - see "Configuring" below for more config options
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                borderless_telescope = true,
                terminal_colors = true,
            }
            -- vim.cmd 'colorscheme cyberdream' -- set the colorscheme
        end,
    },
    {
        'rebelot/kanagawa.nvim',

        config = function()
            require('kanagawa').setup {
                compile = false, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = true, -- do not set background color
                -- transparent = false,
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = { -- add/modify theme and palette colors

                    palette = {},
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = 'none',
                            },
                        },
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat = { bg = 'none' },
                        FloatBorder = { bg = 'none' },
                        FloatTitle = { bg = 'none' },

                        -- Save an hlgroup with dark background and dimmed foreground
                        -- so that you can use it where your still want darker windows.
                        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        -- Popular plugins that open floats will link to NormalFloat by default;
                        -- set their background accordingly if you wish to keep them dark and borderless
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        TelescopeTitle = { fg = theme.ui.special, bold = true },
                        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                    }
                end,
                theme = 'dragon', -- Load "wave" theme when 'background' option is not set
                background = { -- map the value of 'background' option to a theme
                    -- dark = 'wave', -- try "dragon" !
                    dark = 'dragon',
                    light = 'lotus',
                },
            }
            -- vim.cmd 'colorscheme kanagawa-wave'
        end,
    },
    {
        'folke/tokyonight.nvim',
        config = function()
            require('tokyonight').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = 'day', -- The theme is used when the background is set to light
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
                    sidebars = 'transparent', -- style for sidebars, see below
                    floats = 'dark', -- style for floating windows
                },
                sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
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
            }
            -- vim.cmd 'colorscheme tokyonight'
        end,
    },
    {
        'tiagovla/tokyodark.nvim',
        opts = {
            -- transparent_background = true,
            transparent_background = false,
            -- custom options here
        },
        config = function(_, opts)
            require('tokyodark').setup(opts) -- calling setup is optional
            -- vim.cmd [[colorscheme tokyodark]]
        end,
    },
    {
        '0xstepit/flow.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require('flow').setup {
                transparent = true,
                fluo_color = 'orange',
                mode = 'normal',
                aggressive_spell = true,
            }
            -- vim.cmd 'colorscheme flow'
        end,
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup {
                variant = 'auto', -- auto, main, moon, or dawn
                dark_variant = 'main', -- main, moon, or dawn
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
                    border = 'muted',
                    link = 'iris',
                    panel = 'surface',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    note = 'pine',
                    todo = 'rose',
                    warn = 'gold',

                    git_add = 'foam',
                    git_change = 'rose',
                    git_delete = 'love',
                    git_dirty = 'rose',
                    git_ignore = 'muted',
                    git_merge = 'iris',
                    git_rename = 'pine',
                    git_stage = 'iris',
                    git_text = 'rose',
                    git_untracked = 'subtle',

                    h1 = 'iris',
                    h2 = 'foam',
                    h3 = 'rose',
                    h4 = 'gold',
                    h5 = 'pine',
                    h6 = 'foam',
                },

                palette = {
                    -- Override the builtin palette per variant
                    --c3e88d for string ?
                    main = {
                        --- Main colors
                        ---b3e8b4 green
                        ---f77685 red
                        ---ffcda5 orange
                        ---9ecbff azure
                        ---b392f0 purple
                        ---d1e6ff white/azure
                        ---d7ffa5 yellow
                        ---F06080 red-light
                        ---d1d4c7 gray
                        pine = '#b392f0', -- main keywords (function, return, if else....)
                        foam = '#ff4a6b', -- variables (parameter, arguments, nested methods) x2
                        gold = '#b3e8b4', -- strings x2
                        text = '#9ecbff', --strings and number of columns:selected
                        rose = '#9ccfd8', -- keywords (boolean) and nested function
                        iris = '#00ffd2', -- Special Comments  ( NOTE:)
                        -- base = '#24292e', --bg
                        base = '#24292e', --bg
                        subtle = '#636b74', --comments,brackets, operators
                        --- Secondary ?
                        surface = '#24292e', -- lines between {}, bg autosuggesiotn, telescope etc..
                        overlay = '#2b3036', --  bg cursor
                        muted = '#636b74', -- relative number color
                        -- love = '#f77685', -- variables
                        love = '#c88f99', -- variables
                        leaf = '#2D9FA5',
                        highlight_low = '#EDD2B2',
                        highlight_med = '#2D9FA5',
                        highlight_high = '#929aa5',
                    },
                },

                -- NOTE: Highlight groups are extended (merged) by default. Disable this
                -- per group via `inherit = false`
                highlight_groups = {
                    -- StatusLine = { fg = "love", bg = "love", blend = 15 },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                    -- Visual = { fg = "base", bg = "text", inherit = false },
                    ---- Set background color for current line number (optional)
                    LineNr = { bg = '#000000', fg = '#636b74' },
                    CursorLineNr = { bg = '#000000', fg = '#9ecbff' },
                    ['@markup.strong'] = { bold = true },
                    ['@markup.italic'] = { italic = true },
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
            }

            -- vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
            vim.cmd 'colorscheme rose-pine'
        end,
    },
}
