return {
    --[[
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
            })
            vim.cmd('colorscheme catppuccin')
        end
    },
    --]]
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
            })
            vim.o.background = "dark"
            vim.cmd('colorscheme gruvbox')

            -- Gruvbox Dark 向け cmp ウィンドウハイライト
            vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#3c3836", fg = "#ebdbb2" })
            vim.api.nvim_set_hl(0, "CmpBorder", { bg = "#3c3836", fg = "#8ec07c" })
            vim.api.nvim_set_hl(0, "CmpSel", { bg = "#504945", fg = "#ebdbb2", bold = true })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#8ec07c", bold = true })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#8ec07c" })
            vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#3c3836", fg = "#ebdbb2" })
            vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#3c3836", fg = "#a89984" })

            -- LSP フローティングウィンドウ (hover, diagnostic等) のハイライト
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3c3836", fg = "#ebdbb2" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3c3836", fg = "#a89984" })

            -- hover ウィンドウにボーダーを追加
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, { border = "rounded" }
            )

            -- signature help ウィンドウにもボーダーを追加
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, { border = "rounded" }
            )

            -- diagnostic float にもボーダーを適用
            vim.diagnostic.config({
                float = { border = "rounded" },
            })
        end
    },

    --[[
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup({
                style = 'cool',
            })
            require('onedark').load()
        end
    },
    --]]
    --[[
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                variant = 'main'
            })
            vim.cmd('colorscheme rose-pine')
        end
    },
    --]]
    --[[
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require('tokyonight').setup({
                style = "storm",
            })
            vim.cmd('colorscheme tokyonight')
        end
    },
    --]]
}
