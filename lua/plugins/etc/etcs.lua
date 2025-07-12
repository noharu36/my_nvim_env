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
        cofig = function ()
            require('gitsigns').setup({
                current_line_blame = true,
            })
        end
    }
}
