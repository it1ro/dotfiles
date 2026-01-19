local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        extras = {
          -- Formatting
          "formatting.prettier",

          -- Languages (твои основные)
          "lazyvim.plugins.extras.lang.ruby",
          "lazyvim.plugins.extras.lang.typescript",
          "lazyvim.plugins.extras.lang.elixir",
          "lazyvim.plugins.extras.lang.go",
          "lazyvim.plugins.extras.lang.dart",

          -- Infra / DevOps / Web
          "lazyvim.plugins.extras.lang.docker",
          "lazyvim.plugins.extras.lang.json",
          "lazyvim.plugins.extras.lang.yaml",

          -- Testing
          "lazyvim.plugins.extras.test.core",
        },
      },
    },

    -- Твои пользовательские плагины
    { import = "plugins" },
  },

  defaults = {
    lazy = false,
    version = false,
  },

  install = {
    colorscheme = { "tokyonight", "habamax" },
  },

  checker = {
    enabled = true,
    notify = false,
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
