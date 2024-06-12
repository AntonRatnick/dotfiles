-- INFO: STABLE
return {
  {
    'echasnovski/mini.files',
    version = false,
    lazy = false,
    config = function()
      require('mini.files').setup({
        mappings = {
          go_in       = 'L',
          go_in_plus  = 'l',
          synchronize = '<C-s>',
          close       = '<C-c>',
          reset       = '<C-r>',
        },
        windows = {
          preview = true,
          width_preview = 80
        }
      })
    end,
    keys = {
      { '<leader>n', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>', desc = 'Open files navigation / Files tree' }
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
    keys = {
      { '<leader>m', ':lua  require("harpoon"):list():add()<cr>' },
      { '<leader>b', ':lua  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<cr>' },
      -- {
      --   '<C-p>',
      --   function()
      --     local harpoon = require('harpoon')
      --     harpoon:list():prev()
      --     vim.notify(vim.fn.expand('%F'), nil, { annote = 'Harpoon', key = 'harpoon' })
      --   end
      -- },
      -- { '<C-n>',
      --   function()
      --     local harpoon = require('harpoon')
      --     harpoon:list():next()
      --     vim.notify(vim.fn.expand('%F'), nil, { annote = 'Harpoon', key = 'harpoon' })
      --   end
      -- }
      { '<C-p>',     ':cprev<cr>' },
      { '<C-n>',     ':cnext<cr>' }
    }
  }
}
