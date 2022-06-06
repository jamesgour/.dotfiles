-- Vim Keymaps --

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mode Identifiers
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

---------- Normal Mode ----------
-- TODO: Figure out how to Source init.lua
-- keymap("n", "<C-s>", ":luafile %<CR>", opts)

-- Vim-like window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts) -- Move to next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- Move to next buffer
keymap("n", "<leader>x", ":bp|bd #<CR>", opts) -- Close buffer

-- Resize panes with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Netrw File Explorer - Replaced by NvimTree
--keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts) -- Open/close NvimTree to current file
keymap("n", "<leader>rl", ":NvimTreeRefresh<CR>", opts) -- Refresh files in NVimTree

-- Telescope --
keymap("n", "<leader>g", ":Telescope live_grep hidden=true<CR>", opts)
keymap("n", "<leader>h", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
-- TODO: figure out how to find hidden files & ignore node_modules - wasn't working with plugin due to bug
--keymap("n", "<leader>ff", ":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)

-- Harpoon
keymap("n", "<leader>a", ':lua require("harpoon.mark").add_file()<CR>', opts) -- Add Harpoon mark
keymap("n", "<leader>d", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts) -- Harpoon marks menu
keymap("n", "<leader>s", ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts) -- Harpoon commands menu

keymap("n", "<leader>j", ':lua require("harpoon.ui").nav_file(1)<CR>', opts) -- Navigate to Harpoon mark 1
keymap("n", "<leader>k", ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader>l", ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap("n", "<leader>;", ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", ":m+<CR>", opts)
keymap("n", "<A-k>", ":m-2<CR>", opts)

-- Easy saving using Ctrl + s or <leader>w
-- keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)

-- Run Current Python File
keymap("n", "<leader>r", ":!python3 %<CR>", opts)

-- Enable Code Review
keymap("n", "<leader>cr", ":call CodeReview(1)<CR>", opts)

-- Primeagen cht.sh tool https://www.youtube.com/watch?v=hJzqEAf2U4I
keymap("n", "<leader>i", ":terminal ~/.dotfiles/bin/tmux-cht.sh<CR>", opts)

-- Faster :noh
keymap("n", "<leader>n", ":noh<CR>", opts)

---------- Insert Mode ----------
-- Leave insert mode with "jk" instead of ESC
keymap("i", "jk", "<ESC>", opts)

-- Move one space right with Ctrl+l
keymap("i", "<C-l>", "<Right>", opts)

-- Shift + Tab to backspace (if not on Kinesis Advantage)
keymap("i", "<S-Tab>", "<BS>", opts)

-- Jump to new line from any cursor position with "jj"
--keymap("i", "jj", "<C-o>o", opts)

-- Jump to end of line from any cursor position
--keymap("i", "jl", "<C-o>$", opts)

---------- Visual Mode ----------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- Easily paste over text

-- TODO: Figure out how to copy only selection
-- Copy to system clipboard using clip.exe
keymap("v", "<leader>y", ":'<,'>w !clip.exe<CR><CR>", opts)
keymap("v", "<leader>yy", ":'<,'>w !clip.exe<CR><CR>", opts)

---------- Visual Block Mode ----------
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

---------- Terminal Mode ----------
-- Vim terminal navigation - covered by system keybindings?
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
