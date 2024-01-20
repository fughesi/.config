return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require "lspconfig"

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true, desc = "" }

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts, { desc = "Go to declaration" })

      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "See available code actions" })

      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "Smart rename" })

      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts, { desc = "Show line diagnostics" })

      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts, { desc = "Go to previous diagnostic" })

      keymap.set("n", "]d", vim.diagnostic.goto_next, opts, { desc = "Go to next diagnostic" })

      keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "Show documentation under cursor" })
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure typescript server with plugin
    lspconfig["tsserver"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure css server
    lspconfig["cssls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure bash server
    lspconfig["bashls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "sh", "zsh", "fish", "bash" },
    }

    -- configure svelte server
    lspconfig["svelte"].setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    }

    -- configure php servers
    -- lspconfig["intelephense"].setup {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   filetypes = { "php" },
    --   },
    -- }

    -- configure prisma orm server
    lspconfig["prismals"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure graphql language server
    lspconfig["graphql"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    }

    -- configure emmet language server
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }

    -- configure python server
    lspconfig["pyright"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure rust server
    lspconfig["rust_analyzer"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        diagnostics = {
          enable = false,
        },
      },
    }

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }
  end,
}
