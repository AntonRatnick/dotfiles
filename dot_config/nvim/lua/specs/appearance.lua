-- INFO: STABLE
return {
  { -- Theme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup { flavour = 'frappe' }
      vim.cmd.colorscheme 'catppuccin'
    end
  },
  { -- Todo comments highlight
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {}
  },
  { -- Status line
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        globalstatus = true,
        theme = 'catppuccin',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          }
        }
      }
    }
  },
  { -- Notifications
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
      vim.notify = require('fidget.notification').notify
    end
  },
  { -- Enhanced vim ui
    'stevearc/dressing.nvim',
    opts = {},
  },
}
