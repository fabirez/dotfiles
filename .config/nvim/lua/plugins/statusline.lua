StatusLine = {}

-- Highlights
vim.api.nvim_set_hl(0, "StatusLineL0", { fg = "#ffffff", bold = false })
vim.api.nvim_set_hl(0, "StatusLineL1", { fg = "#ffffff",  bold = false })
vim.api.nvim_set_hl(0, "StatusLineL2", { fg = "#ffffff",  bold = false })
vim.api.nvim_set_hl(0, "StatusLineL3", { fg = "#ffffff",  bold = false })
vim.api.nvim_set_hl(0, "StatusLineL4", { fg = "#ffffff",  bold = false })
vim.api.nvim_set_hl(0, "StatusLineL5", { fg = "#ffffff",  bold = false })

-- Create statusline
function StatusLine.active()
	return "%#StatusLineL1# %{statuslineV0} %q%< %f%< %#StatusLineL0#%h%m%r%=%b %#StatusLineL2#0x%b %#StatusLineL3#%l %#StatusLineL4#%c%V %#StatusLineL4#%P"
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
