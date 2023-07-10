-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
vim.opt.colorcolumn = "120"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Remap copilot acccept to use CTRL + A
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["markdown"] = true,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
}

vim.g.neovide_macos_alt_is_meta = true
