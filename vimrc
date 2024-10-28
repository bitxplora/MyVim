vim9script

set nocompatible              # be iMproved, required
filetype off                  # required

# Viminfo, the default is "viminfo='100,<50,s10,h" at ~/.viminfo
set viminfo="100,%,'50,h,s100,n~/.vim/viminfo

# set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

# Alternatively, pass a path where Vundle should install plugins
# call vundle#begin('~/some/path/here')

# let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

# Plugins
Plugin 'scrooloose/nerdtree.git'
Plugin 'junegunn/fzf.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'nvie/vim-flake8'                    #PEP8 style checker
Plugin 'jiangmiao/auto-pairs'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-surround'                 #The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plugin 'tpope/vim-commentary'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'  #To toggle between absolute and relative number
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-repeat'                   #Repeat.vim remaps . in a way that plugins can tap into it.
Plugin 'sumnerevans/vim-listtrans'          #This plugin toggles a sentence separated by , or ; to a list.
Plugin 'vim-airline/vim-airline'            #required powerline fonts, sudo apt install powerline sudo apt-get install fonts-powerline
Plugin 'vim-airline/vim-airline-themes'

# vimspector
Plugin 'puremourning/vimspector'

# Indent guides
Plugin 'preservim/vim-indent-guides'
#
# Ember - highlight and language support
Plugin 'leafgarland/typescript-vim'
#
# Plugin 'Quramy/vim-js-pretty-template'
Plugin 'joukevandermaas/vim-ember-hbs'

# Color preview
Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

# boolean toggle tool
Plugin 'AndrewRadev/switch.vim'
Plugin 'gerazov/vim-toggle-bool'

# LSP
Plugin 'yegappan/lsp'

# VimComplete
Plugin 'girishji/vimcomplete'

# Vim-vsnip
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'

# friendly-snippets
Plugin 'rafamadriz/friendly-snippets'

# All of your Plugins must be added before the following line
# required
call vundle#end()

filetype plugin indent on    # required

# To ignore plugin indent changes, instead use:
filetype plugin on

# Omin completion provides smart autocompletion for prgramms.
# To turn on omni completion
# set omnifunc=syntaxcomplete#Complete

# Brief help
# :PluginList       - lists configured plugins
# :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
# :PluginSearch foo - searches for foo; append `!` to refresh local cache
# :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
#
# see :h vundle for more details or wiki for FAQ
# Put your non-Plugin stuff after this line
#
# Turn on backup option
set backup
#
# Where to store backup
set backupdir=~/.vim/backup//
#
# Make backup before overwritting the current buffer"
set writebackup
#
# Make a copy of the file and overwrite the original one
set backupcopy=yes
#
# Backup extension
set backupext=.bak

# Meaningfull backup name, ex: filename@2024-03-05T11:23.bak
autocmd BufWritePre * &bex = '@' .. strftime('%FT%H:%M') .. '.bak'


# Swapfile location
set directory=/var/tmp//

# NERDTree
map <C-n> :NERDTreeToggle<CR>


# VIM specific
# enable syntax highlighting
syntax enable

# Setting termwinsize option row*columns
# set termwinsize=0x900

# show line numbers
set number relativenumber

# set tabs to have 2 spaces
set ts=2

#indent when moving to the next line while writing code
set autoindent
set smartindent
set cindent

#expand tabs into spaces
set expandtab

# To always display statusline
set laststatus=2

# Width of tab characters
set tabstop=2

#Search highlighting
set hlsearch
#
#Incremental search highlighting
set incsearch

# Menu option for enhanced mode of commands completion = wildmenu
set wildmenu

# when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2

# show a visual line under the cursor's current line
set cursorline

# show a visual vertical line on the cursor's current point
# set cursorcolumn

# Enabling session to save inaddition; resize for window line and columns,  and winpos for window position
set sessionoptions+=winpos,resize,options

# Enabling view to save inaddition to default, loccaloptions
set viewoptions+=localoptions

# Automatically create and load a view each time you open and exit buffer.
autocmd BufWinEnter *.* mkview
autocmd BufWinLeave *.* silent loadview

# show the matching part of the pair for [] {} and ()
set showmatch

# Show the mode you are on the last line.
set showmode

set encoding=UTF-8
set textwidth=79

set t_Co=256
syntax on
set background=dark
colorscheme  gruvbox # distinguished
set termguicolors

