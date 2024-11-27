local ignores = {
  'E501',
  'E231',
  'E302',
  'E221',
  'E251',
  'E266',
}

return {
  settings = {
    pylsp = {
      plugins = {
        yapf = {enabled = false},
        jedi_completion = {include_params = true},
        jedi_signature_help = {enabled = true},
        pyflakes    = {enabled=false},
        pylint      = {enabled=false},
        pylsp_mypy  = {enabled=false},
        pycodestyle = {
          enabled = true,
          ignore  = ignores,
          maxLineLength = 120,
        },
      },
    },
  },
}
