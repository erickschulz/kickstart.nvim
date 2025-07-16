return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- You can add custom Neogit configuration here if needed
      -- For example, to use Telescope for certain actions:
      require('neogit').setup {
        integrations = {
          telescope = true,
          diffview = true,
        },
      }

      -- Set up a keymap for Neogit
      vim.keymap.set('n', '<leader>n', function()
        require('neogit').open()
      end, { noremap = true, silent = true, desc = '[N]eogit (git)' })
    end,
  },
}
