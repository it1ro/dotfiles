return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  opts = function(_, opts)
    opts.endwise = { enable = true }
    opts.indent = { enable = true, disable = { "yaml", "ruby" } }
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex" })
    vim.treesitter.language.register("markdown", "livebook")
  end,
}
