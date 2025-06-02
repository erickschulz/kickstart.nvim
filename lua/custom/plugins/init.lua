-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  vim.keymap.set('n', '<F8>', '<cmd>CMakeGenerate<cr>', { silent = true }),
  vim.keymap.set('n', '<F9>', '<cmd>CMakeBuild<cr>', { silent = true }),
}
