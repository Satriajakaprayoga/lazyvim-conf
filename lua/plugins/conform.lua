return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      prettier = {
        command = vim.fn.stdpath("data") .. "/mason/bin/prettier",
        args = { "--stdin-filepath", "$FILENAME" },
      },
    },
    formatters_by_ft = {
      php = { "pint", "php-cs-fixer", "phpcs" },
      javascript = { "prettier", "eslint_d" },
      typescript = { "prettier", "eslint_d" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
    },
  },
}
