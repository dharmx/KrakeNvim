opt.termguicolors = true
opt.laststatus = 0
opt.completeopt = "menuone,noselect"

opt.title = true
opt.hidden = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.whichwrap:append "<>[]hl"

opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.autowrite = true
opt.autoindent = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.wildignore = {
  "*/cache/*",
  "*/tmp/*",
}

opt.errorformat = "%f|%l col %c|%m"
opt.diffopt:append { "algorithm:patience" }

opt.fillchars = {
  eob = " ",
  vert = "▎",
  stlnc = "━",
  diff = "░",
  msgsep = "━",
  foldopen = "▾",
  foldsep = "|",
  foldclose = "▸",
}

opt.ignorecase = false
opt.smartcase = true
opt.mouse = "a"
opt.undolevels = 10000

opt.number = false
opt.numberwidth = 2
opt.relativenumber = false
opt.fileencoding = "utf-8"

opt.tabstop = 4
opt.timeoutlen = 250
opt.undofile = true

opt.updatetime = 250
opt.wrap = false

opt.list = true
opt.spell = false
opt.spelllang = "en_us,en_gb,cjk"
opt.spellsuggest = "best,9"

opt.scrolloff = 8
wo.scrolloff = 8

opt.sidescrolloff = 8
opt.backup = false

opt.showmode = true
opt.shortmess:append "sI"
opt.showcmd = true

opt.hlsearch = true
opt.conceallevel = 2
opt.swapfile = false

opt.cursorline = true
opt.cursorlineopt = "both"
opt.signcolumn = "yes"

opt.pumheight = 25
opt.pumwidth = 35
opt.pumblend = 0
opt.history = 10000

opt.emoji = true
opt.ruler = false
opt.list = true
opt.menuitems = 30
opt.magic = true
opt.icon = true
opt.omnifunc = "syntaxcomplete#Complete"

for _, plugin in
  ipairs {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor_mode_plugin",
    "fzf",
    "spellfile_plugin",
    "filetype",
    "ftoff",
    "ftplugin",
    "ftplugof",
  }
do
  g["loaded_" .. plugin] = 1
end

g.mapleader = " "
g.did_load_filetypes = 1

g["zoom#statustext"] = "Z"

g.markdown_fenced_languages = {
  "lua",
  "vim",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "console=sh",
}

g.python3_host_prog = "python3"
g.vim_json_warnings = false

o.background = "dark"

env.FZF_DEFAULT_OPTS =
  "--layout=reverse --prompt ' ' --pointer '->' --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

opt.shadafile = "NONE"
vim.schedule(function()
  opt.shadafile = ""
  cmd "silent! rsh"
end)

-- vim:ft=lua
