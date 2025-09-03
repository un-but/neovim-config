return {
  -- Copilot (автодополнение)
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "gpt-4.1",
      chat_autocomplete = true,
      question_header = "󱟄 UnBut",
      answer_header = "  Copilot",
      error_header = "󰅚  Error",

      window = {
        title = "Copilot Chat",
        layout = "vertical",
        width = 0.4,
      },

      mappings = {
        complete = {
          insert = "<Tab>",
        },
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
          normal = 'grr',
        },
        clear_stickies = {
          normal = 'grx',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        jump_to_diff = {
          normal = 'gj',
        },
        quickfix_answers = {
          normal = 'gqa',
        },
        quickfix_diffs = {
          normal = 'gqd',
        },
        yank_diff = {
          normal = 'gy',
          register = '"', -- Default register to use for yanking
        },
        show_diff = {
          normal = 'gd',
          full_diff = false, -- Show full diff instead of unified diff when showing diff window
        },
        show_info = {
          normal = 'gi',
        },
        show_context = {
          normal = 'gc',
        },
        show_help = {
          normal = 'gh',
        },
      },
    },
    cmd = { "CopilotChat", "CopilotChatToggle" }
  },
}
