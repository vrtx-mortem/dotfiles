local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local fm = function(entry, vitem)
  -- Icons
  vitem.kind = string.format('%s', kind_icons[vitem.kind])
  -- Menu
  vitem.menu = ({
    luasnip = '[Snippet]',
    buffer  = '[Buffer]',
    path    = '[Path]',
  })[entry.source.name]
  return vitem
end


return {
  fields = {'kind', 'abbr', 'menu'},
  format = fm,
}