# Spellcheck
# setlocal spell
setlocal spelllang=en_gb,en_us

# Words completion, use ctrl N or ctrl P in insert mode for word completion
set complete+=kspell

set spellfile=~/.vim/spell/en.utf-8.add

# To auto enable spell on txt file
augroup txtSpellCheck
  autocmd!
  autocmd FileType txt setlocal spell
  autocmd BufRead,BufNewFile *.txt setlocal spell
augroup END

#To enable auto insertion of skeleton on creation of .html file
# augroup skeleton
#     autocmd!
#     autocmd BufNewFile *.html 0r ~/.vim/skeletons/html
# augroup END

# use system clipboard
set clipboard=unnamed

# By default, Vim makes it difficult to create hidden buffers. To make Vim more liberal about hidden buffers
set hidden
#
# airline formatters  see https://github.com//vim-airline/vim-airline
g:airline_experimental = 1
g:airline#extensions#tabline#enabled = 1 # enable airline tabline
g:airline#extensions#tabline#formatter = 'unique_tail_improved'
g:airline_inactive_collapse = 1
g:airline_inactive_alt_sep = 1

g:airline#extensions#tabline#left_sep = ' '
g:airline#extensions#tabline#left_alt_sep = '|'

# Adjust the truncation if error messages are being truncated
# g:airline#extensions#default#section_truncate_width = { 'error': 80, 'warning': 80, }

highlight ErrorMsg ctermfg=white ctermbg=red cterm=bold gui=bold guifg=white guibg=red
highlight Error ctermfg=white ctermbg=red cterm=bold gui=bold guifg=white guibg=red

#Check up other theme at https:/github.com/vim-airline/vim-airlin/wiki/Screenshots
g:airline_theme =  'dark' #'serene'
#
# Set to 1 to enable cache for highlight
g:airline_highlighting_cache = 0

def UpdateHighlights()
  hi airline_error_inactive ctermfg=white ctermbg=red cterm=bold gui=bold guifg=white guibg=red
  hi airline_error_inactive_bold ctermfg=white ctermbg=red cterm=bold gui=bold guifg=white guibg=red
  hi airline_error_inactive_red ctermfg=white ctermbg=red cterm=bold gui=bold guifg=white guibg=red
  hi airline_error term=bold cterm=standout ctermfg=15 ctermbg=9 gui=bold guifg=white guibg=red
  hi airline_error_bold term=bold cterm=standout ctermfg=15 ctermbg=9 gui=bold guifg=white guibg=red
  hi airline_error_red term=bold cterm=standout ctermfg=15 ctermbg=9 gui=bold guifg=white guibg=red
enddef
autocmd User AirlineAfterTheme call UpdateHighlights()

# To put the statusline on the top of screen
# let g:airline_statusline_ontop = 1

# simplifying z section of tabline, a mimimal tabline
g:airline_section_z = airline#section#create('%2p%% %#__accent_bold#ln %l%#__restore__#%#__accent_bold#:%L%#__restore__# cl %1v')

#Required powerline fonts, it can be installed via sudo apt install powerline and sudo apt-get install fonts-powerline
g:airline_powerline_fonts = 1
#
#jiangmiao/auto-pairs
g:AutoPairsFlyMode = 1
g:AutoPairsShortcutBackInsert = '<M-b>'
#
#indent-guides settings
#The default mapping to toggle the plugin is <Leader>ig.
#You can also use the following commands inside Vim:

#:IndentGuidesDisable
#:IndentGuidesToggle
#
#Enabling start indent guides by default
g:indent_guides_enable_on_vim_startup = 1
g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'text']
#
#Customising indent guides colors
# let g:indent_guides_auto_colors=0
# hi IndentGuidesOdd  ctermbg=black
# hi IndentGuidesEven ctermbg=darkgrey

g:indent_guides_start_level = 2
g:indent_guides_guide_size = 1
#
#
# Setting for color previewr Hexokinase
g:Hexokinase_highlighters = ['sign_column']   # sign-column is default, other are: virtual, background, foreground etc
g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'typescript']  #This restricts the types it apply to, to those in list
#
#sumnerevans/vim-listtrans
nmap  ;l :call ListTrans_toggle_format()<CR>
xmap  ;l :call ListTrans_toggle_format('visual')<CR>
#
#vimspector mapping
#Installation of vimspector DAP gadgets
# let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-bash-debug', 'vscode-js-debug', 'vscode-firefox-debug', 'debugger-for-chrome', 'java-debug-adapter', 'vscode-go' ]
# let g:vimspector_base_dir='~/.vim/bundle/vimspector'

