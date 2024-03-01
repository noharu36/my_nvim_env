return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
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

    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
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
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup ({
                indent = {char = "▏"}
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        -- 検索から除外するものを指定
                        "^.git/",
                        "^.cache/",
                        "^Library/",
                        "Parallels",
                        "^Movies",
                        "^Music",
                    },
                    vimgrep_arguments = {
                        -- ripggrepコマンドのオプション
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "-uu",
                    },
                },
                extensions = {
                    -- ソート性能を大幅に向上させるfzfを使う
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })
        end
    },
    {
		'goolord/alpha-nvim',
		event = 'VimEnter',
		opts = function()
			local dashboard = require('alpha.themes.dashboard')
			dashboard.section.header.val = {
                "                                    ╱|       ",
                "    ┌┐┌  ┌─┐  ┌─┐  ┬  ┬  ┬  ┌┬┐    (˚ˎ 。7    ",
                "    │││  ├┤   │ │  └┐┌┘  │  │││     |、˜ \\   ",
                "    ┘└┘  └─┘  └─┘   └┘   ┴  ┴ ┴     じしˍ,)ノ  ",
                "                                              ",
            }
			-- stylua: ignore
			dashboard.section.buttons.val = {
				dashboard.button('n', '   New file', ':ene <BAR> startinsert <CR>'),
				dashboard.button('r', '   Recent files', ':Telescope oldfiles <CR>'),
				dashboard.button('f', '󰥨   Find file', ':Telescope find_files <CR>'),
				dashboard.button('g', '󰱼   Find text', ':Telescope live_grep <CR>'),
				dashboard.button('s', '   Restore Session', [[:lua require('persistence').load() <cr>]]),
				dashboard.button('l', '󰒲   Lazy', ':Lazy<CR>'),
				dashboard.button('q', '   Quit', ':qa<CR>'),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = 'AlphaButtons'
				button.opts.hl_shortcut = 'AlphaShortcut'
			end
			dashboard.section.header.opts.hl = 'AlphaHeader'
			dashboard.section.buttons.opts.hl = 'AlphaButtons'
			dashboard.section.footer.opts.hl = 'AlphaFooter'
			dashboard.opts.layout[1].val = 7
			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == 'lazy' then
				vim.cmd.close()
				vim.api.nvim_create_autocmd('User', {
					pattern = 'AlphaReady',
					callback = function()
						require('lazy').show()
					end,
				})
			end

			require('alpha').setup(dashboard.opts)

			vim.api.nvim_create_autocmd('User', {
				pattern = 'LazyVimStarted',
				callback = function()
					local stats = require('lazy').stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					-- stylua: ignore
					dashboard.section.footer.val = '⚡ ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
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
        }
        end
    },
    {
        'akinsho/toggleterm.nvim', version = "*",
        config = function()
            require('toggleterm').setup({
                direction = 'horizontal',
            })
            vim.cmd([[
                autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-1> <Cmd>exe v:count1 . "ToggleTerm"<CR>
            ]])

            vim.cmd([[
                nnoremap <silent><c-1> <Cmd>exe v:count1 . "ToggleTerm"<CR>
                inoremap <silent><c-1> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
            ]])
        end
    },
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
            { "echasnovski/mini.completion", version = false },
        },
        config = function()
            local lspconfig = require("lspconfig")
            require('mini.completion').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "rust_analyzer",
                    "lua_ls",
                    "tsserver",
                    "hls"
                }
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                ["vtsls"] = function()
                    lspconfig["vtsls"].setup({})
                end,
                ["rust-analyzer"] = function()
                end,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(_)
                    vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
                    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
                    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
                    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
                    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
                end
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
            )
        end
    },
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^3', -- Recommended
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
        init = function()
            vim.g.haskell_tools = {}
        end,
    }
}


--[[
"                                                ",
"   ┌──┐  ┌  ┌───┐  ┌───┐  ┬     ┬  ┬  ┌──┬──┐   ",
"   │  │  │  │      │   │  │     │  │  │  │  │   ",
"   │  │  │  ├───┤  │   │  └─┐ ┌─┘  │  │  │  │   ",
"   │  │  │  │      │   │    │ │    │  │  │  │   ",
"   ┘  └──┘  └───┘  └───┘    └─┘    ┴  ┴     ┴   ",
"                                                ",

                "                                   ",
                "    ┌┐┌  ┌─┐  ┌─┐  ┬  ┬  ┬  ┌┬┐    ",
                "    │││  ├┤   │ │  └┐┌┘  │  │││    ",
                "    ┘└┘  └─┘  └─┘   └┘   ┴  ┴ ┴    ",
                "                                   ",
--]]

--[[
            ／＞　 フ
            | 　_　_|
          ／` ミ__^ノ
         /　　　　 |
        /　 ヽ　　 ﾉ          ╱|、
       /　　 |　|　|         (˚ˎ 。7
／￣|　　 |　|　|              |、˜〵
(￣ヽ＿_  ヽ_)__)             じしˍ,)ノ
＼二)

]]

--[[
    
]]
