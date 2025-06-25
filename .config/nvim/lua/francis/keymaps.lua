-- [[ Basic Keymaps ]]
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set("n", "<leader>gl", ":G log --decorate <CR>", { silent = true, desc = "[G]it [L]og window" })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move blocks of text up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remap to keep vim in visual mode when using '>' in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- get next search result in the center of the screen
-- vim.keymap.set("n", "n", "nzz")
-- vim.keymap.set("n", "N", "Nzz")
-- vim.keymap.set("n", "*", "*zz")
-- vim.keymap.set("n", "#", "#zz")

-- center cursor when navigating using ctrl-d and ctrl-u
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- nvim-tree keymaps
vim.keymap.set(
  "n",
  "<leader>e",
  vim.cmd.NvimTreeToggle,
  { noremap = true, silent = true, desc = "[e] Open/Close file explorer (nvim-tree)" }
)

-- Open vim fugitive (git plugin)
-- vim.keymap.set("n", "<leader>gs", ":Git<Cr>", { noremap = true, silent = true, desc = "[g]it overview" })

-- Better window navigation
vim.keymap.set("n", "<C-c>", "<C-w>c", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, { noremap = true, silent = true })

-- [ TODO ]
-- Better window resizing
-- vim.keymap.set("n", "<leader>.", function()
--   vim.cmd("resize +5")
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>,", function()
--   vim.cmd("resize -5")
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>=", function()
--   vim.cmd("vertical resize +5")
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>-", function()
--   vim.cmd("vertical resize -5")
-- end, { noremap = true, silent = true })
-- diagnostics window (trouble.nvim) related keymaps
-- vim.keymap.set("n", "<leader>tt", vim.cmd.TroubleToggle, { noremap = true, silent = true, desc = "Trouble window" })

-- Buffers
-- Close current buffer
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete, { noremap = true, silent = true, desc = "[x] Delete buffer" })
-- Close all buffers
vim.keymap.set("n", "<leader>X", function()
  vim.cmd.bufdo("bdelete")
end, { noremap = true, silent = true, desc = "[X] Delete all buffers" })
-- Delete file in current buffer
vim.keymap.set("n", "<leader>dd", ":!rm '%:p'<cr>:bd<cr>", { silent = true, desc = "[D]elete file in current buffer" })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sf", function()
  require("telescope.builtin").find_files({ hidden = false })
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>hf", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[H]idden [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })

-- foramt
-- vim.keymap.set("n", "<leader>f", ":Format<Cr>", { silent = true, desc = "[F]ormat Document" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Fugitive toggle
local function showFugitiveGit()
  if vim.fn.FugitiveHead() ~= "" then
    vim.cmd([[
    Git
    " wincmd H  " Open Git window in vertical split
    " setlocal winfixwidth
    " vertical resize 31
    " setlocal winfixwidth
    setlocal nonumber
    setlocal norelativenumber
    ]])
  end
end
local function toggleFugitiveGit()
  if vim.fn.buflisted(vim.fn.bufname("fugitive:///*/.git//$")) == 0 then
    showFugitiveGit()
  else
    vim.cmd([[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]])
  end
end
vim.keymap.set("n", "<leader>gs", toggleFugitiveGit, { desc = "[G]it [S]tatus" })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
