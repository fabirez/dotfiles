local opts = { noremap = true, silent = true }

------- Defaults
-- Open file explorer
vim.keymap.set('n', '<Tab>', ':Ex<CR>', { noremap = true, silent = true })

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Backtick
vim.keymap.set('i', '<A-\\>', '`', { noremap = true, silent = true })

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-------------
-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
--vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>cw', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

------- Custom
---
-- Snippets test
vim.keymap.set(
    'n',
    '<leader>h1',
    ':i<CR>text-4xl tracking-tighter text-balance max-lg:font-medium sm:text-5xl lg:text-6xl xl:text-8xl text-foreground <CR><Esc>',
    opts
)

vim.keymap.set('n', '<leader>h3', ':i<CR>font-mono text-xs/6 font-medium uppercase tracking-widest text-gray-600 <CR><Esc>', opts)

-- TODO
vim.api.nvim_set_keymap('n', '<leader>td', ':lua newTodo()<CR>', opts)
function newTodo()
    vim.cmd [[
       :rightbelow vsplit todo.md
       :vertical resize 80
     ]]
end

-- Theme
vim.keymap.set('n', '<leader>tt', ':lua ToggleTheme()<CR>', opts)
function ToggleTheme()
    if vim.o.background == 'dark' then
        vim.o.background = 'light'
        vim.cmd [[colorscheme catppuccin-mocha]]
    else
        vim.o.background = 'dark'
        vim.cmd [[colorscheme rose-pine]]
    end
end

-- Not for a single char, but for and entire word.
vim.keymap.set('n', 'cw', 'caw')
