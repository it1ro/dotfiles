return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      elixir = { "mix" },
      heex = { "mix" }, -- 🔥 форматирование HEEx через mix format
      eelixir = { "mix" }, -- для встроенных шаблонов
      html = {}, -- не трогаем HTML, чтобы не конфликтовать
      yaml = {},
      yml = {},
    },

    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype

      -- HEEx и Elixir всегда форматируем mix format
      if ft == "heex" or ft == "eelixir" or ft == "elixir" then
        return {
          timeout_ms = 2000,
          lsp_fallback = false, -- важно: форматируем только mix format
        }
      end

      -- Остальные — как обычно
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
  },
}
