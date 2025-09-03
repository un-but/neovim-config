require "nvchad.options"

-- add yours here!
local options = {
  clipboard = "", -- Использование системного буфера обмена
  relativenumber = true, -- Относительные номера строк

  backup = false, -- Отключение резервного копирования файлов

  wrap = false, -- Перенос строк
  smoothscroll = true, -- Плавная прокрутка
  scrolloff = 8, -- Количество строк, которые будут видны над и под курсором

  cursorline = true, -- Подсветка строки с курсором
  updatetime = 250, -- Время обновления в миллисекундах

  expandtab = true, -- использовать пробелы вместо табов
  shiftwidth = 4, -- размер отступа при автоотступе
  tabstop = 4, -- ширина таба
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
