return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      prompt = "Cari  ",
      layout = {
        cycle = true,
      },
    },
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "s", desc = "Pungkasing Padamelan", section = "session" },
          { icon = " ", key = "f", desc = "Pados fail", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "File awis", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Pados seratan", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Fail rumiyin", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Tatanan",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = "X", key = "x", desc = "Extras", action = ":LazyExtras" },
          { icon = " ", key = "q", desc = "Medal", action = ":qa" },
        },
        -- Used by the `header` section
        header = [[
 ██▓███   █    ██▓██   ██▓ ██ ▄█▀ ██▓ ███▄ ▄███▓ █    ██  ██▓
▓██░  ██▒ ██  ▓██▒▒██  ██▒ ██▄█▒ ▓██▒▓██▒▀█▀ ██▒ ██  ▓██▒▓██▒
▓██░ ██▓▒▓██  ▒██░ ▒██ ██░▓███▄░ ▒██▒▓██    ▓██░▓██  ▒██░▒██▒
▒██▄█▓▒ ▒▓▓█  ░██░ ░ ▐██▓░▓██ █▄ ░██░▒██    ▒██ ▓▓█  ░██░░██░
▒██▒ ░  ░▒▒█████▓  ░ ██▒▓░▒██▒ █▄░██░▒██▒   ░██▒▒▒█████▓ ░██░
▒▓▒░ ░  ░░▒▓▒ ▒ ▒   ██▒▒▒ ▒ ▒▒ ▓▒░▓  ░ ▒░   ░  ░░▒▓▒ ▒ ▒ ░▓  
░▒ ░     ░░▒░ ░ ░ ▓██ ░▒░ ░ ░▒ ▒░ ▒ ░░  ░      ░░░▒░ ░ ░  ▒ ░
░░        ░░░ ░ ░ ▒ ▒ ░░  ░ ░░ ░  ▒ ░░      ░    ░░░ ░ ░  ▒ ░
            ░     ░ ░     ░  ░    ░         ░      ░      ░  
                  ░ ░                                        
]],
      },
      -- item field formatters
      formats = {
        icon = function(item)
          --   if item.file and item.icon == "file" or item.icon == "directory" then
          --     return M.icon(item.file, item.icon)
          --   end
          return { item.icon, width = 2, hl = "icon" }
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },
      sections = {
        { section = "header" },
        -- {
        --   pane = 2,
        --   section = "terminal",
        --   cmd = "colorscript -e 5",
        --   height = 5,
        --   padding = 1,
        -- },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Fail rumiyin", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Proyek", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
