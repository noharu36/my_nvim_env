return {
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
