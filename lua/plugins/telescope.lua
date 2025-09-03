return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ahmedkhalf/project.nvim",
  },
  config = function()
    telescope = require("telescope")

    telescope.setup {
      extensions = {
        projects = {},
      },
    }

    telescope.load_extension("projects")
    telescope.setup {}
  end,
}
