return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      local langs = {
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "pug",
        "scss",
        "toml",
        "typescript",
        "vue",
      }

      ts.install(langs)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = langs,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
