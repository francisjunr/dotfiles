-- [[ Setting options ]]
-- See `:help vim.o`

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Set highlight on search
vim.o.hlsearch = false

-- Set Scroll offset
-- vim.o.scrolloff = 10

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Set each indentation 2 spaces and tab output 2 spaces
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- All horizontal split windows open below current window
-- vim.o.splitbelow = true

-- Shows live what a command is about to do to the buffer in a split in real-time
-- vim.o.inccommand = "split"

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable Syntax
vim.cmd("syntax on")

-- Highlight the line on which the cursor is
vim.o.cursorline = true

-- Global status line
vim.o.laststatus = 3

-- create release command
vim.cmd([[command! -nargs=+ Release !release <args>]])

-- Enable folds
vim.cmd("set foldmethod=indent")

-- disable fold on opening a file
vim.cmd("set nofoldenable")

-- dont fold all folds recursively when applying fold for the first time after opening a file
vim.o.foldlevel = 100

-- set no line wrap
vim.o.wrap = false
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Make background transperent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Function to change the working directory to the directory opened with Neovim
local function change_directory()
  local args = vim.fn.argv()
  if #args > 0 and vim.fn.isdirectory(args[1]) == 1 then
    vim.cmd("cd " .. args[1])
  end
end

-- Autocommand to run the function on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  callback = change_directory,
})
