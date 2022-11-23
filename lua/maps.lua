-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("i", "vv", "<ESC>")

-- quit and write
keymap("n", "<leader>q", "<Cmd>q<CR>")
keymap("n", "<leader>s", "<Cmd>w<CR>")

-- select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Windows option
keymap("n", "<leader>ww", ":vsplit<CR><C-w>w", {silent = true})
-- keymap("n", "f", "<C-w>w")
keymap("n", "<leader>wh", "<C-w>h")
keymap("n", "<leader>wj", "<C-w>j")
keymap("n", "<leader>wk", "<C-w>k")
keymap("n", "<leader>wl", "<C-w>l")
keymap("n", "<leader>wo", "<C-w>o")
keymap("n", "<leader>wc", "<C-w>c")

-- BufferLine
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>")
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>")


-------------------- config for coc.nvim ------------------

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

keymap("i", "<C-j>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<C-j>" : coc#refresh()', opts)
keymap("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keymap("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion.
-- keymap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})


-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keymap("n", "<leader>h", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming.
keymap("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code.
keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keymap("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json,lua,c++",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

----------------------------- Config for telescope -------------------------------
local builtin = require('telescope.builtin')
-- find files
keymap('n', '<leader>ff', builtin.find_files, {})
-- find word
keymap('n', '<leader>fg', builtin.live_grep, {})
-- find buffers
keymap('n', '<leader>fb', builtin.buffers, {})
-- find helps
keymap('n', '<leader>fh', builtin.help_tags, {})


---------------------------- config for Nvim Tree ---------------------------
keymap('n', '<C-n>', ":NvimTreeToggle<CR>", {silent = true})
keymap('n', '<leader>nf', ":NvimTreeFindFile<CR>", {silent = true})

---------------------------- telescope ------------------------


---------------------------- toggleterm -----------------------------------
keymap('n', '<leader>t', ':ToggleTerm<CR>', {silent = true, noremap = true})
keymap('t', '<ESC>', '<cmd>wincmd k<CR>', {silent = true, noremap = true} )
keymap('t', '<A-k>', "<cmd>wincmd k<CR>", {silent = true, noremap = true})
