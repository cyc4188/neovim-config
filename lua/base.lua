vim.opt.number = true
vim.opt.relativenumber = true

-- vim.scriptencoding = 'uft-8'
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- highlight search
vim.opt.hlsearch = true
-- search on typing
vim.opt.incsearch = true

vim.opt.mouse = "a"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- auto read if files changed by other editor
vim.opt.autoread = true
vim.bo.autoread = true

vim.wo.signcolumn = "yes"

-- show space as ·
-- vim.opt.list = true
-- vim.opt.listchars = "space:·"

vim.opt.hidden = true

vim.opt.showtabline = 2

------------- config for coc.nvim

-- default time = 4000
vim.opt.updatetime = 300

-- always show the signcolumn
vim.opt.signcolumn = "yes"

-- clipboard
vim.opt.clipboard = "unnamedplus"


-- command line completion ignore case
vim.opt.wildignorecase = true
vim.opt.wildmenu = true


-- enable copilot for markdown

