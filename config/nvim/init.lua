
vim.cmd [[packadd packer.nvim]]
local opt = vim.opt

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 0
opt.shiftround = true
opt.autoindent = true

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

opt.mouse = null
opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

vim.cmd
[[
    augroup change_cursor
        au!
        au ExitPre * :set guicursor=a:ver90
    augroup END
]] 

--git clone --depth 1 https://github.com/wbthomason/packer.nvim\                                  
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

myterm = os.getenv("TERM")
if (myterm == "xterm-kitty") then
  mysep = { left = '', right = ''}
  mycum = { left = '', right = ''}
elseif (myterm == "alacritty") then
  mycum = { left = '', right = ''}
  mysep = { left = '', right = ''}
else
  mysep = { left = ']', right = '['}
  mycum = { left = '\\', right = '/'}
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "olimorris/onedarkpro.nvim"
  use 'vim-airline/vim-airline-themes'
  use 'karb94/neoscroll.nvim'
  use {"ellisonleao/glow.nvim"}
  use {
    'nvim-treesitter/nvim-treesitter',
     run = function()
     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
     ts_update()
     end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)


require("onedarkpro").setup({
  theme = "onedark_vivid",
  colors = {
    bg = "#FFFFFF",
  },
  options = {
    transparency = true,
    bold = true,
    italic = false,
    underline = false,
    undercurl = true
  }
})

vim.cmd("colorscheme onedarkpro")

require('lualine').setup {
  options = {
    theme = 'onedark',
--    component_separators = { left = '', right = ''},
--    section_separators = { left = '', right = ''},
    component_separators = mycum,
    section_separators = mysep,
  }
}
require('neoscroll').setup({
    easing_function = "quadratic"
})
