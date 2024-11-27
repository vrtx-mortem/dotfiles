local cmp = require('cmp')

cmp.setup({
  snippet = require('core.config.cmp.snippet'),
  mapping = require('core.config.cmp.mapping'),
  formatting = require('core.config.cmp.formatting'),
  sources = require('core.config.cmp.sources'),
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text  = false,
    native_menu = false,
  },
})

