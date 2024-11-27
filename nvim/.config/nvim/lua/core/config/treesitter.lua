local sitters = {
  'asm',
  'bash',
  'c_sharp',
  'cpp',
  'c',
  'dockerfile',
  'go',
  'javascript',
  'jq',
  'json',
  'latex',
  'make',
  'php',
  'python',
	'rust',
  'sql',
  'typescript',
  'vim',
}

require('nvim-treesitter.configs').setup({
  ensure_installed = sitters,
  sync_install = false,
  auto_install = false,
  hightlight   = {enabled = true},
})
