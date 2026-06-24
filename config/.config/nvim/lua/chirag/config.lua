vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.updatetime = 200
vim.opt.timeoutlen = 200
vim.o.laststatus = 0
vim.opt.hlsearch = false
vim.opt.mouse = ""


vim.diagnostic.config({
  virtual_text = true, -- inline errors
  signs = true,        -- gutter icons
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
  },
})


vim.api.nvim_create_user_command("Search", function(opts)
  vim.cmd('vimgrep /' .. opts.args .. '/j **/*')
end, { nargs = 1 })


vim.lsp.config.gopls = {
  on_attach = function(client, bufnr)
    -- enable formatting if supported
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}

vim.lsp.config.clangd = {
  on_attach = function(client, bufnr)
  end,
  cmd = {
    "clangd",
    "--clang-tidy",
    "--enable-config"
  }
}

vim.lsp.config.lua_ls = {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
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
}


vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = function(client, bufnr)
    -- enable formatting if supported
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}


vim.lsp.config.pylsp = {
  on_attach = function(client, bufnr)
    ---    if client.server_capabilities.documentFormattingProvider then
    ---      vim.api.nvim_create_autocmd("BufWritePre", {
    ---        buffer = bufnr,
    ---        callback = function()
    ---          vim.lsp.buf.format({ bufnr = bufnr })
    ---        end,
    ---      })
    ---    end
  end
}

vim.lsp.config.bashls = {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}



vim.lsp.config.pylsp = {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}

vim.lsp.config.html = {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}

vim.lsp.config.cssls = {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})
