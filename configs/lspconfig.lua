local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "lua_ls", "tsserver", "clangd", "pyright", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      -- Attach nvchad original on_attach
      on_attach(client, bufnr)

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end,
    capabilities = capabilities,
  }
end

-- Setup rust stuff
local rt = require "rust-tools"
local expand_macro = require "rust-tools.expand_macro"
rt.setup {
  server = {
    on_attach = function(client, bufnr)
      -- Attach nvchad original on_attach
      on_attach(client, bufnr)

      -- Enable formatting capabilities
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true

      local opts = { buffer = bufnr, remap = false }

      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)

      -- Code action groups
      vim.keymap.set("n", "<leader>la", rt.code_action_group.code_action_group, opts)

      -- Expand macro
      vim.keymap.set("n", "<leader>le", expand_macro.expand_macro)

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end,
    diagnostic = {
      enable = true,
      disabled = { "unresolved-proc-macro" },
      enableExperimental = true,
    },
  },
}
