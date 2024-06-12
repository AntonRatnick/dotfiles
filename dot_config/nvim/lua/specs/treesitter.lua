-- INFO: STABLE
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects', -- Text objects like 'vif' - is going to select inside function, 'dif' - delete class inner impl
      'nvim-treesitter/nvim-treesitter-context',     -- If function too long, it allow to see the definition on top
      'nvim-treesitter/nvim-treesitter-refactor',    -- Refactor using the TreeSitter nodes, like swap or highlight
      'windwp/nvim-ts-autotag',                      -- Adds closing tag in markup languages
      'nushell/tree-sitter-nu'
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'typescript', 'tsx', 'lua', 'html', 'json', 'javascript', 'rust' },
        highlight = { enable = true, },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",
              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
            },
          },
        },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = false,
          },
        },
        autotag = {
          enable = true,
        }
      }

      vim.o.updatetime = 100 -- Required for highlight definition to work fast

      require 'treesitter-context'.setup {
        max_lines = 10,          -- How many lines the window should span. Values <= 0 mean no limit.
        line_numbers = false,
        multiline_threshold = 5, -- Maximum number of lines to show for a single context
      }
    end
  },
  {
    'ckolkey/ts-node-action',
    lazy = true,
    dependencies = { 'nvim-treesitter' },
    opts = {},
  },
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    keys = {
      { "<leader>rr", function() require("ssr").open() end, mode = {"n", "x"}, desc = "open SSR" }
    }
  }
}
