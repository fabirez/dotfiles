-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
--
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
-- 			vim.cmd { cmd = 'lsp', args = { 'disable' } }
--   end
-- })
--
--
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.c", "*.h"},
	command = "echo 'Entering a C or C++ file'",
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
	desc = 'Create a mark on save',
	command = "mark c",
})

