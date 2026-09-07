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


-- Format Python files with Ruff before saving
local format_python = vim.api.nvim_create_augroup("format_python", {
  clear = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_python,
  pattern = "*.py",
  callback = function(args)
    local clients = vim.lsp.get_clients({
      bufnr = args.buf,
      name = "ruff",
    })

    if #clients > 0 then
      vim.lsp.buf.format({
        async = false,
        bufnr = args.buf,
        name = "ruff",
      })
    end
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
