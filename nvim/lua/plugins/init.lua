return {
  {
    "phha/zenburn.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("zenburn").setup()
      vim.cmd.colorscheme("zenburn")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "zenburn",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<C-n>",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Toggle file tree",
      },
    },
    opts = {
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
  },

  {
    "brianhuster/live-preview.nvim",
    cmd = "LivePreview",
  },

  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    opts = {},
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
    },
  },
}
