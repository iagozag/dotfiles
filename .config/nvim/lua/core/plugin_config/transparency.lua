require("transparent").setup{
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {
      "BufferLineTabClose",
      "BufferLineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",
      "IblIndent",
      "IblWhitespace",
      "@ibl.indent.char.1",
      "@ibl.whitespace.char.1",
      "@ibl.scope.char.1",
  },
  exclude_groups = {},
}

require('transparent').clear_prefix('BufferLine')
require('transparent').clear_prefix('NvimTree')
require('transparent').clear_prefix('ibl')
