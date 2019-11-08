" vim: sw=2 sts=2 tw=0 fdm=marker

" Init {{{
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
"}}}

" Plug {{{1
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')
    Plug 'sainnhe/vim-color-forest-night'

    Plug 'pacha/vem-tabline'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-vinegar'
    Plug 'jiangmiao/auto-pairs'
    Plug 'benmills/vimux'
    Plug 'mhinz/vim-janah'
    Plug 'mhinz/vim-signify'
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-halo'
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

    "coc.nvim
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
    Plug 'honza/vim-snippets'
    Plug 'rust-lang/rust.vim', {'for': 'rust'}
    Plug 'rhysd/rust-doc.vim', {'for': 'rust'}
    Plug 'lifepillar/pgsql.vim', {'for': 'sql'}
    Plug 'mattn/emmet-vim', {'for': 'html'}
    Plug 'AndrewRadev/tagalong.vim', {'for': 'html'}
    Plug 'rhysd/rust-doc.vim'
    Plug 'fatih/vim-go', { 'for': 'go' }
    Plug 'Chiel92/vim-autoformat'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'terryma/vim-multiple-cursors'
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

" better navigation
set cursorline
set foldmethod    =marker
set foldopen     +=jump
set foldtext      =mhi#foldy()
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
set noequalalways
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
  let &fillchars = 'vert: ,diff: '  " ▚
  let &showbreak = '↪ '
  highlight VertSplit ctermfg=242
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

" inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap <silent> <c-p> :cprevious \| call halo#run()<cr>
nnoremap <silent> <c-n> :cnext \| call halo#run()<cr>
nnoremap <silent> [q    :cprevious \| call halo#run()<cr>
nnoremap <silent> ]q    :cnext \| call halo#run()<cr>
nnoremap <silent> [l    :lprevious \| call halo#run()<cr>
nnoremap <silent> ]l    :lnext \| call halo#run()<cr>
nnoremap <silent> [b    :call mhi#switch_buffer('bprevious')<cr>
nnoremap <silent> ]b    :call mhi#switch_buffer('bnext')<cr>
nnoremap <silent> [t    :tabprevious \| call halo#run()<cr>
nnoremap <silent> ]t    :tabnext \| call halo#run()<cr>
nnoremap <silent> <tab> <c-w>w:call halo#run()<cr>

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

map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

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

" Color {{{1
function! s:colors_default() abort
  highlight Comment cterm=italic
  highlight link User1 StatusLine   " master branch
  highlight link User2 StatusLine   " other branch
  highlight link User3 StatusLine   " separators
  highlight link User4 StatusLine   " filename at beginning
  highlight link User5 StatusLine   " ~changes
  highlight link SignifySignAdd    DiffAdd
  highlight link SignifySignDelete DiffDelete
  highlight link SignifySignChange DiffChange
  highlight Halo guifg=white guibg=#F92672 ctermfg=white ctermbg=197
endfunction

function! s:colors_janah() abort
  highlight User1  ctermfg=192 ctermbg=237 cterm=NONE
  highlight User2  ctermfg=167 ctermbg=237 cterm=NONE
  highlight User3  ctermfg=245 ctermbg=237 cterm=NONE
  highlight User4  ctermfg=215 ctermbg=237 cterm=NONE
  highlight User5  ctermfg=111 ctermbg=237 cterm=NONE
endfunction

function! s:colors_lucius() abort
  if &background ==# 'light'
    highlight Normal                  ctermbg=NONE
    highlight CursorLine              ctermbg=255
    highlight User1      ctermfg=84   ctermbg=237  cterm=NONE
    highlight User2      ctermfg=222  ctermbg=237  cterm=NONE
    highlight User3      ctermfg=237  ctermbg=237  cterm=NONE
    highlight User4      ctermfg=255  ctermbg=237  cterm=NONE
    highlight User5      ctermfg=255  ctermbg=237  cterm=NONE
    highlight StatusLine              ctermbg=237  cterm=NONE
    highlight SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    highlight Question   ctermfg=24   ctermbg=255  cterm=NONE
    highlight Search     ctermfg=fg   ctermbg=222  cterm=NONE
    highlight Folded                  ctermbg=253  cterm=NONE
    highlight NormalFloat ctermfg=231 ctermbg=240  cterm=NONE
  endif
endfunction

function! s:colors_snow() abort
  highlight Normal ctermbg=NONE guibg=NONE
endfunction

augroup vimrc
  autocmd ColorScheme *      call s:colors_default()
  autocmd ColorScheme janah  call s:colors_janah()
  autocmd ColorScheme lucius call s:colors_lucius()
  autocmd ColorScheme snow   call s:colors_snow()
augroup END

colorscheme forest-night

" Statusline {{{1
command! -bar ToggleStatusline let b:stl_location  = !get(b:, 'stl_location')
command! -bar ToggleHighlight  let b:stl_highlight = !get(b:, 'stl_highlight')

nnoremap <silent><f10> :ToggleStatusline<cr>
nnoremap <silent><f11> :ToggleHighlight<cr>

set statusline=%!SetStatusline()

