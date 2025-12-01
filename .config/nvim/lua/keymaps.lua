-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Navigate between splits
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })


vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Create a splitted window horizontal" })
vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "Create a splitted window vertical" })


-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

------- Custom
-- Open file explorer
vim.keymap.set("n", "<Tab>", ":Ex<CR>", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Backtick
vim.keymap.set("i", "<A-\\>", "`", opts)

-- Snippets test
vim.keymap.set(
	"n",
	"<leader>h1",
	":i<CR>text-4xl tracking-tighter text-balance max-lg:font-medium sm:text-5xl lg:text-6xl xl:text-8xl text-foreground <CR><Esc>",
	opts
)

vim.keymap.set(
	"n",
	"<leader>h3",
	":i<CR>font-mono text-xs/6 font-medium uppercase tracking-widest text-gray-600 <CR><Esc>",
	opts
)

-- TODO
vim.api.nvim_set_keymap("n", "<leader>td", ":lua NewTodo()<CR>", opts)
function NewTodo()
	vim.cmd([[
       :rightbelow vsplit todo.md
       :vertical resize 80
     ]])
end

-- Theme
vim.keymap.set("n", "<leader>tt", ":lua ToggleTheme()<CR>", opts)
function ToggleTheme()
	if vim.o.background == "dark" then
		vim.o.background = "light"
		vim.cmd([[colorscheme catppuccin-mocha]])
	else
		vim.o.background = "dark"
		vim.cmd([[colorscheme rose-pine]])
	end
end

-- Not for a single char, but for and entire word.
vim.keymap.set("n", "cw", "caw")

vim.keymap.set("n", "<leader>ti", ":lua TranslateIt()<CR>", opts)

function TranslateIt()
	local selectedWord = vim.fn.expand("<cword>")
	vim.ui.open("https://translate.google.com/?sl=en&tl=it&text=" .. selectedWord .. "&op=translate")
end

-- Jumping to title to tiles in md files
vim.keymap.set("n", "<leader>nh", ":/\\v^#{1,5}<CR>n", opts)

-- Show the current marks
vim.keymap.set("n", "<leader>m", ":marks <CR>", opts)

-- Format on Keybinds
-- :h lsp.buf.format
vim.keymap.set("n", "<leader>bf", ":lua vim.lsp.buf.format({ async = false }) <CR>")
