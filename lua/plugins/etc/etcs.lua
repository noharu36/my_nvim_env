return {
    {
        'akinsho/toggleterm.nvim', version = "*",
        config = function()
            require('toggleterm').setup({
                -- direction = 'horizontal',
                direction = 'float',
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
        "pogyomo/winresize.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        config = function ()
            require('gitblame').setup({
                enabled = true,
                message_template = " <date> • <author> • <summary>",
                date_format = "%m-%d-%Y %H:%M:%S",
                virtual_text_column = 1,
            })
        end
    }
}
