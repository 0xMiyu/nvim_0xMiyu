local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "java"
  },
  cli_options = {
      arrow_parens = "always",
      bracket_spacing = true,
      end_of_line = "lf",
      print_width = 80,
      tab_width = 4
  }
})
