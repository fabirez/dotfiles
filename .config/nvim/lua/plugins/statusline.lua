StatusLine = {}

-- Highlights
vim.api.nvim_set_hl(0, "StatusLineL0", { fg = "#ffffff", bg = "#FF6467", bold = false })
vim.api.nvim_set_hl(0, "StatusLineL1", { fg = "#ffffff", bg = "#FF8904", bold = false })
vim.api.nvim_set_hl(0, "StatusLineL2", { fg = "#ffffff", bg = "#FFD230", bold = false })
vim.api.nvim_set_hl(0, "StatusLineL3", { fg = "#ffffff", bg = "#FFDF20", bold = false })
vim.api.nvim_set_hl(0, "StatusLineL4", { fg = "#ffffff", bg = "#9ae600", bold = false })
vim.api.nvim_set_hl(0, "StatusLineL5", { fg = "#ffffff", bg = "#000000", bold = false })

-- Create statusline
function StatusLine.active()
	return "%{statuslineV0} %q%< %f%< %#StatusLineL5#%h%m%r%=%b %#StatusLineL5#0x%B %#StatusLineL5#%l %#StatusLineL5#%c%V %#StatusLineL5#%P"
end

function StatusLine.delete()
	return " %t"
end


-- Creating a group
group = vim.api.nvim_create_augroup('statusLineActive', {clear = true})



-- Use nvim.api to create the statusline
vim.api.nvim_create_autocmd({'BufEnter', 'WinEnter'}, {
group =  group,
callback = function()
	vim.opt.statusline = "%!v:lua.StatusLine.active()"
end
})



vim.api.nvim_create_autocmd({'BufLeave', 'WinLeave'}, {
group =  group,
callback = function ()
	vim.opt.statusline = "%!:lua.StatusLine.delete()"
end
})
