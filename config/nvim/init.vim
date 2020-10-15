" vim: sw=2 sts=2 tw=0 fdm=marker

" Init {{{
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

filetype indent plugin on
if !exists('g:syntax_on')
    syntax enable
endif

"}}}
" Plug {{{1
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

Plug 'sainnhe/forest-night'
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'mhinz/vim-startify'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

Plug 'junegunn/gv.vim', {'on': 'GV'}
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/committia.vim'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'moll/vim-bbye'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'AndrewRadev/tagalong.vim', {'for': 'html'}
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'Chiel92/vim-autoformat'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'tweekmonster/startuptime.vim'

function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" }}}1
" Option {{{1
" indent settings
set number
set autoindent
set cinoptions    =l1,p0,)50,*50,t0
set expandtab
set smarttab
set tabstop=4
set softtabstop   =4
set shiftwidth    =4
set shiftround

set encoding=utf-8 nobomb
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set nobackup
set nowritebackup
set updatetime=200
set signcolumn=yes

" better navigation
set cursorline
set foldmethod    =marker
set foldopen     +=jump
set foldtext      =mhi#foldy()
set foldlevelstart=99
set hlsearch
set ignorecase
set incsearch
set mouse         =a
set scrolloff     =4
set sidescroll    =5
set smartcase
set tagcase       =match

" misc settings
set autoread
set backspace     =indent,eol,start
set clipboard     =unnamed
set complete     -=i
" set completeopt  +=noselect
" set completeopt=menu,menuone
set completeopt=longest,menu

set cpoptions    -=e
set diffopt      +=vertical,foldcolumn:0,indent-heuristic,algorithm:patience
set fileformats   =unix,dos,mac
set hidden
set history       =1000
set lazyredraw
set more
set mousemodel    =popup
set noautowrite
set noautowriteall
" set noequalalways
set noerrorbells
set nofsync
set nojoinspaces
set wrapscan
set nrformats     =hex
set pastetoggle   =<F5>
set norelativenumber
set report        =0
set sessionoptions-=options
set sessionoptions+=localoptions
set showfulltag
set showtabline   =2
set splitbelow
set splitright
set switchbuf     =
set synmaxcol     =200
set timeout
set timeoutlen    =1000
set titlestring   =VIM:\ %f
set ttimeout
set ttimeoutlen   =10
set ttyfast
set virtualedit   =onemore,block
set whichwrap     =h,l

" wild stuff
set suffixes     +=.a,.1,.class
set wildignore   +=*.o,*.so,*.zip,*.png
set wildmenu
set wildoptions   =tagfile
if has('nvim-0.4.0')
    set wildoptions+=pum
else
    set wildmode=list:longest,full
endif

" display settings
set display      +=lastline
set laststatus    =2
set list
set modeline
set modelines     =1
set nostartofline
set numberwidth   =1
set ruler
set shortmess     =aoOTI
set showcmd
set showmatch
set showmode

" breaking
set wrap
set nolinebreak
set breakindent
set breakindentopt=min:40
"set highlight    +=@:SpecialKey

set cpoptions     =aABcefFqsZ
set formatoptions =tcrqnj

if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
    let &fillchars = 'vert:|,diff: '  " ▚
    let &showbreak = '↪ '
    augroup vimrc
        autocmd InsertEnter * set listchars-=trail:⣿
        autocmd InsertLeave * set listchars+=trail:⣿
    augroup END
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
    let &fillchars = 'vert: ,stlnc:#'
    let &showbreak = '-> '
    augroup vimrc
        autocmd InsertEnter * set listchars-=trail:.
        autocmd InsertLeave * set listchars+=trail:.
    augroup END
endif

if (has('nvim'))
    set inccommand=nosplit
endif

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif


" Mappings {{{1
let mapleader = ','
inoremap jk <esc>

inoremap <C-s>     <C-o>:update<cr><Esc>
nnoremap <C-s>     :update<cr>
nnoremap <leader>, :update<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" <Leader>c Close quickfix/location window
" ---------------------------------------------------------------------------
nmap <leader>l :set list!<cr>

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" map <silent> <C-h> :call functions#WinMove('h')<cr>
" map <silent> <C-j> :call functions#WinMove('j')<cr>
" map <silent> <C-k> :call functions#WinMove('k')<cr>
" map <silent> <C-l> :call functions#WinMove('l')<cr>

