-- plugins read these when they load, so they must be set before lazy.setup()
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.rainbow_active = 1
vim.g.netrw_banner = 0
vim.g.netrw_sort_sequence = ""
-- no remote plugins in any of these languages; stops :checkhealth warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- ui
  "ellisonleao/gruvbox.nvim",
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      -- plain like lightline was
      options = {
        theme = "gruvbox",
      },
      -- lsp_status shows a spinner while a server works (e.g. jdtls importing Gradle)
      sections = { lualine_x = { { "lsp_status", icon = "" }, "encoding", "fileformat", "filetype" } },
    },
  },
  "luochen1990/rainbow",
  { "catgoose/nvim-colorizer.lua", main = "colorizer", opts = {} },

  -- navigation / search
  "christoomey/vim-tmux-navigator",
  {
    "ibhagwan/fzf-lua",
    opts = {
      "skim",
      winopts = { preview = { hidden = true } },
      -- code actions and other vim.ui.select prompts use the picker
      ui_select = {},
      -- symbol kind as text instead of Nerd Font icons, like blink.cmp
      lsp = { symbols = { symbol_style = 3 } },
    },
  },

  -- git
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        vim.keymap.set("n", "]h", function() gs.nav_hunk("next") end, { buffer = bufnr })
        vim.keymap.set("n", "[h", function() gs.nav_hunk("prev") end, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = bufnr })
      end,
    },
  },

  -- editing
  { "kylechui/nvim-surround", opts = {} },
  "cohama/lexima.vim",

  -- lsp: server configs (cmd, root markers) used by vim.lsp.enable
  "neovim/nvim-lspconfig",
  {
    "saghen/blink.cmp",
    version = "1.*", -- v1 is stable and ships the prebuilt fuzzy matcher; v2 is mid-rewrite
    opts = {
      completion = {
        documentation = { auto_show = true },
        -- kind as text instead of Nerd Font icons, like lualine
        menu = { draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" } } } },
      },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "buffer" } },
    },
  },
}, {
  install = { colorscheme = { "gruvbox" } },
  change_detection = { notify = false },
  -- no plugin needs luarocks; otherwise :checkhealth reports it missing
  rocks = { enabled = false },
})

-- options
vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = ".", extends = ">" }
-- always shown, so git/diagnostic signs don't shift the text sideways
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.spelllang = "en_us"
vim.opt.iskeyword:append("-")
vim.opt.clipboard = "unnamedplus"

local indent = vim.api.nvim_create_augroup("indent", { clear = true })
local function set_indent(filetypes, width, expandtab)
  vim.api.nvim_create_autocmd("FileType", {
    group = indent,
    pattern = filetypes,
    callback = function()
      vim.bo.shiftwidth = width
      vim.bo.softtabstop = width
      vim.bo.tabstop = width
      vim.bo.expandtab = expandtab
    end,
  })
end
set_indent({ "cpp", "java" }, 4, true)
set_indent({ "gradle" }, 2, false)
set_indent({ "go" }, 4, false)

-- autosave
vim.g.auto_save = 1
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  group = vim.api.nvim_create_augroup("autosave", { clear = true }),
  callback = function(ev)
    if vim.g.auto_save == 0 then return end
    if vim.bo[ev.buf].buftype ~= "" or not vim.bo[ev.buf].modifiable then return end
    if vim.bo[ev.buf].modified and vim.api.nvim_buf_get_name(ev.buf) ~= "" then
      vim.api.nvim_buf_call(ev.buf, function() vim.cmd("silent! write") end)
    end
  end,
})

-- 'autoread' is on by default, but nothing triggers :checktime
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = vim.api.nvim_create_augroup("autoread", { clear = true }),
  callback = function()
    if vim.fn.mode() ~= "c" and vim.bo.buftype == "" then vim.cmd("checktime") end
  end,
})

-- Neovim remembers each file's last cursor position (the '" mark) but doesn't
-- jump to it; commit and rebase messages are new each time, so start at the top
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    if ft == "gitcommit" or ft == "gitrebase" or vim.wo.diff then return end
    local line = vim.api.nvim_buf_get_mark(ev.buf, '"')[1]
    if line >= 1 and line <= vim.api.nvim_buf_line_count(ev.buf) then vim.cmd('normal! g`"') end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank_highlight", { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- off by default since 0.11, leaving only a sign in the gutter
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- language servers; keymaps are Neovim defaults (grn, grr, gra, gri, grt, K) plus gd
-- basedpyright has no extract refactors, so pylsp runs alongside it for rope's
-- code actions only; its other capabilities would duplicate basedpyright's
vim.lsp.config("pylsp", {
  settings = {
    pylsp = { plugins = { pyflakes = { enabled = false }, pycodestyle = { enabled = false }, mccabe = { enabled = false } } },
  },
  on_init = function(client)
    local caps = client.server_capabilities
    client.server_capabilities = {
      textDocumentSync = caps.textDocumentSync,
      codeActionProvider = caps.codeActionProvider,
      executeCommandProvider = caps.executeCommandProvider,
    }
  end,
})
vim.lsp.config("jdtls", {
  -- without this, jdtls returns no location for classes in jars (e.g. Spring)
  init_options = { extendedClientCapabilities = { classFileContentsSupport = true } },
  -- jdtls's generated code (extract method, etc.) uses tabs unless told otherwise
  settings = { java = { format = { insertSpaces = true, tabSize = 4 } } },
})
-- gopls and vtsls send no inlay hints (<leader>i) unless asked; these match
-- what basedpyright, rust-analyzer and jdtls show by default
vim.lsp.config("gopls", {
  settings = {
    gopls = { hints = { parameterNames = true, assignVariableTypes = true, rangeVariableTypes = true, compositeLiteralFields = true } },
  },
})
local ts_inlay_hints = {
  parameterNames = { enabled = "literals" },
  variableTypes = { enabled = true },
  functionLikeReturnTypes = { enabled = true },
}
vim.lsp.config("vtsls", {
  settings = { typescript = { inlayHints = ts_inlay_hints }, javascript = { inlayHints = ts_inlay_hints } },
})
vim.lsp.enable({ "gopls", "rust_analyzer", "vtsls", "basedpyright", "pylsp", "jdtls" })

