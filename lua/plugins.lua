-- Only required if you have packer configured as `opt`
--

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compiled_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.fn.system({'rm', '-rf', compiled_path})
    vim.cmd [[packadd packer.nvim]]
end


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ------------------- theme --------------------------------
    -- onedark theme
    use 'navarasu/onedark.nvim'

    -- oxocarbon theme
    use 'nyoom-engineering/oxocarbon.nvim'
    ------------------- theme --------------------------------

    -- coc.nvim
    use {'neoclide/coc.nvim', branch='release'}

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- nvim-telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'fannheyward/telescope-coc.nvim'


    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- buferline
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- toggleterm
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
    }
    -- copilot
    use 'zbirenbaum/copilot.lua'
    -- bufdelete.nvim
    use 'famiu/bufdelete.nvim'
    -- comment
    use 'terrortylor/nvim-comment'
    -- wilder indent
    use 'gelguy/wilder.nvim'
    -- vim-surround
    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })
    -- aerial.nvim
    -- show function signature
    use 'stevearc/aerial.nvim'
    -- nvim-ts-ranbow
    -- rainbow parentheses
    use 'p00f/nvim-ts-rainbow'

    use "folke/twilight.nvim"

    -- align
    use 'Vonr/align.nvim'

    -- hop.nvim
    use 'phaazon/hop.nvim'

    -- normal模式自动将输入法切换为英文
    use { 'yaocccc/vim-fcitx2en', event = 'InsertLeavePre' }
    -- 高亮{}范围
    use { 'yaocccc/nvim-hlchunk', event = { 'CursorMoved', 'CursorMovedI' } }

    -- ranger in the nvim
    use 'kevinhwang91/rnvimr'

    use 'petertriho/nvim-scrollbar'
    -- wakatime: record time
    use 'wakatime/vim-wakatime'
end)

