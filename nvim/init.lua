vim.g.mapleader = ","

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Could not install lazy.nvim:\n" .. result)
  end
end

vim.opt.rtp:prepend(lazypath)

local init_file = debug.getinfo(1, "S").source:sub(2)
local config_dir = vim.fn.fnamemodify(init_file, ":p:h")

require("lazy").setup({
  spec = {
    {
      "nvim-lualine/lualine.nvim",
      opts = {},
    },
  },
  lockfile = config_dir .. "/lazy-lock.json",
  checker = { enabled = false },
  change_detection = { notify = false },
})
