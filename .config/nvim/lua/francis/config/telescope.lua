-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
  defaults = {
    disable_devicons = true,
    color_devicons = false,
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
      n = {
        ["q"] = "close",
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