nnoremap <silent> <leader>z :call functions#zoom()<cr>

map <leader>wc :wincmd q<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" around line
vnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>


" Autocmd {{{1
augroup vimrc
    if has('nvim')
        autocmd TermOpen,BufEnter term://* startinsert
    endif

    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   execute 'normal! g`"zvzz' |
                \ endif

    autocmd WinEnter    * set cursorline
    autocmd WinLeave    * set nocursorline
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline

    autocmd CompleteDone * pclose
augroup END

augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J
    autocmd FileType qf nmap <buffer> q :q<cr>
augroup END

" Command {{{1
command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" ColorScheme {{{1
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night

" Statusline {{{1
" function! s:statusline_expr()
"     let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"     let ro  = "%{&readonly ? '[RO] ' : ''}"
"     let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"     let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"     let sep = ' %= '
"     let pos = ' %-12(%l : %c%V%) '
"     let pct = ' %P '

"     return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
" endfunction
" let &statusline = s:statusline_expr()


" Plugin {{{1
" Plugin: exception {{{2
nnoremap <silent><leader>E :call exception#trace()<cr>

" Plugin: netrw {{{2
let g:netrw_chgwin = 2
let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=20
let g:netrw_liststyle=3


" Plugin: vim-bbye {{{2
nnoremap <leader>q :Bdelete<cr>


" Plugin: vim-startify {{{2
nnoremap <leader>st :Startify<cr>

let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

function! s:list_commits()
    let git = 'git -C ' . getcwd()
    let commits = systemlist(git . ' log --oneline | head -n5')
    let git = 'G' . git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
            \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
            \  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
            \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
            \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
            \  { 'type': 'commands',  'header': [ 'Commands' ]       },
            \ ]

let g:startify_commands = [
            \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
            \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
            \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.dotfiles/config/nvim/init.vim' },
            \ { 'z': '~/.dotfiles/zsh/zshrc.symlink' }
            \ ]

autocmd User Startified setlocal cursorline

" Plugin: tagbar {{{2
nnoremap <f2> :TagbarToggle<cr>

let g:tagbar_width     = 40
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

" Plugin Devicons {{{2
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" Plugin: NERDTree {{{2
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face
" let NERDTreeShowHidden=1

" Toggle NERDTree
function! ToggleNerdTree()
    if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
    else
        :NERDTreeToggle
    endif
endfunction
" toggle nerd tree
nmap <silent> <leader>k :call ToggleNerdTree()<cr>


" Plugin: vim-easy-align {{{2
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plugin: vim-easymotion {{{2
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {
                \     "\<CR>": '<Over>(easymotion)'
                \   },
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


" Plugin: vim-autoformat {{{2
noremap <F8> :Autoformat<CR>


" Plugin: vim-pandoc {{{2
let g:pandoc#spell#enabled = 0
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END


" Plugin: vim-go {{{2
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_highlight_variable_declarations = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
let g:go_highlight_structs = 1

let g:go_fmt_command = 'goreturns'


" Plugin: YouCompleteMe & Snippets {{{2
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_use_clangd = 0

let g:ycm_add_preview_to_completeopt=0
let g:ycm_max_num_candidates=50

let g:ycm_gopls_binary_path = "gopls"
let g:ycm_gopls_args = ['-remote=auto']


let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_stop_completion = ['<C-y>']

let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.vim/MySnippets']


nnoremap <silent>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <silent>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent>gc :YcmCompleter GetDoc<CR>

" Plugin: clap-vim {{{2
nnoremap <leader>cc :Clap <CR>
nnoremap <leader>cf :Clap files <CR>
nnoremap <leader>cb :Clap buffers<CR>
nnoremap <leader>cg :Clap grep<CR>


" Plugin: vim-airline {{{2
let g:airline_theme = 'forest_night'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1

" }}}1

