" vim: set foldmethod=marker foldlevel=0 nomodeline:
" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

"{{{Basic
if has('nvim')
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
"}}}

"" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{
" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set autoread " detect when a file is changed

set history=1000 " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
endif

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

if has('mouse')
    set mouse=a
endif

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, egex

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
" }}}

" Appearance {{{
set number " show line numbers
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2 " show the status line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set shell=$SHELL
set cmdheight=1 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set showtabline=2                       " 总是显示标签

" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

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

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Load colorschemes
Plug 'sainnhe/vim-color-forest-night'

Plug 'pacha/vem-tabline'
" }}}

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" shortcut to save
" nmap <leader>, :w<cr>
inoremap <C-s>     <C-o>:update<cr><Esc>
nnoremap <C-s>     :update<cr>
nnoremap <leader>, :update<cr>

" set paste toggle
set pastetoggle=<leader>v

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz
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
" ----------------------------------------------------------------------------
" nnoremap <leader>c :cclose<bar>lclose<cr>

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

" inoremap <tab> <c-r>=functions#Smart_TabComplete()<CR>

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

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

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" Custom text objects

" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" around line
vnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

let s:regNums = ['0b[01]', '0x\x', '\d' ]

" selec tthe next number on the line
" this can handle the following three formats:
"     1. binary  (eg: '0b1010', '0b0000', etc)
"     2. hex     (eg: '0xffff', '0x0000', etc)
"     3. decimal (eg: '0', '10', '01', etc)
function! s:inNumber()
    " magic is required
    let l:magic = &magic
    set magic

    let l:lineNr = line('.')

    " create regex pattern matching any binary, hex, decimal number
    let l:pat  = join(s:regNums, '\+\|') . '\+'

    " move cursor to the end of number
    if (!search(l:pat, 'ce', l:lineNr))
        " if it fails, there was no match on this line
        return
    endif

    " start visually selecting
    normal! v

    " move cursor to beginning of the number
    call search(l:pat, 'cb', l:lineNr)

    " restore magic
    let &magic = l:magic
endfunction

" 'in number' (next number after cursor on current line)
xnoremap <silent> in :<c-u>call <sid>inNumber()<cr>
onoremap <silent> in :<c-u>call <sid>inNumber()<cr>

function! s:aroundNumber()
    " select the next number on the line and any surrounding white-space;
    " this can handle the following three formats (so long as s:regNums is
    " defined as it should be above these functions):
    "   1. binary  (eg: "0b1010", "0b0000", etc)
    "   2. hex     (eg: "0xffff", "0x0000", "0x10af", etc)
    "   3. decimal (eg: "0", "0000", "10", "01", etc)
    " NOTE: if there is no number on the rest of the line starting at the
    "       current cursor position, then visual selection mode is ended (if
    "       called via an omap) or nothing is selected (if called via xmap);
    "       this is true even if on the space following a number

    " need magic for this to work properly
    let l:magic = &magic
    set magic

    let l:lineNr = line('.')

    " create regex pattern matching any binary, hex, decimal number
    let l:pat = join(s:regNums, '\+\|') . '\+'

    " move cursor to end of number
    if (!search(l:pat, 'ce', l:lineNr))
        " if it fails, there was not match on the line, so return prematurely
        return
    endif

    " move cursor to end of any trailing white-space (if there is any)
    call search('\%'.(virtcol('.')+1).'v\s*', 'ce', l:lineNr)

    " start visually selecting from end of number + potential trailing whitspace
    normal! v

    " move cursor to beginning of number
    call search(l:pat, 'cb', l:lineNr)

    " move cursor to beginning of any white-space preceding number (if any)
    call search('\s*\%'.virtcol('.').'v', 'b', l:lineNr)

    " restore magic
    let &magic = l:magic
endfunction

" }}}

" AutoGroups {{{
" file type specific settings
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
" }}}

" General Functionality {{{
" better terminal integration
" substitute, search, and abbreviate multiple variants of a word
" Plug 'tpope/vim-abolish'

" search inside files using ripgrep. This plugin provides an Ack command.
" Plug 'wincent/ferret'

" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" easy commenting motions
Plug 'tpope/vim-commentary'

" mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-unimpaired'

" endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-ragtag'

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" tmux integration for vim
Plug 'benmills/vimux'

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat'

" .editorconfig support
Plug 'editorconfig/editorconfig-vim'

" single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'AndrewRadev/splitjoin.vim'

" add end, endif, etc. automatically
Plug 'tpope/vim-endwise'

" vim-illuminate {{{
" automatically highlight the word under the cursor
Plug 'RRethy/vim-illuminate'
let g:Illuminate_ftblacklist = ['nerdtree', 'fugitive', 'fugitiveblame']
let g:Illuminate_delay = 500
let g:Illuminate_highlightUnderCursor = 0
let g:Illuminate_ftHighlightGroups = {
            \ 'vim:blacklist': ['vimVar', 'vimString', 'vimLineComment',
            \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc'],
            \ 'typescript:blacklist': ['typescriptStorageClass', 'typescriptReserved',
            \         'typescriptType', 'typescriptBoolean', 'typescriptConditional',
            \         'typescriptStatement', 'typescriptStringS', 'typescriptIdentifier',
            \         'jsxString', 'jsxAttrib']
            \ }
" }}}

" detect indent style (tabs vs. spaces)
Plug 'tpope/vim-sleuth'

" Startify: Fancy startup screen for vim {{{
Plug 'mhinz/vim-startify'

" Don't change to directory when selecting a file
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
nmap <leader>st :Startify<cr>
" }}}

" Close buffers but keep splits
Plug 'moll/vim-bbye'
nmap <leader>b :Bdelete<cr>

" Writing in vim {{{{
Plug 'junegunn/goyo.vim'
" }}}

" context-aware pasting
Plug 'sickill/vim-pasta'

" NERDTree {{{
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

augroup nerdtree
    autocmd!
    autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
    autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

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
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
" let NERDTreeDirArrowExpandable = '▷'
" let NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
" }}}

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
" let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
" let g:tagbar_type_rust = {
"   \ 'ctagstype' : 'rust',
"   \ 'kinds' : [
"       \ 'n:modules',
"       \ 's:structures:1',
"       \ 'i:interfaces',
"       \ 'c:implementations',
"       \ 'f:functions:1',
"       \ 'g:enumerations:1',
"       \ 't:type aliases:1:0',
"       \ 'v:constants:1:0',
"       \ 'M:macros:1',
"       \ 'm:fields:1:0',
"       \ 'e:enum variants:1:0',
"       \ 'P:methods:1',
"   \ ],
"   \ 'sro': '::',
"   \ 'kind2scope' : {
"       \ 'n': 'module',
"       \ 's': 'struct',
"       \ 'i': 'interface',
"       \ 'c': 'implementation',
"       \ 'f': 'function',
"       \ 'g': 'enum',
"       \ 't': 'typedef',
"       \ 'v': 'variable',
"       \ 'M': 'macro',
"       \ 'm': 'field',
"       \ 'e': 'enumerator',
"       \ 'P': 'method',
"   \ },
" \ }

" FZF {{{
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>s :GFiles?<cr>

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

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
" }}}

" signify {{{
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_add               = '┃'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '_'
let g:signify_sign_change = '┃'
" }}}

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'
" }}}

" coc.nvim {{{
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}

Plug 'honza/vim-snippets'

" Some servers have issues with backup files, see #649

" ----------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ----------------------------------------------------------------------------
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

" }}}

" Motions and Search {{{
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'


" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)

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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" }}}

" Wakatime {{{
Plug 'wakatime/vim-wakatime'
" }}}

" }}}

" Language-Specific Configuration {{{
" html / templates {{{
" emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'mattn/emmet-vim'

" match tags in html, similar to paren support
Plug 'gregsexton/MatchTag', { 'for': 'html' }

" html5 support
Plug 'othree/html5.vim', { 'for': 'html' }

" mustache support
Plug 'mustache/vim-mustache-handlebars'


Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_refreshEvents = ['BufWritePost']
let g:Hexokinase_ftAutoload = ['css']
" let g:Hexokinase_virtualText = '█'
let g:Hexokinase_virtualText = '■'
" }}}

Plug 'sheerun/vim-polyglot'

Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1


Plug 'Chiel92/vim-autoformat'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" JSON {{{
" Plug 'elzr/vim-json', { 'for': 'json' }
" let g:vim_json_syntax_conceal = 0
" }}}

Plug 'fatih/vim-go', { 'for': 'go' }
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


" Plug 'timcharper/textile.vim', { 'for': 'textile' }
" Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'ekalinin/Dockerfile.vim'
" }}}

call plug#end()


" Colorscheme and final setup {{{
" This call must happen after the plug#end() call to ensure
" that the colorschemes have been loaded
colorscheme forest-night

syntax enable
filetype plugin indent on
" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=19 guifg=#333333
highlight NonText ctermfg=19 guifg=#333333

" make comments and HTML attributes italic
highlight Comment cterm=italic term=italic gui=italic
highlight htmlArg cterm=italic term=italic gui=italic
highlight xmlAttrib cterm=italic term=italic gui=italic
" highlight Type cterm=italic term=italic gui=italic
highlight Normal ctermbg=none

hi illuminatedWord guifg=#000000 ctermfg=16 guibg=#ffd2dc ctermbg=211

" Fix no highlight
autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

" }}} 


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

let g:goyo_entered = 0
function! s:goyo_enter()
    silent !tmux set status off
    let g:goyo_entered = 1
    set noshowmode
    set noshowcmd
    set scrolloff=999
    set wrap
    setlocal textwidth=0
    setlocal wrapmargin=0
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    let g:goyo_entered = 0
    set showmode
    set showcmd
    set scrolloff=5
    set textwidth=120
    set wrapmargin=8
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