-- jdtls points library definitions at jdt:// URIs; load their source from jdtls
-- and keep jdtls attached so gd/K/grr work inside library code too
vim.api.nvim_create_autocmd("BufReadCmd", {
  group = vim.api.nvim_create_augroup("jdt_uri", { clear = true }),
  pattern = "jdt://*",
  callback = function(ev)
    local client = vim.lsp.get_clients({ name = "jdtls" })[1]
    if not client then return end
    local res = client:request_sync("java/classFileContents", { uri = ev.match }, 10000, ev.buf)
    local text = res and res.result or ("could not load " .. ev.match)
    vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, vim.split(text, "\n"))
    vim.bo[ev.buf].buftype = "nofile"
    vim.bo[ev.buf].modifiable = false
    vim.bo[ev.buf].filetype = "java"
    vim.lsp.buf_attach_client(ev.buf, client.id)
  end,
})

-- snippet sessions outlive <Esc>, so Tab would later jump back into an old
-- snippet instead of inserting a tab
vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("snippet_stop", { clear = true }),
  pattern = "*:n",
  callback = function() vim.snippet.stop() end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
  callback = function(ev)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
  end,
})

-- cd to the current file's project root; VCS markers win over nearer build files
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("rooter", { clear = true }),
  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" or vim.api.nvim_buf_get_name(ev.buf) == "" then return end
    local root = vim.fs.root(ev.buf, { { ".git", "_darcs", ".hg", ".bzr", ".svn" }, { "Makefile", "package.json" } })
    if root and root ~= vim.fn.getcwd() then vim.fn.chdir(root) end
  end,
})

-- gists via the gh CLI
local function gh(args, stdin)
  local result = vim.system(vim.list_extend({ "gh" }, args), { stdin = stdin, text = true }):wait()
  if result.code ~= 0 then
    vim.notify(result.stderr, vim.log.levels.ERROR)
    return nil
  end
  return result.stdout
end

-- acwrite buffer: autosave skips it, so GitHub is only updated on :w
local function open_gist_file(id, file, content)
  local name = "gist://" .. id .. "/" .. file
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_name(buf, name)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content:gsub("\n$", ""), "\n"))
  vim.bo[buf].buftype = "acwrite"
  vim.bo[buf].modified = false
  vim.bo[buf].filetype = vim.filetype.match({ filename = file }) or ""
  vim.api.nvim_create_autocmd("BufWriteCmd", {
    buffer = buf,
    callback = function()
      local tmp = vim.fn.tempname()
      vim.fn.writefile(vim.api.nvim_buf_get_lines(buf, 0, -1, false), tmp)
      if gh({ "gist", "edit", id, "--filename", file, tmp }) then
        vim.bo[buf].modified = false
        vim.notify("Saved " .. name)
      end
      vim.fn.delete(tmp)
    end,
  })
  vim.api.nvim_set_current_buf(buf)
end

-- one API call returns every file's content (gh gist view needs two calls)
local function open_gist(id)
  local json = gh({ "api", "gists/" .. id })
  if not json then return end
  local files = vim.json.decode(json).files
  local names = vim.tbl_keys(files)
  table.sort(names)
  local function open(file)
    local name = "gist://" .. id .. "/" .. file
    if vim.fn.bufexists(name) == 1 then return vim.cmd.buffer(vim.fn.fnameescape(name)) end
    local content = files[file].content
    -- the API truncates files over 1MB; saving that copy would cut the gist short
    if files[file].truncated then content = gh({ "gist", "view", id, "--raw", "--filename", file }) end
    if content then open_gist_file(id, file, content) end
  end
  if #names == 1 then return open(names[1]) end
  vim.ui.select(names, { prompt = "Gist file" }, function(file)
    if file then open(file) end
  end)
end

