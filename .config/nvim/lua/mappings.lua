require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>fs", function()
  local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/documentSymbol" })
  if #clients == 0 then
    vim.notify("No LSP client with document symbols for this buffer", vim.log.levels.WARN)
    return
  end
  require("telescope.builtin").lsp_document_symbols()
end, { desc = "LSP document symbols" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
