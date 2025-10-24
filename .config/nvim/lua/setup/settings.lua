vim.o.clipboard = 'unnamedplus' -- When we yank in nvim, it's avaible also in our machine.

-- Line wrapping
vim.o.wrap = false --  don't break the lines for fit the window width
vim.o.linebreak = true -- wraps line at word boundaries.

-- Search settings
vim.o.ignorecase = true --   When we search (/), make it case-insensitive
vim.o.smartcase = true -- When with different case (aA), it becomes case-sensitive; with all lowercase, it remains case-insensitive

-- Identation and formatting settings
vim.o.autoindent = true --  When we press Enter to start a new line, Neovim will use the same indentation level as the previous line.
vim.o.shiftwidth = 2 --  number of spaces for each level of indentation
vim.o.tabstop = 2 -- number of spaces that a tab character represents
vim.o.softtabstop = 2 --  number of spaces for a tab when editing
vim.o.expandtab = true -- convert tabs to spaces
vim.o.smartindent = true -- enable smart indentation

-- Scrolling behavior
vim.o.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns to keep on either side of the cursor

-- Visual settings
vim.o.cursorline = true -- highlight the current line
vim.wo.number = true -- enable line numbers
vim.o.relativenumber = true -- show relative numbers

vim.opt.termguicolors = true -- enable true color support
vim.o.showmode = false -- hide mode display  -- INSERT --

vim.o.fileencoding = 'utf-8' -- set file encoding to UTF-8
vim.o.backup = false -- disable backup file creation
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- disable automatic comment insertion

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '-> ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Obsidian setting for hiding the md syntax
--  example **hello** -> hello
vim.opt.conceallevel = 2


vim.opt_local.spell = false
--:hi[ghlight] [default] {group-name} {key}={arg}
-- vim.api.nvim_set_hl(0, '@markup.italic', {
--     italic = true,
--     fg = '#000000',
-- })



-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