-- the REST API is ~40% faster than gh gist list
local list_gists_jq = [=[.[] | [.id, (if .public then "public" else "secret" end), .updated_at[:10], (.description // ""), (.files | keys | join(", "))] | @tsv]=]

-- the picker doesn't align tabs, so pad every column but the last (file names)
local function align_columns(lines)
  local rows, widths = {}, {}
  for _, line in ipairs(lines) do
    local row = vim.split(line, "\t")
    if vim.fn.strchars(row[4]) > 40 then row[4] = vim.fn.strcharpart(row[4], 0, 39) .. "…" end
    for i = 1, #row - 1 do widths[i] = math.max(widths[i] or 0, vim.fn.strdisplaywidth(row[i])) end
    table.insert(rows, row)
  end
  return vim.tbl_map(function(row)
    for i = 1, #row - 1 do row[i] = row[i] .. string.rep(" ", widths[i] - vim.fn.strdisplaywidth(row[i])) end
    return table.concat(row, "  ")
  end, rows)
end

local function list_gists()
  require("fzf-lua").fzf_exec(function(fzf_cb)
    local cmd = { "gh", "api", "gists?per_page=100", "--jq", list_gists_jq }
    vim.system(cmd, { text = true }, vim.schedule_wrap(function(result)
      if result.code ~= 0 then vim.notify(result.stderr, vim.log.levels.ERROR) end
      for _, line in ipairs(align_columns(vim.split(result.stdout, "\n", { trimempty = true }))) do
        fzf_cb(line)
      end
      fzf_cb()
    end))
  end, {
    prompt = "Gists> ",
    actions = {
      default = function(selected) open_gist(selected[1]:match("^%S+")) end,
    },
  })
end

-- :Gist posts the buffer (or a range) as a secret gist; :Gist list opens one
vim.api.nvim_create_user_command("Gist", function(cmd)
  if cmd.args == "list" then return list_gists() end
  local args = { "gist", "create", "-" }
  local filename = vim.fn.expand("%:t")
  if filename ~= "" then vim.list_extend(args, { "--filename", filename }) end
  local lines = vim.api.nvim_buf_get_lines(0, cmd.line1 - 1, cmd.line2, false)
  local url = gh(args, table.concat(lines, "\n") .. "\n")
  if url then vim.notify(vim.trim(url)) end
end, { range = "%", nargs = "?", complete = function() return { "list" } end })

-- keymaps
local map = vim.keymap.set

map("n", "<leader>w", "<cmd>set spell!<cr>")
-- not under <leader>s, which would make <leader>s wait for 'timeoutlen'
map("n", "<leader>A", function()
  vim.g.auto_save = vim.g.auto_save == 1 and 0 or 1
  vim.notify("autosave " .. (vim.g.auto_save == 1 and "on" or "off"))
end, { desc = "Toggle autosave" })
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>v", "<cmd>e $MYVIMRC<cr>")
map("n", "<leader>/", "<cmd>nohlsearch<cr>")
map("n", "<leader>+", [[<cmd>exe "resize " . (winheight(0) * 3/2)<cr>]])
map("n", "<leader>-", [[<cmd>exe "resize " . (winheight(0) * 2/3)<cr>]])
map("n", "<leader>>", [[<cmd>exe "vertical resize " . (winwidth(0) * 3/2)<cr>]])
map("n", "<leader><", [[<cmd>exe "vertical resize " . (winwidth(0) * 2/3)<cr>]])
map("n", "<leader>j", "<cmd>cnext<cr>")
map("n", "<leader>k", "<cmd>cprev<cr>")

map("n", "<leader>t", function()
  local view = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(view)
end, { desc = "Trim trailing whitespace" })

-- fzf-lua (runs sk)
map("n", "<leader>p", "<cmd>FzfLua files<cr>")
map("n", "<leader>o", "<cmd>FzfLua git_files<cr>")
map("n", "<leader>c", "<cmd>FzfLua git_status<cr>")
map("n", "<leader>b", "<cmd>FzfLua buffers<cr>")

-- grep; alt-q sends selected matches to quickfix for <leader>j/k
map("n", "<leader>a", "<cmd>FzfLua grep<cr>")
map("n", "<leader>s", "<cmd>FzfLua grep_cword<cr>")
map("x", "<leader>s", "<cmd>FzfLua grep_visual<cr>")

-- lsp
map("n", "<leader>l", "<cmd>FzfLua lsp_live_workspace_symbols<cr>")
map("n", "<leader>d", "<cmd>FzfLua diagnostics_workspace<cr>")
map("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = "Format file" })
map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- netrw; :E is ambiguous without this
vim.api.nvim_create_user_command("E", "Explore", {})
map("n", "<leader>e", "<cmd>Explore<cr>")
map("n", "<leader>r", "<cmd>Rexplore<cr>")

vim.cmd.packadd("nvim.undotree")
map("n", "<leader>u", "<cmd>Undotree<cr>")

-- read-only split of the keymaps
vim.api.nvim_create_user_command("Cheatsheet", function()
  vim.cmd.sview(vim.fn.stdpath("config") .. "/cheatsheet.md")
end, {})
map("n", "<leader>?", "<cmd>Cheatsheet<cr>")
