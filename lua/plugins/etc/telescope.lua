return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    -- 検索から除外するものを指定
                    "^.git/",
                    "^./target/",
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
}
