-- Create new notes
vim.keymap.set("n", "<leader>nn", vim.cmd.ObsidianNew, { silent = true, desc = "[N]ew [N]ote" })

-- Open note in obsidian
vim.keymap.set("n", "<leader>on", vim.cmd.ObsidianOpen, { silent = true, desc = "[N]ew [N]ote" })

-- Add template to empty buffer
vim.keymap.set("n", "<leader>nt", function()
  vim.cmd("%d")
  vim.cmd.ObsidianTemplate("note")
end, { silent = true, desc = "[N]ote [T]emplate" })

vim.keymap.set("n", "<leader>nd", vim.cmd.ObsidianToday, { silent = true, desc = "[N]ote [D]aily" })

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
-- To delete a note use the <leader>dd shortcut that deletes the file in the current buffer
