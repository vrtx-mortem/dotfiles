local cmp = require('cmp')
local luasnip = require('luasnip')

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local on_tab = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif check_backspace() then
    fallback()
  else
    fallback()
  end
end

local on_stab = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

local default_modes = {'i', 'c'}
local mappings = {
  ['<C-k>']    = cmp.mapping.select_prev_item(),
  ['<C-j>']    = cmp.mapping.select_next_item(),
  ['<C-b>']    = cmp.mapping(cmp.mapping.scroll_docs(-1), default_modes),
  ['<C-f>']    = cmp.mapping(cmp.mapping.scroll_docs(1),  default_modes),
  ['<C-Space'] = cmp.mapping(cmp.mapping.complete(),  default_modes),
  ['<C-e>']      = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close(),}),
  ['<CR>']     = cmp.mapping.confirm({select = true}),
  ['<Tab>']    = cmp.mapping(on_tab, {'i', 's'}),
  ['<S-Tab']   = cmp.mapping(on_stab, {'i', 's'}),
}


return mappings
