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

vim.cmd([[
    hi Normal ctermfg=7 ctermbg=NONE cterm=NONE \" 添加默认颜色设置 避免载入主题时报错
    colorscheme solarized8_high
    let &t_SI .= '\e[5 q'
    let &t_EI .= '\e[1 q'
    let &t_vb = ''
    let &t_ut = ''
]])


-- use onedark theme
require('onedark').load()

-- use oxocarbon theme
-- vim.opt.background = 'dark'
-- vim.cmd.colorscheme 'oxocarbon'
