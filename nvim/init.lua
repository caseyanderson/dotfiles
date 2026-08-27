-- Use comma as the leader key
vim.g.mapleader = ","

-- Locate this configuration when loaded directly or through a link
local init_file = debug.getinfo(1, "S").source:sub(2)
local config_dir = vim.fn.fnamemodify(init_file, ":p:h")
vim.opt.rtp:prepend(config_dir)

-- Load general configuration modules
require("config.keymaps")
require("config.autocmds")

-- Editor display
vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.mouse = "a"            -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Share the system clipboard
vim.opt.termguicolors = true   -- Enable 24-bit terminal colors
vim.opt.cursorline = true      -- Highlight the current line
vim.opt.showmatch = true       -- Briefly show the matching bracket
vim.opt.scrolloff = 3          -- Keep context above and below the cursor
vim.opt.wrap = false           -- Keep long lines on one screen row
vim.opt.scrolljump = 5         -- Scroll at least five lines at a window edge
vim.opt.virtualedit = "onemore" -- Allow cursor one position beyond line end
vim.opt.whichwrap = "b,s,h,l,<,>,[,]" -- Allow cursor keys to cross line boundaries
vim.opt.list = true            -- Show otherwise invisible whitespace
vim.opt.listchars = {          -- Choose symbols for invisible characters
  tab = "› ",
  trail = "•",
  extends = "#",
  nbsp = ".",
}


-- Searching
vim.opt.ignorecase = true  -- Ignore case in searches
vim.opt.smartcase = true   -- Use case-sensitive search when uppercase is typed


-- Command-line completion
vim.opt.wildmode = "list:longest,full"  -- List matches before cycling through them


-- Window layout
vim.opt.splitright = true  -- Open vertical splits to the right
vim.opt.splitbelow = true  -- Open horizontal splits below
vim.opt.winminheight = 0   -- Allow inactive splits to collapse completely

-- Formatting
vim.opt.expandtab = true  -- Insert spaces when pressing Tab
vim.opt.shiftwidth = 4     -- Use four spaces for indentation
vim.opt.softtabstop = 4    -- Treat four spaces as one editing step


-- File recovery
local backup_dir = vim.fn.stdpath("state") .. "/backup"
local undo_dir = vim.fn.stdpath("state") .. "/undo"

vim.fn.mkdir(backup_dir, "p")
vim.fn.mkdir(undo_dir, "p")

vim.opt.backup = true                 -- Keep the previous saved version
vim.opt.backupdir = backup_dir .. "//" -- Store backups outside project directories
vim.opt.undofile = true                 -- Preserve undo history between sessions
vim.opt.undodir = undo_dir .. "//"      -- Store undo files outside project directories


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

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  lockfile = config_dir .. "/lazy-lock.json",
  rocks = {
    enabled = false,
  },
  checker = { enabled = false },
  change_detection = { notify = false },
})
