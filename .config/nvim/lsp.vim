lua << EOF
local nvim_lsp = require('lspconfig')
local saga = require 'lspsaga'
saga.init_lsp_saga {
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  print('here')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
EOF

nmap gD :lua vim.lsp.buf.declaration()<cr>
nmap gd :lua vim.lsp.buf.definition()<cr>
nmap gi :lua vim.lsp.buf.implementation()<cr>
nmap gr :lua vim.lsp.buf.references()<cr>
nmap K :lua vim.lsp.buf.hover()<cr>
nmap <leader>h :lua vim.lsp.buf.signature_help()<cr>
nmap <leader>wa :lua vim.lsp.buf.add_workspace_folder()<cr>
nmap <leader>wr :lua vim.lsp.buf.remove_workspace_folder()<cr>
nmap <leader>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>
nmap <leader>D :lua vim.lsp.buf.type_definition()<cr>
nmap <leader>rn :lua vim.lsp.buf.rename()<cr>
nmap <leader>d :lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nmap [d :lua vim.lsp.diagnostic.goto_prev()<cr>
nmap ]d :lua vim.lsp.diagnostic.goto_next()<cr>
nmap <leader>ll :lua vim.lsp.diagnostic.set_loclist()<cr>
nmap <leader>fr :lua vim.lsp.buf.formatting()<cr>
xmap <leader>fr :lua vim.lsp.buf.range_formatting()<cr>
nmap <leader>a :lua vim.lsp.buf.code_action()<cr>
xmap <leader>a :lua vim.lsp.buf.range_code_action()<cr>
nmap <leader>fp :silent ! prettier -w %<cr>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