# let g:vimspector_enable_mappings = 'HUMAN'
#
nnoremap <Leader>dl :call vimspector#Launch()<CR>
nnoremap <Leader>dx :call vimspector#Reset()<CR>
nnoremap <Leader>dr :call vimspector#Restart()<CR>

nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>ds :call vimspector#Stop()<CR>

nnoremap <Leader>dso :call vimspector#StepOut()<CR>
nnoremap <Leader>dsi :call vimspector#StepInto()<CR>
nnoremap <Leader>dsv :call vimspector#StepOver()<CR>

nnoremap <Leader>dtb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dcb :call vimspector#ClearBreakpoints()<CR>

#command abbreviation of Vimspector Watch and Eval as vw for command on mode
cabbrev vw VimspectorWatch
cabbrev ve VimspectorEval

nnoremap <leader>rtc <Plug>VimspectorRunToCursor
nnoremap <leader>gtl <Plug>VimspectorGoToCurrentLine

# To make session e.g vms my_session_file
cabbrev vms VimspectorMkSession
#
# To load session e.g vls my_session_file
cabbrev vls VimspectorLoadSession

#Boolean toggle tool mapping to \t
nnoremap <silent> <leader>t :ToggleBool<CR>

set timeout ttimeoutlen=50
#
# TextEdit might fail if hidden is not set.
set hidden
#
# Space for displaying messages or command.
set cmdheight=1

# Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
# delays and poor user experience.
set updatetime=300

# Don't pass messages to |ins-completion-menu|.
set shortmess+=c

# Always show the signcolumn, otherwise it would shift the text each time
# diagnostics appear/become resolved.
set signcolumn=yes

# This snippet allows users to navigate through completion items in the popup menu using the <Tab> and <S-Tab> keys:
# When the popup menu is visible:
#   <Tab> will move to the next item in the list.
#   <S-Tab> will move to the previous item.
# When the popup menu is not visible:
#   <Tab> and <S-Tab> will perform their default actions (inserting a tab character).
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

# Customise Highlight Groups
# highlight Pmenu ctermfg=white ctermbg=blue
# highlight PmenuSel ctermfg=black ctermbg=yellow
# highlight PmenuSbar ctermfg=white ctermbg=darkgrey
# highlight PmenuThumb ctermfg=white ctermbg=grey

# colorscheme gruvbox  " Replace 'gruvbox' with your preferred color scheme


# LSP
var lspOpts = {
  aleSupport: v:false,
  autoComplete: v:true,
  autoHighlight: v:true,
  autoHighlightDiags: v:true,
  autoPopulateDiags: v:false,
  completionMatcher: 'case',
  completionMatcherValue: 1,
  diagSignErrorText: 'E>',
  diagSignHintText: 'H>',
  diagSignInfoText: 'I>',
  diagSignWarningText: 'W>',
  echoSignature: v:false,
  hideDisabledCodeActions: v:false,
  highlightDiagInline: v:true,
  hoverInPreview: v:false,
  ignoreMissingServer: v:false,
  keepFocusInDiags: v:true,
  keepFocusInReferences: v:true,
  completionTextEdit: v:false,
  diagVirtualTextAlign: 'above',
  diagVirtualTextWrap: 'wrap',
  noNewlineInCompletion: v:false,
  omniComplete: v:true,
  outlineOnRight: v:false,
  outlineWinSize: 30,
  semanticHighlight: v:true,
  showDiagInBalloon: v:true,
  showDiagInPopup: v:true,
  showDiagOnStatusLine: v:false,
  showDiagWithSign: v:true,
  showDiagWithVirtualText: v:true,
  showInlayHints: v:true,
  showSignature: v:true,
  snippetSupport: v:false,
  ultisnipsSupport: v:false,
  useBufferCompletion: v:true,
  usePopupInCodeAction: v:true,
  useQuickfixForLocations: v:false,
  vsnipSupport: v:false,
  bufferCompletionTimeout: 100,
  customCompletionKinds: v:false,
  completionKinds: {},
  filterCompletionDuplicates: v:false,
}

