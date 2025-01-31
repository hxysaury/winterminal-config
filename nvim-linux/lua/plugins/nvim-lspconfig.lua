return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  opts = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    servers = {
      volar = {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      },
      emmet_ls = {
        filetypes = {
          "astro",
          "blade",
          "css",
          "eruby",
          "html",
          "htmldjango",
          "javascriptreact",
          "less",
          "pug",
          "sass",
          "scss",
          "svelte",
          "typescriptreact",
          "vue",
        },
      },
      rust_analyzer = {
        mason = false,
        cmd = { vim.fn.expand("~/.cargo/bin/rust-analyzer") },
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
      taplo = {
        keys = {
          {
            "K",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      },
      intelephense = {
        filetypes = { "php", "blade", "php_only" },
        cmd = {
          "/home/yunxi/.local/share/pnpm/global/5/node_modules/intelephense/lib/intelephense.js",
          "--stdio",
        }, -- 指定执行程序路径
        settings = {
          intelephense = {
            filetypes = { "php", "blade", "php_only" },
            files = {
              associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
              maxSize = 5000000,
            },
          },
        },
      },
      pyright = {},
      ruff = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
      ruff_lsp = {
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
    },
  },
}
