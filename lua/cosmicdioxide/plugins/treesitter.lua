return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      if vim.fn.executable("tree-sitter") == 1 then
        treesitter.install({
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "vimdoc",
          "c",
          "go",
          "gomod",
          "gowork",
          "gosum",
        })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "json", "javascript", "typescript",
          "typescriptreact", "yaml", "html", "css",
          "prisma", "markdown", "svelte", "graphql",
          "sh", "lua", "vim", "dockerfile",
          "gitignore", "query", "vimdoc",
          "c", "go", "gomod", "gowork", "gosum",
        },
        callback = function()
          -- Syntax highlighting
          vim.treesitter.start()

          -- Indentation
          vim.bo.indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },
}
