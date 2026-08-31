local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("lua_ls", {
  capabilities = capabilities,

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        globals = {
          "vim",
        },
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
})


vim.lsp.config("clangd", {
  capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    {
      offsetEncoding = { "utf-16" },
    }
  ),

  cmd = {
    "clangd",
    "--background-index",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--enable-config",
  },

  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})


vim.lsp.config("ts_ls", {
  capabilities = capabilities,

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "clangd",
    "lua_ls",
    "gopls",
    "ts_ls",
    "rust_analyzer",
  },
})


local border_style = "rounded"

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,

  float = {
    border = border_style,
    source = true,
    header = "",
    prefix = "",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local bufnr = event.buf

    local opts = {
      buffer = bufnr,
      silent = true,
    }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({
        border = border_style,
      })
    end, opts)

    vim.keymap.set(
      "n",
      "<leader>vws",
      vim.lsp.buf.workspace_symbol,
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>vd",
      vim.diagnostic.open_float,
      opts
    )

    vim.keymap.set(
      "n",
      "[d",
      vim.diagnostic.goto_next,
      opts
    )

    vim.keymap.set(
      "n",
      "]d",
      vim.diagnostic.goto_prev,
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>vca",
      vim.lsp.buf.code_action,
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>vrr",
      vim.lsp.buf.references,
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>vrn",
      vim.lsp.buf.rename,
      opts
    )

    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help({
        border = border_style,
      })
    end, opts)
  end,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})


local border_style = "rounded"

-- Extend your existing diagnostic config to include float styling
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = border_style,
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local bufnr = event.buf
    local opts = { buffer = bufnr, silent = true }


    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = border_style })
    end, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help({ border = border_style })
    end, opts)
  end,
})

