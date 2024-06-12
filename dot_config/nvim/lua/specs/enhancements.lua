-- INFO: STABLE
return {
  { -- Comment engine
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
    lazy = false,
  },
  { -- Persisted undo files
    'kevinhwang91/nvim-fundo',
    dependencies = 'kevinhwang91/promise-async',
    build = function()
      require('fundo').install()
    end
  },
  { -- Better quickfix list
    'kevinhwang91/nvim-bqf',
    ft = 'qf'
  }
}
