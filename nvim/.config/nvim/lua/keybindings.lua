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


vim.g.mapleader = ','
vim.g.localmapleader = ','

local function appendEmptyLine()
    local lineNo, _ = unpack(vim.api.nvim_win_get_cursor(0))
    -- lineNo is 1 based but nvim_buf_set_lines is 0 based
    -- This is the required beahvior since this will result 
    -- in a line being appended after the current line.
    vim.api.nvim_buf_set_lines(0, lineNo, lineNo, false, { '' })
end

local function prependEmptyLine()
    local lineNo, _ = unpack(vim.api.nvim_win_get_cursor(0))
    lineNo = lineNo - 1
    vim.api.nvim_buf_set_lines(0, lineNo, lineNo, false, { '' })
end

vim.keymap.set('n', '<Leader>i', prependEmptyLine)
vim.keymap.set('n', '<Leader>o', appendEmptyLine)

-- Buffer movements
vim.keymap.set({'n', 'v'}, '<C-H>', '<C-W>h')
vim.keymap.set({'n', 'v'}, '<C-J>', '<C-W>j')
vim.keymap.set({'n', 'v'}, '<C-K>', '<C-W>k')
vim.keymap.set({'n', 'v'}, '<C-L>', '<C-W>l')
vim.keymap.set('i', '<C-H>', '<Esc><C-W>h')
vim.keymap.set('i', '<C-J>', '<Esc><C-W>j')
vim.keymap.set('i', '<C-K>', '<Esc><C-W>k')
vim.keymap.set('i', '<C-L>', '<Esc><C-W>l')

-- Buffer movements for terminal mode
vim.keymap.set('t', "<C-H>", "<C-\\><C-N><C-H>", {noremap=true})
vim.keymap.set('t', "<C-J>", "<C-\\><C-N><C-J>", {noremap=true})
vim.keymap.set('t', "<C-K>", "<C-\\><C-N><C-K>", {noremap=true})
-- Intentional comment, interferes with Ctrl-L for clearing the terminal
-- vim.keymap.set('t', "<C-L>", "<C-\\><C-N><C-L>", {remap=true})

-- Annoying basic defaults
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})

vim.keymap.set({'n', 'i', 'v'}, '<F6>', function() vim.opt.list = not vim.opt.list:get() end)

