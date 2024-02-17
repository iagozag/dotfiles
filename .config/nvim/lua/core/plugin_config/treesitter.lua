require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "python", "vim", "markdown", "html", "css", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex", "markdown" },
  },
}
