return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  -- Your global keymaps to open/close/view history
  keys = {
    { '<leader>do', '<cmd>DiffviewOpen<CR>', desc = 'Diffview [O]pen' },
    { '<leader>dc', '<cmd>DiffviewClose<CR>', desc = 'Diffview [C]lose' },
    { '<leader>dh', '<cmd>DiffviewFileHistory %<CR>', desc = 'Diffview [H]istory' },
  },
  config = function()
    -- -- Simple diff colors - just background colors
    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#324353' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#432936' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#23303d' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#324353' })

    local actions = require 'diffview.actions'

    require('diffview').setup {
      enhanced_diff_hl = true,
      diff_options = {
        '--ignore-all-space', -- or "-w"
      },
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },

      keymaps = {
        view = {
          -- Your conflict resolution keybindings
          ['co'] = function()
            actions.conflict_choose 'ours'
          end,
          ['ct'] = function()
            actions.conflict_choose 'theirs'
          end,
          ['cb'] = function()
            actions.conflict_choose 'base'
          end,
        },
        file_panel = {
          -- Your close keymap
          ['q'] = '<cmd>DiffviewClose<cr>',
        },
      },
    }
  end,
}
