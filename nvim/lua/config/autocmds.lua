-- Remove trailing whitespace before saving
local trim_whitespace = vim.api.nvim_create_augroup("trim_whitespace", {
  clear = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = trim_whitespace,
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})


-- Start Git commit messages on the first line
local git_commit_cursor = vim.api.nvim_create_augroup("git_commit_cursor", {
  clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
  group = git_commit_cursor,
  pattern = "gitcommit",
  callback = function()
    vim.api.nvim_win_set_cursor(0, { 1, 0 })
  end,
})
