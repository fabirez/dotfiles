return {
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },

        config = function()
            local alpha = require 'alpha'
            local dashboard = require 'alpha.themes.startify'

            dashboard.section.header.val = {
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
            }

            alpha.setup(dashboard.opts)
        end,
    },

    -- Lualine

    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local mode = {
                'mode',
                fmt = function(str)
                    return ' ' .. str
                    --          return ' ' .. str:sub(1, 1) -- only first char
                end,
            }

            local filename = {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            }

            local hide_in_width = function()
                return vim.fn.winwidth(0) > 100
            end

            local diagnostics = {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                sections = { 'error', 'warn' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                colored = true,
                update_in_insert = false,
                always_visible = false,
                cond = hide_in_width,
            }

            local diff = {
                'diff',
                colored = true,
                symbols = { added = '', modified = '', removed = ' ' }, -- changes diff symbols
                cond = hide_in_width,
            }
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    --          theme = require 'plugins.themelualine',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '/', right = '/' },
                    disabled_filetypes = { 'alpha', 'neo-tree' },
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { mode },
                    lualine_b = { 'branch' },
                    lualine_c = { 'windows' },
                    lualine_x = {
                        diagnostics,
                        diff,
                        'filesize',
                        --            { 'encoding', cond = hide_in_width, padding = 1 },
                        --           { 'filetype', cond = hide_in_width, padding = 1 },
                    },
                    lualine_y = { 'selectioncount' },
                    lualine_z = { 'progress' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = { { 'location', padding = { top = 4, bottom = 4, right = 0, left = 0 } } },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { 'fugitive' },
            }
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '▏',
            },
            scope = {
                show_start = false,
                show_end = false,
                show_exact_scope = false,
            },
            exclude = {
                filetypes = {
                    'help',
                    'startify',
                    'dashboard',
                    'packer',
                    'neogitstatus',
                    'NvimTree',
                    'Trouble',
                },
            },
        },
    },
    {
        -- color highlighter
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },

    {
        --devicons
        'nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {
                override_by_extension = {
                    astro = {
                        icon = '',
                        color = '#EF8547',
                        name = 'astro',
                    },
                    js = {
                        icon = '',
                        color = '#F0DB4F',
                        name = 'javascript',
                    },

                    json = {
                        icon = '',
                        color = '#000000',
                        name = 'json',
                    },

                    jsonc = {
                        icon = '',
                        color = '#000000',
                        name = 'json',
                    },
                },
            }
        end,
    },
    -- {
    --     'HiPhish/rainbow-delimiters.nvim',
    --     config = function()
    --         local rainbow = require 'rainbow-delimiters.setup'
    --
    --         rainbow.setup {
    --             query = {
    --                 [''] = 'rainbow-delimiters',
    --                 lua = 'rainbow-blocks',
    --             },
    --             highlight = {
    --                 'RainbowDelimiterRed',
    --                 'RainbowDelimiterYellow',
    --                 'RainbowDelimiterBlue',
    --                 'RainbowDelimiterOrange',
    --                 'RainbowDelimiterGreen',
    --                 'RainbowDelimiterViolet',
    --                 'RainbowDelimiterCyan',
    --             },
    --         }
    --     end,
    -- },
}
