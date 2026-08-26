-- Open the command line with Space
vim.keymap.set("n", "<Space>", ":", {
  desc = "Open command line",
})


-- Clear search highlighting
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", {
  desc = "Clear search highlighting",
})


-- Move between split windows
vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Move to left split",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Move to lower split",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Move to upper split",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Move to right split",
})
