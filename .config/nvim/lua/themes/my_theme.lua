local M = {}

function M.setup()
    local palette = {
        red    = "#FD9B9B",
        red_2    = "#FD9B9B",

				-- orange_accent = "#ff5d73",
				orange_accent = "#fab387",

				green  = "#9BFDA5",
        green_accent = "#9BFDA5",
        green_100 = "#b3e8b4",


        azure  = "#9BBFFD",
        azure_2   = "#9BBFFD",
				azure_3  = "#FDFB9B",

        purple = "#A79AFC",

        white  = "#fffffc",
        black  = "#000000",
				gray_800 = "#171717",
				gray_400 = "#a3a3a3",
				gray = "#96a0a1",
    }

    local highlights = {
        -- Basic
        Normal       = { fg = palette.white, bg = palette.gray },
        -- Visual       = { bg = palette.},
        -- CursorLine   = { bg = palette.purple },
        LineNr       = { fg = palette.gray_400, },
        CursorLineNr = { fg = palette.orange_accent, bold = true },
				-- SignColumn   = { bg = palette.gray_800 },
        Comment      = { fg = palette.red, italic = false }, -- newTree labels
        Constant     = { fg = palette.red_2 },
        String       = { fg = palette.green_100 },
        Character    = { fg = palette.green },
        Number       = { fg = palette.red_2 },
        Boolean      = { fg = palette.red_2 },
        Identifier   = { fg = palette.azure_3 },
        Function     = { fg = palette.azure_2 },
        Statement    = { fg = palette.azure },
        Conditional  = { fg = palette.azure },
        Repeat       = { fg = palette.azure },
        Label        = { fg = palette.azure },
        Operator     = { fg = palette.green_accent },
        Keyword      = { fg = palette.azure },
        Exception    = { fg = palette.azure },
        PreProc      = { fg = palette.azure },
        Type         = { fg = palette.green_accent },
        Include      = { fg = palette.azure },
        Define       = { fg = palette.azure },
        Macro        = { fg = palette.azure },
        PreCondit    = { fg = palette.azure },
        StorageClass = { fg = palette.green_accent },
        Structure    = { fg = palette.green_accent },
        Typedef      = { fg = palette.green_accent },
        Special      = { fg = palette.azure_3 },
        SpecialChar  = { fg = palette.azure_3 },
        Tag          = { fg = palette.azure },
        Delimiter    = { fg = palette.white },
        SpecialComment = { fg = palette.purple },
        Debug        = { fg = palette.azure },

        -- UI
        Pmenu        = { bg = palette.black, fg = palette.white },
        PmenuSel     = { bg = palette.azure_2, fg = palette.black },
        PmenuSbar    = { bg = palette.purple },
        PmenuThumb   = { bg = palette.red_2 },
        WildMenu     = { bg = palette.green, fg = palette.black },
        VertSplit    = { fg = palette.azure_2 },
        StatusLine   = { fg = palette.white, bg = palette.purple },
        StatusLineNC = { fg = palette.white, bg = palette.black },
        TabLine      = { fg = palette.white, bg = palette.black },
        TabLineSel   = { fg = palette.black, bg = palette.azure_2 },
        Cursor       = { fg = palette.black, bg = palette.white },
        ErrorMsg     = { fg = palette.azure, bg = palette.black },
        WarningMsg   = { fg = palette.red_2, bg = palette.black },
        Question     = { fg = palette.azure_2, bg = palette.black },

        -- LSP
        LspReferenceText            = { bg = palette.purple },
        LspReferenceRead            = { bg = palette.green_accent, fg = palette.green_accent },
        LspReferenceWrite           = { bg = palette.purple },
        LspDiagnosticsDefaultError  = { fg = palette.azure },
        LspDiagnosticsDefaultWarning= { fg = palette.red_2 },
        LspDiagnosticsDefaultInformation = { fg = palette.azure_2 },
        LspDiagnosticsDefaultHint   = { fg = palette.azure },
				["@lsp.typemod.parameter.declaration.lua"] = {fg = palette.white },

        -- Diagnostic virtual text
        DiagnosticVirtualTextError  = { fg = palette.azure },
        DiagnosticVirtualTextWarn   = { fg = palette.red_2 },
        DiagnosticVirtualTextInfo   = { fg = palette.azure_2 },
        DiagnosticVirtualTextHint   = { fg = palette.azure },

        -- Treesitter
        ["@comment"] = { fg = palette.gray_400, italic = false },
        ["@constant"] = { fg = palette.red_2 },
        ["@string"] = { fg = palette.green_100 },
        ["@function"] = { fg = palette.green_accent },
        ["@variable"] = { fg = palette.azure },
        ["@keyword"] = { fg = palette.azure },
        ["@type"] = { fg = palette.azure},
        ["@field"] = { fg = palette.azure_3 },
        ["@property"] = { fg = palette.white },
        ["@number"] = { fg = palette.red_2 },


        -- Diff
        DiffAdd    = { bg = palette.green },
        DiffChange = { bg = palette.green_accent },
        DiffDelete = { bg = palette.azure },
        DiffText   = { bg = palette.azure_2 },

        -- Terminal
        TerminalNormal = { fg = palette.white, bg = palette.black },
        TerminalCursor = { fg = palette.black, bg = palette.white },

        -- Help
        helpCommand = { fg = palette.azure_2, bg = palette.black },
        helpExample = { fg = palette.green },
        helpKeyword = { fg = palette.red_2 },
        helpTitle   = { fg = palette.azure, bold = true },
    }

    for group, opts in pairs(highlights) do
				-- :h nvim_set_hl
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M

-- -- nvim_set_hl({ns_id}, {name}, {val})                            
-- -- :h nvim_set_hl
-- ----  {ns_id}  Namespace id for this highlight |nvim_create_namespace()|.
-- --          Use 0 to set a highlight group globally |:highlight|.
-- --          Highlights from non-global namespaces are not active by
-- --          default, use |nvim_set_hl_ns()| or |nvim_win_set_hl_ns()| to
-- --          activate them.
-- ---- {name}   Highlight group name, e.g. "ErrorMsg"
-- ---- {val}    Highlight definition map, accepts the following keys:
-- --          • fg: color name or "#RRGGBB", see note.
-- --          • bg: color name or "#RRGGBB", see note.
-- --          • sp: color name or "#RRGGBB"
-- --          • bold: boolean
-- --          • underline: boolean
-- --          • undercurl: boolean
-- --					• italic: boolean


