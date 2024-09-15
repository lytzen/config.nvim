return {
  'arnarg/todotxt.nvim',
  setup = function()
    require('todotxt-nvim').setup {
      todo_file = '/Users/mlh/Documents/todo/todo.txt',
    }
  end,
}
