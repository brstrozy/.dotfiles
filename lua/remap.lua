vim.g.mapleader = " "

vim.keymap.set("i", "<C-c>", "<Esc>")

-- nvim file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- scrolls half page, keeps cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- after /pattern, keep cursor centered & open folds automatically
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selection without replacing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete text without saving to clipboard
vim.keymap.set({"n","v"}, "<leader>d", [["_d]])

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- disables Q command for entering Ex mode, rarely needed
vim.keymap.set("n", "Q", "<nop>")

-- lsp auto formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- starts gloabl search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management
vim.keymap.set("n", "<leader>ww", ":vsp<CR>")
vim.keymap.set("n", "<leader>wv", ":sp<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- sourcing files quickly
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
