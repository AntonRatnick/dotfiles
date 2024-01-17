-- WARN: This spec is WIP, should be refactored and splitted to separate files

vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyDone',
  callback = function()
    local lsp_zero = require('lsp-zero')
    require('copilot').setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
    require('copilot_cmp').setup()

    lsp_zero.set_sign_icons({ error = '✘', warn = '▲', hint = '⚑', info = '»' })
    lsp_zero.format_mapping('<leader>cp', {
      format_opts = { async = false, timeout_ms = 10000 },
      servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['null-ls'] = { 'typescript', 'typescriptreact', 'json', 'javascript', 'javascriptreact' },
      }
    })

    ---@diagnostic disable-next-line: unused-local -- client
    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
      local opts = { buffer = bufnr }
      Map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      Map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      Map('n', '<leader>ch', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        lsp_zero.default_setup,
        tsserver = function()
          require('lspconfig').tsserver.setup({
            single_file_support = false,
            on_init = function(client)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentFormattingRangeProvider = false
            end
          })
        end,
      }
    })

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        })
      })
    })

    local null_ls = require("null-ls")
    null_ls.setup({
      debug = true,
      sources = {
        -- null_ls.builtins.formatting.biome,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.ts_node_action,
      },
    })
  end,
})

return {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' }
    },
  },
  {
    'nvimtools/none-ls.nvim',
    config = false
  },
  'zbirenbaum/copilot.lua',
  'zbirenbaum/copilot-cmp',
  -- See if I need it
}
