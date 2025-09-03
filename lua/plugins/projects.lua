return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".git" },
        show_hidden = true,
        silent_chdir = true,
        scope_chdir = "global",
        datapath = vim.fn.stdpath "data",
      }
    end,
  },
}
