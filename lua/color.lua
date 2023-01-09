-- set cursorline
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 300
        }
    end
})

-- use onedark theme
require('onedark').load()

-- use oxocarbon theme
-- vim.opt.background = 'dark'
-- vim.cmd.colorscheme 'oxocarbon'
