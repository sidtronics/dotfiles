local map = vim.keymap.set
vim.g.mapleader = " "

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- terminal
---@diagnostic disable-next-line: duplicate-set-field
function _G.set_terminal_keymaps()
    map('t', '<C-n>', [[<C-\><C-n>]], {noremap = true, buffer = 0})
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], {buffer = 0})
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], {buffer = 0})
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], {buffer = 0})
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], {buffer = 0})
    map('t', '<C-w>', [[<C-\><C-n><C-w>]], {buffer = 0})
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- lazy
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- mason
map("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason" })
