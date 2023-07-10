local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.eslint_d,
  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.diagnostics.mypy,
  b.diagnostics.pydocstyle,
  b.formatting.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
