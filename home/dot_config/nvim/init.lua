if not vim.g.vscode then
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"

  require("config.base")
  require("config.keymaps")
  require("config.lazy")
end
