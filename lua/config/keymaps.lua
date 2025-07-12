vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("v", "<Left>", "<Nop>")
vim.keymap.set("v", "<Up>", "<Nop>")
vim.keymap.set("v", "<Down>", "<Nop>")
vim.keymap.set("v", "<Right>", "<Nop>")

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")

vim.keymap.set("n", "sv", "<C-w>v")
vim.keymap.set("n", "ss", "<C-w>s")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sw", "<C-w>w")
vim.keymap.set("n", "s", "<Nop>")
local resize = function(win, amt, dir)
    return function()
        require("winresize").resize(win, amt, dir)
    end
end
vim.keymap.set("n", "rh", resize(0, 2, "left"))
vim.keymap.set("n", "rj", resize(0, 1, "down"))
vim.keymap.set("n", "rk", resize(0, 1, "up"))
vim.keymap.set("n", "rl", resize(0, 2, "right"))
-- vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })

vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>y", "@y")
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<Leader>th", "gt")
vim.keymap.set("n", "<Leader>tl", "gT")
vim.keymap.set("n", "<Leader>'", ":terminal<CR>")
vim.keymap.set("n", "<Leader><Leader>", [[<Cmd>let @/ = '\<' . expand('<cword>') . '\>'<CR><Cmd>set hlsearch<CR>]])
vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<CR><C-l>")

vim.keymap.set("n", "<Leader>m", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<Leader>oo", ":MpvToggle<CR>")

vim.keymap.set("n", "<Leader>w<CR>", ":w<CR>")
vim.keymap.set("n", "<Leader>q<CR>", ":q<CR>")


-- ファイル検索
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, {})
-- ドットファイルを検索対象にするファイル検索
-- vim.keymap.set("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", {})

-- コードジャンプ
-- vim.keymap.set('n', '<leader>gj', function() vim.cmd('vsplit') vim.cmd('wincmd l') vim.lsp.buf.definition() end, {})

-- 参照箇所の表示・ジャンプ
-- vim.keymap.set('n', '<leader>gk', function() vim.lsp.buf.references() end, {})

-- テキスト検索
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, {})

-- gitの操作（git status）
vim.keymap.set("n", "<leader>gs", function() require("telescope.builtin").git_status() end, {})

-- gitの操作（git log）
vim.keymap.set("n", "<leader>gl", function() require("telescope.builtin").git_commits() end, {})

-- バッファの操作
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, {})

-- 履歴の操作
vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, {})

-- カラーテーマの一覧
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").colorscheme() end, {})

-- vim_optionsの一覧
vim.keymap.set("n", "<leader>fv", function() require("telescope.builtin").vim_options() end, {})

-- keymapの一覧
vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, {})

-- registerの一覧
vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").registers() end, {})

-- nvim設定ファイルへのアクセス
vim.keymap.set("n", "<Leader>fn", ":Telescope find_files cwd=~/.config/nvim<CR>", {})

vim.keymap.set("n", "x", "\"_x")

