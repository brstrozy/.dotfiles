vim.defer_fn(function()
  require('telescope.builtin').find_files()
end, 50)

