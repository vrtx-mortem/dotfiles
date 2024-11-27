local opts = {
  noremap = true,
  silent  = true,
}

local term_opts = {
  silent  = true,
}

local project_cmd = ''
local tests_cmd = ''
local project_tmux_l = ''
local tests_tmux_l = ''

local toggle_numbers = function()
  vim.opt.number = not vim.opt.number:get()
end

local toggle_wrap= function()
  vim.opt.wrap = not vim.opt.wrap:get()
end

local toggle_binary_edit = function()
  vim.opt.endoffile = not vim.opt.endoffile:get()
  vim.opt.endofline = not vim.opt.endofline:get()
  vim.opt.binary    = not vim.opt.binary:get()
  print("To save as binary >>> :noa w")
end

local function prompt_project()
    project_cmd = vim.fn.input('Enter command: ')
    project_tmux_l = vim.fn.input('Tmux location: ')
end

local function prompt_tests()
    tests_cmd = vim.fn.input('Enter command: ')
    tests_tmux_l = vim.fn.input('Tmux location: ')
end

local function tmux_project_run()
    if project_cmd == '' then
      prompt_project()
    end
    local cmd = string.format("tmux send-keys -t %s -- C-c C-l '%s' Enter", project_tmux_l, project_cmd)
    vim.fn.system(cmd)
end

local function tmux_tests_run()
    if tests_cmd == '' then
      prompt_tests()
    end
    local cmd = string.format("tmux send-keys -t %s -- C-c C-l '%s' Enter", tests_tmux_l, tests_cmd)
    vim.fn.system(cmd)
end

-- Generic
vim.keymap.set('n', '<F2>', toggle_numbers, opts)
vim.keymap.set('n', '<Leader>tw', toggle_wrap, opts)
vim.keymap.set('n', '<Leader>b', toggle_binary_edit, opts)
vim.keymap.set('n', '<leader>cm', prompt_project, opts)
vim.keymap.set('n', '<leader>ct', prompt_tests, opts)
vim.keymap.set('n', '<leader>m', tmux_project_run, opts)
vim.keymap.set('n', '<leader>t', tmux_tests_run, opts)
vim.keymap.set('n', '<Leader>wt', [[:%s/\s\+$//e<cr>]], opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

-- Tree
vim.keymap.set('', '<C-\\>', vim.cmd.NvimTreeFindFileToggle, opts)

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Luasnip
-- local ls = luasnip
-- 
-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, term_opts)
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, term_opts)
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, term_opts)
-- 
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, term_opts)

local keymap = vim.api.nvim_set_keymap
-- QoL
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap('v', '<C-r>', '"hy:%s/<C-r>h//g<left><left>', opts)
