vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

local function copy_relative_path()
  local project_root = nil
  local ok, project_nvim = pcall(require, "project_nvim")
  if ok and project_nvim.get_project_root then
    project_root = project_nvim.get_project_root()
  end

  if not project_root or project_root == "" then
    project_root = vim.fn.getcwd()
  end

  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file == "" then
    vim.notify("Нет активного файла", vim.log.levels.WARN)
    return
  end

  local Path = require("plenary.path")
  local rel_path = Path:new(current_file):make_relative(project_root)

  vim.fn.setreg("+", rel_path)
  vim.fn.setreg("*", rel_path)
  vim.notify("Скопирован относительный путь: " .. rel_path, vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader>fp", copy_relative_path, { desc = "Copy relative file path" })

vim.keymap.set("i", "<C-e>", "<Right>", { silent = true })