var lspServers = [

 # langd language server
  {
    name: 'clangd',
    filetype: ['c', 'cpp'],
    path: '/snap/bin/clangd',
    args: ['--background-index']
  },

 # Go language server
  {
    name: 'golang',
    filetype: ['go', 'gomod'],
    path: '/snap/bin/gopls',
    args: ['serve'],
    syncInit: v:true
  },

 # Rust language server
  {
    name: 'rustlang',
    filetype: ['rust'],
    path: '/snap/bin/rust-analyzer',
    args: [],
    syncInit: v:true
  },

 # Bash language server
  {
    name: 'bashls',
    filetype: 'sh',
    path: '/snap/bin/bash-language-server',
    args: ['start']
  },

 # Vimscript language server
  {
    name: 'vimls',
    filetype: 'vim',
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/vim-language-server',
    args: ['--stdio'],
  },

 # Sql language server
  {
    name: 'sqlls',
    filetype: ['sql', 'postgresql'],
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/sql-language-server',
    args: ['up', '--method', 'stdio'],
  },

 # Tsserver language server
  {
    name: 'tsserver',
    filetype: ['javascript', 'typescript'],
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/typescript-language-server',
    args: ['--stdio'],
  },

 # # vscode-html-language-server
  {
    name: 'vscode-html-language-server',
    filetype: ['html'],
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/vscode-html-language-server',
    args: ['--stdio'],
  },

 # # css-language-server
  {
    name: 'css-language-servers',
    filetype: ['css'],
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/vscode-css-language-server',
    args: ['--stdio'],
  },

 # # vscode-json-language-server
 #  {
 #    name: 'vscode-json-language-servers',
 #    filetype: ['json'],
 #    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/vscode-json-language-server',
 #    args: ['--stdio'],
 #  },

 # # vscode-eslint-language-server
 #  {
 #    name: 'vscode-eslint-language-servers',
 #    filetype: ['eslint'],
 #    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/vscode-eslint-language-server',
 #    args: ['--stdio'],
 #  },

 # # vscode-markdown-language-server
 #  {
 #    name: 'vscode-markdown-language-servers',
 #    filetype: ['markdown'],
 #    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/vscode-markdown-language-server',
 #    args: ['--stdio'],
 #  },

 # Glint language server
  {
    name: 'glint',
    filetype: [
    'html',
    'html.handlebars',
    'handlebars',
    'typescript',
    'typescript.glimmer',
    'javascript',
    'javascript.glimmer',
    ],
  "rootSearch": [
    ".glintrc.yml",
    ".glintrc",
    ".glintrc.json",
    ".glintrc.js",
    "glint.config.js",
    "package.json"
  ],
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/glint-language-server',
    args: ['--stdio'],
  },

 # Ember language server
  {
    name: 'emberls',
    filetype: ['handlebars', 'html.handlebars', 'typescript.glimmer', 'tpescript.glimmer'],
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/ember-language-server',
    args: ['--stdio'],
  },

 # Tailwindcss language server
  {
    name: 'tailwindcssls',
    filetype: 'tailwind',
    path: '/home/olutayo/.nvm/versions/node/v20.14.0/bin/tailwindcss-language-server',
    args: ['--stdio'],
  },
]

#lsp#lsp#AddServer(lspServers)
augroup Lsp
  au!
  autocmd User LspSetup call LspOptionsSet(lspOpts)
  autocmd User LspSetup call LspAddServer(lspServers)
  autocmd User LspAttached {
    setlocal signcolumn=yes

    setlocal keywordprg=:LspHover
    setlocal tagfunc=lsp#lsp#TagFunc
    setlocal formatexpr=lsp#lsp#FormatExpr()
    nnoremap <buffer> <LocalLeader>f <Cmd>LspFormat<CR>
    nnoremap <buffer> <LocalLeader>a <Cmd>LspCodeAction<CR>
    nnoremap <buffer> <LocalLeader>r <Cmd>LspRename<CR>
    nnoremap <buffer> <LocalLeader>ds <Cmd>LspDiag show<CR>
    nnoremap <buffer> <LocalLeader>dc <Cmd>LspDiag current<CR>
    nnoremap <buffer> <LocalLeader>df <Cmd>LspDiag first<CR>
    nnoremap <buffer> <LocalLeader>h <Cmd>LspHover<CR>
    nnoremap <buffer> [d <Cmd>LspDiag next<CR>
    nnoremap <buffer> ]d <Cmd>LspDiag prev<CR>
  }
augroup END


