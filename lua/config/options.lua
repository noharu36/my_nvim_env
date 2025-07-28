-- lang
vim.cmd('language en_US.UTF-8') -- 表示言語を英語にする

-- ファイル
vim.opt.fileencoding = "utf-8" -- エンコーディングをUTF-8に設定
vim.opt.swapfile = false -- スワップファイルを作成しない
vim.opt.undofile = false
vim.opt.writebackup = false
vim.opt.hidden = true -- バッファを切り替えるときにファイルを保存しなくてもOKに

-- クリップボード共有
vim.opt.clipboard = "unnamedplus"
-- メニューとコマンド
vim.opt.wildmenu = true -- コマンドラインで補完
vim.opt.cmdheight = 1 -- コマンドラインの表示行数
vim.opt.laststatus = 2 -- 下部にステータスラインを表示
vim.opt.showcmd = true -- コマンドラインに入力されたコマンドを表示

-- 検索・置換え
vim.opt.hlsearch = true -- ハイライト検索を有効
vim.opt.incsearch = true -- インクリメンタルサーチを有効
vim.opt.matchtime = 1 -- 入力された文字列がマッチするまでにかかる時間

-- インデント
vim.opt.shiftwidth = 4 -- シフト幅を4に設定する
vim.opt.tabstop = 4 -- タブ幅を4に設定する
vim.opt.expandtab = true -- タブ文字をスペースに置き換える
vim.opt.autoindent = true -- 自動インデントを有効にする
vim.opt.smartindent = true -- インデントをスマートに調整する

-- 表示
vim.opt.termguicolors = true
vim.opt.number = true -- 行番号を表示
vim.opt.wrap = true -- テキストの自動折り返しを無効に
vim.opt.showtabline = 1 -- タブラインを表示
vim.opt.pumblend = 30
vim.opt.winblend = 0
vim.opt.visualbell = true -- ビープ音を表示する代わりに画面をフラッシュ
vim.opt.showmatch = true -- 対応する括弧をハイライト表示
vim.opt.termguicolors = true

-- インタフェース
vim.opt.signcolumn = "yes" -- サインカラムを表示
