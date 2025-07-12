return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "neovim/nvim-lspconfig" },
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-cmdline",
                    "hrsh7th/cmp-vsnip",
                    "hrsh7th/vim-vsnip"
                },
            }
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'vsnip' },

                    },
                    {
                        { name = 'buffer' },
                    }
                )
            })
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "rust_analyzer",
                    "lua_ls",
                    "gopls",
                    "tsserver",
                    "hls"
                }
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities
                    })
                end,
                ["vtsls"] = function()
                    lspconfig["vtsls"].setup({})
                end,
                ["rust-analyzer"] = function()
                end,
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
            )
        end
    },
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^5', -- Recommended
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
        init = function()
            vim.g.haskell_tools = {}
        end,
    }
    --[[
    {
        'cordx56/rustowl',
        dependencies = {
            'neovim/nvim-lspconfig'
        },
        ft = 'rust',

        config = function ()
            local lspconfig = require("lspconfig")
            lspconfig.rustowl.setup({})

            vim.keymap.set('n', '<leader>oo', require('rustowl').rustowl_cursor)
        end
    }
    --]]
}
