return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 130,
      },
    },
    keys = {
      { '<leader>z', ':ZenMode<cr>' },
    }
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "goodrx",
          path = "~/vaults/goodrx",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },

      -- see below for full list of options 👇
    },
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
      {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
          -- calling `setup` is optional for customization
          require("fzf-lua").setup({})
        end
      }
    end,
    keys = {
      { '<leader>ff', ':lua require("fzf-lua").files()<cr>', desc = 'Find files / Search project' },
      { '<leader>fg', ':lua require("fzf-lua").grep()<cr>',  desc = 'Find in files / Grep project' },
    }
  }
}
