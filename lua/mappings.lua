require "nvchad.mappings"

-- Disable mappings
local function safe_unmap(mode, lhs)
  local ok, _ = pcall(function()
    vim.keymap.del(mode, lhs)
  end)
  return ok
end

safe_unmap("n", "<leader>")
safe_unmap("n", "<leader>e")
safe_unmap("n", "<leader>ds")
safe_unmap("n", "<leader>/")
safe_unmap("n", "<leader>/")
safe_unmap("n", "<C-n>")
safe_unmap("n", "<leader>b")
safe_unmap("n", "<leader>x")
safe_unmap("n", "<leader>D")

-- Enable mappings
local map = vim.keymap.set

-- Micro improvements
map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "v" }, "<C-c>", '"+y', { desc = "Yank to system clipboard" })
map("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })

map("n", "<A-b>", "<cmd>enew<CR>", { desc = "Create new buffer" })
map("n", "<A-q>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close current buffer" })

map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Tabs

for i = 1, 9 do
  map("n", "<A-" .. i .. ">", function()
    local tabcount = vim.fn.tabpagenr "$"
    if tabcount < i then
      for _ = tabcount, i - 1 do
        vim.cmd "tabnew"
      end
    end
    vim.cmd(i .. "tabnext")
  end, { desc = "Go to tab " .. i })
end

map("n", "<A-c>", ":tabclose<CR>", { desc = "Close current tab" })

-- LSP mappings
map("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Line diagnostics" })
map("n", "<leader>dd", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Line Code Action" })
map("n", "<leader>dS", "<cmd>Telescope diagnostics<cr>", { desc = "File diagnostics" })
map("n", "<leader>dD", "<cmd>EslintFixAll<cr>", { desc = "Fix all problems (eslint)" })
map("n", "<leader>df", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
map("n", "<leader>dr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename structure" })

map("n", "<A-d>", ":tab DBUI<CR>", { desc = "Open DBUI in new tab" })

-- NvChad
map("n", "<leader>cd", "<cmd>Nvdash<cr>", { desc = "DashBoard" })
map("n", "<A-e>", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree" })
map("n", "<A-m>", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<A-l>", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Copilot
map("i", "<C-j>", 'copilot#Accept("")', {
  expr = true,
  replace_keycodes = false,
  desc = "Copilot: accept suggestion",
})

map("n", "<A-a>", "<cmd>CopilotChatToggle<cr>", { desc = "Copilot Chat" })

-- Snippets
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<C-k>"
end, { expr = true, silent = true, desc = "LuaSnip: expand or jump" })

-- Change window size
map("n", "<A-[>", function()
  if vim.fn.winwidth(0) > vim.fn.winheight(0) then
    vim.cmd "resize +5"
  else
    vim.cmd "vertical resize +5"
  end
end, { desc = "Resize window +5", noremap = true, silent = true })

map("n", "<A-]>", function()
  if vim.fn.winwidth(0) > vim.fn.winheight(0) then
    vim.cmd "resize -5"
  else
    vim.cmd "vertical resize -5"
  end
end, { desc = "Resize window -5", noremap = true, silent = true })

-- Telescope
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
-- map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
-- map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
-- map("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume last Telescope" })
-- map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP Document Symbols" })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Manage projects" })
