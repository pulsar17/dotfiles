-- Copyright 2022, Ishaan Arora (ishaanarora1000@gmail.com)
--
--This program is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.

--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.

--You should have received a copy of the GNU General Public License
--along with this program.  If not, see <https://www.gnu.org/licenses/>.

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Nice to remember what these mean
--
-- expandtab    -  I don't want to enter <Tab>s at all
--              -  relevant for new files/characters
--                  (nvi)
--                  ~ map <Tab> <Space>
--                  in >>
--                  in :norm 0i<Tab>
--
-- shiftwidth   - Spaces to shift by while indenting
--                  (nv)
--                  in >>
--
-- tabstop      - How wide existing tabs look
--                  (nvi)
--
-- softtabstop  - A <Tab> in insert mode = softtabstop spaces
--                  Except, damn it smarttab
--                  (i)

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4


-- Annoying default split directions
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Some nice characters
vim.opt.list = false
vim.opt.showbreak = "↪"
vim.opt.listchars = {nbsp = "⍽", tab = "⇥ ", trail = "•" , eol = "↵"}

vim.opt.undofile = true

vim.opt.cursorline = true

-- Copyright (c) 2021 Michael Lingelbach
-- MIT License

-- Disable search highlight
vim.opt.hlsearch = false

vim.opt.signcolumn = 'yes'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({timeout=200})
  end,
  group = highlight_group,
  pattern = '*',
})

-- Make terminal act somewhat like a terminal
local terminal_group = vim.api.nvim_create_augroup('CleanTerm', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.opt.signcolumn = 'no'
    vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')
  end,
  group = terminal_group,
  pattern = '*',
})

--Set colorscheme
vim.opt.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
