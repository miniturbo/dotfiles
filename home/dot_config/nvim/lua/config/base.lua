local opt = vim.opt

-- General
opt.number = true
opt.cursorline = true
opt.guicursor = ""
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.clipboard = "unnamedplus"
opt.swapfile = false

-- Indent
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
