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

    {
        "davidgranstrom/scnvim",
        ft = "supercollider",
        config = function()
            local scnvim = require("scnvim")
            local map = scnvim.map
            local map_expr = scnvim.map_expr

            scnvim.setup({
                ensure_installed = true,
                keymaps = {
                    ["<M-e>"] = map("editor.send_line", { "i", "n" }),
                    ["<C-e>"] = {
                        map("editor.send_block", { "i", "n" }),
                        map("editor.send_selection", "x"),
                    },
                    ["<CR>"] = map("postwin.toggle"),
                    ["<M-l>"] = map("postwin.clear", { "n", "i" }),
                    ["<leader>k"] = map("signature.show", { "n", "i" }),
                    ["<leader>."] = map("sclang.hard_stop", { "n", "x", "i" }),
                    ["<leader>st"] = map("sclang.start"),
                    ["<leader>sk"] = map("sclang.recompile"),
                    ["<leader>sb"] = map_expr("s.boot"),
                    ["<leader>sm"] = map_expr("s.meter.window.alwaysOnTop_(true).front"),
                },
                sclang = {
                    cmd = "sclang",
                },
            })
        end,
    },
}
