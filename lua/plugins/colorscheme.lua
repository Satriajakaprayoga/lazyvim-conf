return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      highlights = {
        -- Ubah warna untracked files (Snacks picker)
        SnacksPickerGitStatusUntracked = { fg = "#FF8800" }, -- ganti warna sesuai selera
        -- Kalau mau sekalian ubah semua NonText jadi lebih terang:
        -- NonText = { fg = "#666666" },
        SnacksPickerPathIgnored = { fg = "#FFCCD5" },
        SnacksPickerPathHidden = { fg = "#FFCCD5" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
