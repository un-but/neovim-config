return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          keymap = nil,

          -- Auto suggest
          auto_trigger = false,
          hide_during_completion = true,
          debounce = 75,
          trigger_on_accept = false,
        },
        filetypes = {
          ["*"] = true, -- All filetypes support
        },
        should_attach = function(_, bufname) -- Regulate's copilot's access to buffer
          if not vim.bo.buflisted or vim.bo.buftype ~= "" then
            return false
          end

          if bufname:match "^%.env" then
            return false
          end

          return true
        end,
      }
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    -- build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "gpt-4.1",
      temperature = 0.6,

      auto_insert_mode = false,
      auto_fold = true,

      headers = {
        user = "󱟄 UnBut",
        assistant = "  Copilot",
        tool = "󰅚  Error",
      },

      window = {
        title = "Copilot Chat",
        layout = "float",
        border = "rounded",
        width = 80,
      },

      mappings = {
        close = {
          normal = "q",
          insert = false,
        },
        reset = {
          normal = "<C-l>",
          insert = "<C-l>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        toggle_sticky = {
          normal = "grr",
        },
        clear_stickies = {
          normal = "grx",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        jump_to_diff = {
          normal = "gj",
        },
        quickfix_answers = {
          normal = "gqa",
        },
        quickfix_diffs = {
          normal = "gqd",
        },
        yank_diff = {
          normal = "gy",
          register = '"', -- Default register to use for yanking
        },
        show_diff = {
          normal = "gd",
          full_diff = false, -- Show full diff instead of unified diff when showing diff window
        },
        show_info = {
          normal = "gi",
        },
        show_context = {
          normal = "gc",
        },
        show_help = {
          normal = "gh",
        },
      },
    },
    cmd = { "CopilotChat", "CopilotChatToggle" },
  },
}
