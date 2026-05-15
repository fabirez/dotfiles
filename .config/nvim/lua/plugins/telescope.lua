local builtin = require 'telescope.builtin'
local utils = require 'telescope.utils'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles'} )
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })


-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
	builtin.live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end, { desc = '[S]earch [/] in Open Files' })



-- :h vim.fs.root() or :h expand 
vim.keymap.set('n', '<leader><leader>', function ()
-- 0 is the current buffer
-- if there is no .git file, just use the current directory as root 
local root = vim.fs.root(0, {'package.json','.obsidian','.git'}) or utils.buffer_dir()
-- or vim.fs.expand('%:p:h:h') two folder up, instead of the current one
builtin.find_files({cwd = root, hidden = true})
end, { desc = '[S]earch [F]iles'})


-- :h telescope.utils
vim.keymap.set('n', '<leader>sl', function ()
-- utils.buffer_dir() to search relative to open buffer
local root = utils.buffer_dir()
-- or vim.fs.expand('%:p:h:h') two folder up, instead of the current one
builtin.find_files({cwd = root, hidden = true})
end, { desc = '[S]earch [F]iles In [L]ocal'})

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

