return {
  -- INFO: STABLE
  { -- Search engine
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', },
    lazy = false,
    config = function()
      require('telescope').setup()
    end,
    keys = {
      -- { '<leader>ff', ':Telescope find_files<cr>', desc = 'Find files / Search project' },
      -- { '<leader>fg', ':Telescope live_grep<cr>',  desc = 'Find in files / Grep project' },
      -- { '<leader>ft', ':Telescope<cr>',            desc = 'Open Telescope / Select Telescope picker' },
    }
  },
  { -- Undo tree using telescope
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', },
    lazy = true,
    config = function()
      require('telescope').load_extension('undo')
    end,
    keys = {
      { '<leader>u', ':Telescope undo<cr>', desc = 'Undotree' }
    }
  },
}
