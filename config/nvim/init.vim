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
  Plug 'sainnhe/vim-color-forest-night'
  Plug 'pacha/vem-tabline'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'

  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'benmills/vimux'
  Plug 'mhinz/vim-janah'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/gv.vim', {'on': 'GV'}
  Plug 'junegunn/vader.vim'
  Plug 'junegunn/vim-easy-align', {'on': '<plug>(LiveEasyAlign)'}
  Plug 'justinmk/vim-dirvish'
  Plug 'rhysd/committia.vim'
  Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
  Plug 'moll/vim-bbye'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  Plug 'honza/vim-snippets'
  Plug 'rust-lang/rust.vim', {'for': 'rust'}
  Plug 'lifepillar/pgsql.vim', {'for': 'sql'}
  Plug 'cespare/vim-toml'
  Plug 'mattn/emmet-vim', {'for': 'html'}
  Plug 'AndrewRadev/tagalong.vim', {'for': 'html'}
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'Chiel92/vim-autoformat'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
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

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" better coc.nvim
" set hidden
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" better navigation
set cursorline
set foldmethod    =syntax
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
set completeopt  +=noselect
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
nmap <leader>b :Bdelete<cr>

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
colorscheme forest-night

" Statusline {{{1
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

" Plugin {{{1
" Plugin: exception {{{2
nnoremap <silent><leader>E :call exception#trace()<cr>

" Plugin: netrw {{{2
let g:netrw_chgwin = 2
let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=20
let g:netrw_liststyle=3

" Plugin: vim-bbye {{{2
nnoremap <leader>b :Bdelete<cr>

" Plugin: fzf {{{2
let g:fzf_layout = { 'down': '~25%' }

nnoremap <leader><leader> :Buffers<cr>
nnoremap <leader>f        :FZF<cr>
nnoremap <silent><leader>s   :GFiles?<cr>

if isdirectory(".git")
    nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
    nmap <silent> <leader>t :FZF<cr>
endif

nnoremap <silent> <Leader>C :call fzf#run({
            \   'source':
            \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
            \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
            \   'sink':    'colo',
            \   'options': '+m',
            \   'left':    30
            \ })<CR>

command! FZFMru call fzf#run({
            \  'source':  v:oldfiles,
            \  'sink':    'e',
            \  'options': '-m -x +s',
            \  'down':    '40%'})

command! -bang -nargs=* Find call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
command! -bang -nargs=? -complete=dir GitFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

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
            \ { 'c': '~/code/dotfiles/config/nvim/init.vim' },
            \ { 'z': '~/code/dotfiles/zsh/zshrc.symlink' }
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

" Plugin: undotree {{{2
nnoremap <f3>  :UndotreeToggle<cr>

" Plugin: vim-easy-align {{{2
xmap <cr> <plug>(LiveEasyAlign)

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
let g:go_fmt_command = "goimports"

" Plugin: vim-rust {{{2
" let g:rustfmt_autosave = 1

" Plugin: coc.nvim {{{2
let g:coc_global_extensions = [
      \'coc-pairs',
      \'coc-json',
      \'coc-highlight',
      \'coc-dictionary',
      \'coc-tag',
      \'coc-git',
      \'coc-snippets',
      \'coc-lists',
      \'coc-syntax',
      \'coc-word',
      \'coc-lines',
      \'coc-rust-analyzer'
      \]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

function! CopyFloatText() abort
  let id = win_getid()
  let winid = coc#util#get_float()
  if winid
    call win_gotoid(winid)
    execute 'normal! ggvGy'
    call win_gotoid(id)
  endif
endfunction

" Command
command! -nargs=0 C             :CocConfig
command! -nargs=0 R             :CocRestart
command! -nargs=0 L             :CocListResume
command! -nargs=0 -range D      :CocCommand

command! -nargs=0 Todos         :CocList -A --normal grep -e TODO|FIXME
command! -nargs=0 Status        :CocList -A --normal gstatus
command! -nargs=+ Find          :exe 'CocList -A --normal grep --smart-case '.<q-args>
command! -nargs=0 Format        :call CocAction('format')
command! -nargs=0 GitChunkUndo  :call CocAction('runCommand', 'git.chunkUndo')
command! -nargs=0 OR            :call CocAction('runCommand', 'editor.action.organizeImport')

autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings
nmap <silent> gd :call <SID>GoToDefinition()<CR>
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gl <Plug>(coc-codelens-action)
nmap <silent> gs <Plug>(coc-git-chunkinfo)
nmap <silent> gm <Plug>(coc-git-commit)
omap <silent> ig <Plug>(coc-git-chunk-inner)
xmap <silent> ig <Plug>(coc-git-chunk-inner)

" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <space>o  :<C-u>CocList -A outline<CR>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>f  :<C-u>CocList files<CR>
nnoremap <silent> <space>l  :<C-u>CocList locationlist<CR>
nnoremap <silent> <space>q  :<C-u>CocList quickfix<CR>
nnoremap <silent> <space>w  :<C-u>CocList -I -N symbols<CR>
nnoremap <silent> <space>m  :<C-u>CocList -A -N mru<CR>
nnoremap <silent> <space>b  :<C-u>CocList -A -N --normal buffers<CR>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>s  :exe 'CocList -A -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <space>S  :exe 'CocList -A --normal grep '.expand('<cword>').''<CR>

" }}}1
