return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        lazy = false,
        config = function()
            require('lualine').setup({})
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({})
        end
    },
    --[[
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup ({
                indent = {char = "▏"}
            })
        end
    },
    --]]
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup({
                indent = {
                    chars = { "│", "¦", "┆", "┊", },
                    style = {
                        "#305990"
                    }
                },
                blank = {
                    enable = false,
                }
            })
        end
    },
    {
        'tamton-aquib/duck.nvim',
        event = { "UIEnter" },
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦀") end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
            vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require('neo-tree').setup({
                window = {
                    position = "float"
                }
            })
        end
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require("notify")
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {},
            })
        end
    },
        {
        'nvim-treesitter/nvim-treesitter',
        event = {'BufNewFile', 'BufRead'},
        build = ":TSUpdate",
        config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "typescript",
                "haskell",
                "javascript",
                "c",
                "rust",
                "python",
                "go",
                "lua",
                "bash",
                "html",
                "css",
                "vue",
                "vim",
                "yaml",
                "toml",
                "ini",
                "json",
                "diff",
                "gitignore"
            },
            highlight = {
                enable = true,
            },
            haskell = {
                indent = {
                    enable = true,
                },
            },
        }
        end
    },
}

