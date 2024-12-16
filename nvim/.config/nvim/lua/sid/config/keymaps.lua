local map = vim.keymap.set
vim.g.mapleader = " "

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Focus Left", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Focus Lower", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Focus Upper", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Focus Right", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Shift down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Shift up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Shift down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Shift up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Shift down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Shift up" })

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bx", "<cmd>bd<cr>", {desc = "Delete buffer"})
map("n", "<leader>bX", "<cmd>bd!<cr>", {desc = "Force delete buffer"})


-- better indenting
map("v", "<", "<gv", { desc = "Decrease indent" })
map("v", ">", ">gv", { desc = "Increase indent" })

-- terminal
---@diagnostic disable-next-line: duplicate-set-field
function _G.set_terminal_keymaps()
    map('t', '<C-n>', [[<C-\><C-n>]], { desc = "Normal mode", noremap = true, buffer = 0 })
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = "Focus Left", buffer = 0 })
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = "Focus Lower", buffer = 0 })
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = "Focus Upper", buffer = 0 })
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = "Focus Right", buffer = 0 })
    map('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = "Cycle windows", buffer = 0 })
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- lazy
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- mason
map("n", "<leader>p", "<cmd>Mason<cr>", { desc = "Mason" })
