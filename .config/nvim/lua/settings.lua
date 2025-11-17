-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- Show the current number line not based on the relative number.
vim.wo.number = true
-- show relative numbers
vim.o.relativenumber = true
-- highlight the current line
vim.o.cursorline = true
 -- enable true color support
vim.opt.termguicolors = true
-- hide mode display  -- INSERT --
vim.o.showmode = false
-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Line wrapping
vim.o.wrap = false --  don't break the lines for fit the window width
vim.o.linebreak = true -- wraps line at word boundaries.

-- Search settings
-- When we search /, make it case-insensitive
vim.o.ignorecase = true
-- If we have a different case (aA) start to be case-sensitive or with \C; 
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
--  plugin like lsp, cursor animation will be enabled
--  after 250ms of inactivity
vim.o.updatetime = 250

-- Wait for a mapped sequence to complete.
vim.o.timeoutlen = 300


-- Configure how new splits should be opened
-- ex: whenwe use :h <command>
-- the split will be positioned based on these values
vim.o.splitright = true
vim.o.splitbelow = false


-- Scrolling behavior
-- minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10
-- minimal number of screen columns to keep on either side of the cursor
-- vim.o.sidescrolloff = 8 


-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- vim.o.confirm = true


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
-- vim.o.list = true
-- vim.opt.listchars = { tab = '󱞩 ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
-- Identation and formatting settings
--  When we press Enter to start a new line,
--  Neovim will use the same indentation level as the previous line.
vim.o.autoindent = true
--  number of spaces for each level of indentation
vim.o.shiftwidth = 2
-- number of spaces that a tab character represents
vim.o.tabstop = 2
--  number of spaces for a tab when editing
vim.o.softtabstop = 2
-- convert tabs to spaces
vim.o.expandtab =  false
 -- enable smart indentation
vim.o.smartindent = true
-------
-- Custom
------
vim.g.statuslineV0 = " "