function! SetStatusline()
  let stl = ' %4*%<%f%*'

  if exists('b:git_dir')
    let stl    .= '%3*:%*'
    let branch  = fugitive#head(8)
    let stl    .= (branch == 'master') ? '%1*master%*' : '%2*'. branch .'%*'
    let stl    .= mhi#sy_stats_wrapper()
  endif

  let stl .= '%m%r%h%w '

  " right side
  let stl .=
        \   '%= '
        \ . '%#ErrorMsg#%{&paste ? " paste " : ""}%*'
        \ . '%#WarningMsg#%{&ff != "unix" ? " ".&ff." ":""}%* '
        \ . '%#warningmsg#%{&fenc != "utf-8" && &fenc != "" ? " ".&fenc." " :""}%* '

  if get(b:, 'stl_highlight')
    let id = synID(line('.'), col('.'), 1)
    let stl .=
          \   '%#WarningMsg#['
          \ . '%{synIDattr('.id.',"name")} as '
          \ . '%{synIDattr(synIDtrans('.id.'),"name")}'
          \ . ']%* '
  endif

  if get(b:, 'stl_location')
    let stl .=
          \   '%3*[%*%v%3*,%*%l%3*/%*%L%3*]%* '
          \ . '%p%3*%%%* '
  endif

  return stl
endfunction
" }}}1

" Plugin {{{1
" Plugin: exception {{{2
nnoremap <silent><leader>E :call exception#trace()<cr>

" Plugin: netrw {{{2
let g:netrw_banner       = 0
let g:netrw_bufsettings  = 'relativenumber'
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1
let g:netrw_sort_options = 'i'

" Plugin: vim-bbye {{{2
nmap <leader>b :Bdelete<cr>

" Plugin: fzf {{{2
let g:fzf_layout = { 'down': '~25%' }

nnoremap <leader><leader> :Buffers<cr>
nnoremap <leader>f        :FZF<cr>
nmap <silent> <leader>s   :GFiles?<cr>

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

" command! Todo Grepper -noprompt -tool rg -query '(TODO|FIX|FIXME|XXX|NOTE|HACK|OPTIMIZE):'

" Plugin: vim-startify {{{2
nnoremap <leader>st :Startify<cr>

" let g:startify_change_to_dir       = 0
" let g:startify_custom_header       = 'startify#pad(startify#fortune#boxed())'
" let g:startify_enable_special      = 0
" let g:startify_fortune_use_unicode = 1
" let g:startify_update_oldfiles     = 1
" let g:startify_use_env             = 1

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

" Plugin: undotree {{{2
nnoremap <f3>  :UndotreeToggle<cr>

" Plugin: vim-easy-align {{{2
xmap <cr> <plug>(LiveEasyAlign)

" Plugin: vim-easymotion {{{2
let g:EasyMotion_do_mapping        = 0
let g:EasyMotion_do_shade          = 1
let g:EasyMotion_inc_highlight     = 0
let g:EasyMotion_landing_highlight = 0
let g:EasyMotion_off_screen_search = 0
let g:EasyMotion_smartcase         = 0
let g:EasyMotion_startofline       = 0
let g:EasyMotion_use_smartsign_us  = 1
let g:EasyMotion_use_upper         = 0

let g:EasyMotion_skipfoldedline = 0

map <silent><space> <plug>(easymotion-s2)


" Plugin: vim-pandoc {{{2
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Plugin: vim-go {{{2
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"

" Plugin: vim-rust {{{2
let g:rustfmt_autosave = 1

" Plugin: coc.nvim {{{2
function! s:can_complete(func, prefix)
    if empty(a:func)
        return 0
    endif
    let start = call(a:func, [1, ''])
    if start < 0
        return 0
    endif

    let oline  = getline('.')
    let line   = oline[0:start-1] . oline[col('.')-1:]

    let opos   = getpos('.')
    let pos    = copy(opos)
    let pos[2] = start + 1

    call setline('.', line)
    call setpos('.', pos)
    let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
    call setline('.', oline)
    call setpos('.', opos)

    if !empty(type(result) == type([]) ? result : result.words)
        call complete(start + 1, result)
        return 1
    endif
    return 0
endfunction

function! s:feedkeys(k)
    call feedkeys(a:k, 'n')
    return ''
endfunction

function! s:super_duper_tab(pumvisible, next)
    let [k, o] = a:next ? ["\<c-n>", "\<tab>"] : ["\<c-p>", "\<s-tab>"]
    if a:pumvisible
        return s:feedkeys(k)
    endif

    let line = getline('.')
    let col = col('.') - 2
    if line[col] !~ '\k\|[/~.]'
        return s:feedkeys(o)
    endif

    let prefix = expand(matchstr(line[0:col], '\S*$'))
    if prefix =~ '^[~/.]'
        return s:feedkeys("\<c-x>\<c-f>")
    endif
    if s:can_complete(&omnifunc, prefix) || s:can_complete(&completefunc, prefix)
        return ''
    endif
    return s:feedkeys(k)
endfunction

if has_key(g:plugs, 'ultisnips')
    " UltiSnips will be loaded only when tab is first pressed in insert mode
    if !exists(':UltiSnipsEdit')
        inoremap <silent> <Plug>(tab) <c-r>=plug#load('ultisnips')?UltiSnips#ExpandSnippet():''<cr>
        imap <tab> <Plug>(tab)
    endif

    let g:SuperTabMappingForward  = "<tab>"
    let g:SuperTabMappingBackward = "<s-tab>"
    function! SuperTab(m)
        return s:super_duper_tab(a:m == 'n' ? "\<c-n>" : "\<c-p>",
                    \ a:m == 'n' ? "\<tab>" : "\<s-tab>")
    endfunction
else
    inoremap <silent> <tab>   <c-r>=<SID>super_duper_tab(pumvisible(), 1)<cr>
    inoremap <silent> <s-tab> <c-r>=<SID>super_duper_tab(pumvisible(), 0)<cr>
endif

" TBD
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" }}}1
