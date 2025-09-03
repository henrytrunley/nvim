return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {},
        },
      }
      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope find help' })
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = 'Telescope find in neovim config' })
      vim.keymap.set('n', '<leader>sp', function()
        builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy') })
      end, { desc = 'Telescope find in neovim packages' })
      vim.keymap.set('n', '<leader>sk', builtin.git_files, { desc = 'Telescope find git files' })
      vim.keymap.set('n', '<leader>sg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end, { desc = 'Telescope grep files' })
      vim.keymap.set('n', '<leader>sc', function()
        builtin.grep_string();
      end, { desc = 'Telescope grep text under cursor' })
    end,
  }
}
