local settings = require('user-conf')
local utils = require("functions")

local o = vim.o
local opt = vim.opt
local optglobal = vim.opt
local wo = vim.wo
local fn = vim.fn
local api = vim.api

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

optglobal.completeopt = { "menuone", "noinsert", "noselect" }
optglobal.backupdir = { "~/.cache/vim/", "/tmp" }

o.mouse = "a"
o.encoding = "utf-8"
o.fileformat = "unix"
o.modelines = "0"

opt.backupdir = { "~/.cache/vim/", "/tmp" }
opt.directory = { "~/.cache/vim/", "/tmp" }

o.autoindent = true
o.smartindent = true

o.clipboard="unnamed"
o.showmode = true
o.showcmd = true
o.hidden = true
o.belloff = true
o.visualbell = false
o.errorbells = false

if settings.global_statusline then
	o.laststatus = 3
else
	o.laststatus = 2
end

o.cursorline = true
o.ruler = true
o.backspace = [[eol,start,indent]]
o.undofile = true
o.history = 10000
o.undoreload = 10000
o.shell = "/bin/zsh"
o.lazyredraw = true
o.matchtime = 3
o.startofline = false
o.splitbelow = true
o.splitright = true
o.autowrite = true
o.autoread = true
o.shiftround = true
o.formatoptions = "crql"
o.title = true
o.foldmethod = "marker"
o.dictionary = "/usr/share/dict/words"
o.completeopt=[[menuone,preview,noinsert]]
o.wildmenu = true
o.wildmode = "longest,full"
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.jar, *.pyc, *.class
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**, */build/*
]]

o.number = settings.number
o.relativenumber = settings.relativenumber

o.tabstop=2
o.shiftwidth=2
o.softtabstop=2
o.expandtab=true
opt.wrap=false
o.formatoptions="qrnl"

o.complete=[[.,w,b,u,U,t,i,d]]

o.smartcase=true
o.incsearch=true
o.showmatch= true
o.hlsearch= true
o.gdefault = true
 
o.scrolloff=3
o.sidescroll=1
o.sidescrolloff=10
o.virtualedit = "block"
o.showmode = false

-- Color settings
o.t_Co=256

-- Set Diagnostic Signs
local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
