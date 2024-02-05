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
vim.keymap.set("n", "s", "<Nop>")

vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })

vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>y", "@y")
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<Leader>th", "gt")
vim.keymap.set("n", "<Leader>tl", "gT")
vim.keymap.set("n", "<Leader>'", ":terminal<CR>")

vim.keymap.set("n", "<Leader>m", ":Neotree toggle<CR>")

vim.keymap.set("n", "<Leader>w<CR>", ":w<CR>")
vim.keymap.set("n", "<Leader>q<CR>", ":q<CR>")


local builtin = require("telescope.builtin")
-- ファイル検索
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- ドットファイルを検索対象にするファイル検索
-- vim.keymap.set("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", {})

-- テキスト検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- gitの操作（git status）
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

-- gitの操作（git log）
vim.keymap.set("n", "<leader>gl", builtin.git_commits, {})

-- バッファの操作
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- 履歴の操作
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

-- nvim設定ファイルへのアクセス
vim.keymap.set("n", "<Leader>fn", ":Telescope find_files cwd=~/.config/nvim<CR>", {})

-- カラーテーマの一覧
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})

-- vim_optionsの一覧
vim.keymap.set("n", "<leader>fv", builtin.vim_options, {})

-- keymapの一覧
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})

-- registerの一覧
vim.keymap.set("n", "<leader>fr", builtin.registers, {})

vim.keymap.set("n", "x", "\"_x")
