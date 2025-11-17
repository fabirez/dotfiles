-- local C  = {};
--
-- function C.setup ()
-- 	print("hello");
--
--
-- 	 Palette = {
-- 		red = "#780000"
-- 	},
--
--
--
-- vim.api.nvim_set_hl(0, 'Visual', {fg= Palette.red})
--
-- end
--
-- --  C.setup()
-- return C
--
--

-- How can i see the fucking colorscheme ??
-- WHere awe can decalre the na me fo ti??
-- How can i set it.

local M = {}

function M.setup()

	 local palette = {
		red = "#ffb703",
	}

	-- highlights
	-- {name} = {val}
	local highlights = {
		Visual =  {fg = palette.red},
		Normal =  {fg = palette.red}
	}


	for name, val in pairs(highlights) do
		vim.api.nvim_set_hl(0, name, val)
	end

end
return M



--
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
--
