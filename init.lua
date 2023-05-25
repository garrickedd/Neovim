--[[
                       _      _            _     _ 
                      (_)    | |          | |   | |
  __ _  __ _ _ __ _ __ _  ___| | _____  __| | __| |
 / _` |/ _` | '__| '__| |/ __| |/ / _ \/ _` |/ _` |
| (_| | (_| | |  | |  | | (__|   <  __/ (_| | (_| |
 \__, |\__,_|_|  |_|  |_|\___|_|\_\___|\__,_|\__,_|
  __/ |                                            
 |___/                                             
Vim customized by DungChan
]]

-------------------------------------------------------------
-- => General settings
-------------------------------------------------------------
vim.opt.number = true                       -- Enable line numbers
vim.opt.mouse = 'a'                         -- Enable mouse
vim.o.tabstop = 4                           -- Tab settings
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.listchars = "tab:¦\\"                 -- Tab character visualization
vim.o.list = true
vim.o.foldmethod = "syntax"                 -- Folding settings
vim.o.foldnestmax = 1
vim.o.foldlevelstart = 0
vim.o.ignorecase = true                     -- Enable case-insensitive search

-- Disable backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Optimize
vim.opt.synmaxcol = 200
vim.opt.lazyredraw = true
vim.cmd("syntax on")

-- Enable copying from vim to clipboard
-- Check if the clipboard provider is available
if vim.fn.has('clipboard') then
    -- Use the system clipboard for copy and paste
    vim.o.clipboard = 'unnamedplus'
end

-- Auto reload content changed outside

-- Window resizing key mappings
vim.api.nvim_set_keymap('n', '<M-Right>', ':vertical resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Left>', ':vertical resize -1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Down>', ':resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ':resize -1<CR>', { noremap = true })


-------------------------------------------------------------
-- => Plugin list
-- (used with Vim-plug - https://github.com/junegunn/vim-plug)
-------------------------------------------------------------
vim.cmd([[call plug#begin('~/AppData/Local/nvim/plugged')]])
-- Use path '~/.config/nvim/plugged' for Linux
-- Theme
vim.cmd([[Plug 'arcticicestudio/nord-vim']])

vim.cmd([[call plug#end()]])

-------------------------------------------------------------
-- => Plugin settings
-------------------------------------------------------------
-- Disable automatic comment in newline
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=cro
]])


-------------------------------------------------------------
-- => Themes
vim.opt.guifont = 'Consolas:h10'
vim.cmd('colorscheme nord')
-------------------------------------------------------------


-------------------------------------------------------------
-- => Others
-------------------------------------------------------------
local vim = vim
local settings_dir = vim.fn.expand("~/AppData/Local/nvim/settings")
for _, setting_file in ipairs(vim.fn.split(vim.fn.glob(settings_dir .. "/*.vim"), "\n")) do
  vim.cmd("source " .. setting_file)
end
