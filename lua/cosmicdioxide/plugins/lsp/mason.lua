return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    local servers = { "lua_ls" }

    -- These language servers are distributed through npm. Avoid repeated
    -- installation failures on machines where Node.js is not installed.
    if vim.fn.executable("node") == 1 and vim.fn.executable("npm") == 1 then
      vim.list_extend(servers, {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "ts_ls",
      })
    end

    if vim.fn.executable("go") == 1 then
      table.insert(servers, "gopls")
    end

    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    local tools = {
        "isort",    -- python formatter
        "black",    -- python formatter
        "pylint",   -- python linter
    }

    -- npm-backed packages cannot be installed without Node.js. Add them when
    -- the required runtime is available instead of failing on every startup.
    if vim.fn.executable("node") == 1 and vim.fn.executable("npm") == 1 then
      vim.list_extend(tools, { "prettier", "eslint_d" })
    end

    mason_tool_installer.setup({
      ensure_installed = tools,
    })
  end,
  opts = {
    ensure_installed = {
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "golangci-lint",
      "delve",
    }
  }

}
