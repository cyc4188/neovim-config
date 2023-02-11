local telescope = require('telescope')
telescope.load_extension('aerial')
telescope.setup{
    extensions = {
        aerial = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
                ['_'] = false, -- This key will be the default
                json = true,   -- You can set the option for specific filetypes
                yaml = true,
            }
        },
        coc = {
            -- theme = 'ivy',
            prefer_locations = true,
        }
    },
    defaults = {
        initial_mode = "insert",

        -- keybinding
        mappings = {
            i = {
                -- move
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<Down>"] = "move_selection_next",
                ["<Up>"] = "move_selection_previous",
                -- histroy
                ["<C-n>"] = "cycle_history_next",
                ["<C-p>"] = "cycle_history_prev",
                -- close
                ["<C-w>"] = "close",
                -- scroll
                ["<C-u>"] = "preview_scrolling_up",
                ["<C-d>"] = "preview_scrolling_down",
            }
        },
    },
}
require('telescope').load_extension('coc')
----------------- default mappings -----------------------
-- <C-n>/<Down>	Next item
-- <C-p>/<Up>	Previous item
-- j/k	Next/previous (in normal mode)
-- H/M/L	Select High/Middle/Low (in normal mode)
-- gg/G	Select the first/last item (in normal mode)
-- <CR>	Confirm selection
-- <C-x>	Go to file selection as a split
-- <C-v>	Go to file selection as a vsplit
-- <C-t>	Go to a file in a new tab
-- <C-u>	Scroll up in preview window
-- <C-d>	Scroll down in preview window
-- <C-/>	Show mappings for picker actions (insert mode)
-- ?	Show mappings for picker actions (normal mode)
-- <C-c>	Close telescope
-- <Esc>	Close telescope (in normal mode)
-- <Tab>	Toggle selection and move to next selection
-- <S-Tab>	Toggle selection and move to prev selection
-- <C-q>	Send all items not filtered to quickfixlist (qflist)
-- <M-q>	Send all selected items to qflist
