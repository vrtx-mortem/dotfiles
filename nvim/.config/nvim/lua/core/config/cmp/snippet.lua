require('luasnip.loaders.from_vscode').lazy_load()
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require('luasnip.extras')
local rep = extras.rep

vim.keymap.set({'i', 's'}, '<A-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({'i', 's'}, '<A-j>', function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

ls.add_snippets('tex', {
  s('beg', {
    t('\\begin{'), i(1), t('}'),
    t({'', '\t'}), i(0),
    t({'', '\\end{', }), rep(1), t('}'),
  })
})

local python_head = function()
  return {
    '#!/usr/bin/env python3',
    '# -*- coding: utf-8 -*-',
    '',
  }
end

ls.add_snippets('python', {
  s('alpha', {
    t('alphabet = strings.digits + strings.')
  })
})

ls.add_snippets('python', {
  s("pyboiler", {
    t(python_head()),
    t({
      'import sys',
      '',
      'def main() -> None:',
      '\t',
    }),
    i(0),
    t({
      '',
      '',
      'if __name__ == \'__main__\':',
      '\tmain()',
    })
  })
})

return {
  expand = function(args)
    ls.lsp_expand(args.body)
  end,
}
