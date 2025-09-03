return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    filters = {
      dotfiles = false, -- Показывать скрытые файлы (начинающиеся с .)
      git_ignored = false, -- Показывать файлы, игнорируемые git (.gitignore)
    },
    view = {
      width = 40, -- Устанавливает ширину дерева
    },
    actions = {
      open_file = {
        quit_on_open = true, -- Закрывает nvim-tree при выборе файла
      },
    },
  },
}
