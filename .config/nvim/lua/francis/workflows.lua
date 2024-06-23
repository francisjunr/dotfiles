-- Create new notes
vim.keymap.set("n", "<leader>nn", vim.cmd.ObsidianNew, { silent = true, desc = "[N]ew [N]ote" })

-- Notes review remaps
-- Open all notes in the ram folder
vim.keymap.set("n", "<leader>nr", ":args ram/*<CR>", { silent = true, desc = "[N]otes [R]eview" })
-- Move note to pipe folder
vim.keymap.set(
  "n",
  "<leader>na",
  ":!mv '%:p' '/Users/francisjr/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/pipe'<CR>:bd<cr>",
  { silent = true, desc = "[N]ote [A]dd" }
)
-- Delete note
vim.keymap.set("n", "<leader>nd", ":!rm '%:p'<cr>:bd<cr>", { silent = true, desc = "[N]ote [D]elete" })
