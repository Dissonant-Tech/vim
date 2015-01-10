" Load Plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer --system-libclang' }

Plug 'junegunn/vim-github-dashboard'

Plug 'Shougo/unite.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'vim-scripts/cSyntaxAfter'

Plug 'sjl/gundo.vim'

Plug 'gorkunov/smartpairs.vim'

Plug 'scrooloose/syntastic'

Plug 'majutsushi/tagbar'

Plug 'vim-scripts/TagHighlight'

Plug 'SirVer/ultisnips'

Plug 'Shougo/unite-session'

Plug 'bling/vim-airline'

Plug 'djoshea/vim-autoread'

Plug 'gorodinskiy/vim-coloresque'

Plug 'Lokaltog/vim-easymotion'

Plug 'Shougo/vimfiler.vim'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'terryma/vim-multiple-cursors'

Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'Dissonant-Tech/vim-searchdestroy'

Plug 'Shougo/vimshell.vim'

Plug 'honza/vim-snippets'

Plug 'sukima/xmledit'

Plug 'guns/xterm-color-table.vim'

Plug 'plasticboy/vim-markdown'

Plug 'godlygeek/tabular'

Plug 'Wolfy87/vim-enmasse'

Plug 'idanarye/vim-vebugger'

call plug#end()

"============================================
"                GENERAL
"============================================

set nocompatible        " Set fist, as this option affects others
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hidden              " Hide, not Close buffers
set nu
set number              " Show line numbers
set splitright          " Vertical Splits open on the right
set pastetoggle=<F2>    " Paste code without vim auto indenting it
set nuw=1               " Make numberline as small as possible
set autoindent
set nocp
set et

set backspace=2
set encoding=utf-8
set scrolloff=3

set shortmess+=I        " Remove intro text

set foldmethod=indent
set foldnestmax=7
set foldlevel=1
set nofoldenable        " Disable folding by default

" Sources vimrc, useful when editing vimrc settings
nmap <silent> <leader>so :so $MYVIMRC<CR>

noremap <M-q> <ESC>
nnoremap Q <nop>

" Persisten undo
set undodir=~/.vim/undo
set undofile
" Move vimfiles to their own directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Color settings
syntax on
filetype plugin on
filetype indent on
set background=dark
set t_Co=256
colorscheme wombat256mod

" Search options
set incsearch
set smartcase

" Use EasyMotion for search, overides above settings
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_incsearch = 1

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  m <Plug>(easymotion-next)
map  M <Plug>(easymotion-prev)

hi link EasyMotionMoveHL  IncSearch

" css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Vim Show indents
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=black

" Delete trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Start eclim daemon
nmap <silent> <leader>e :!/usr/share/eclipse/eclimd & <CR>

"CtrlP key
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRU<CR>

nmap <C-c> :EasyMotion<CR>

" Tagbar/IndentGuides Toggle keys
nmap <leader>a :TagbarToggle<CR>
nmap <leader>z :IndentGuidesToggle<CR>

" NERDTree
let g:NERDTreeWinSize=24
let NERDTreeIgnore = ['\.pyc$', '\.class$', '\.git$', '\.o$', '\.la$']

"Syntastic setup
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jshint']

"Tagbar setup
let g:tagbar_width = 28

"VimShell setup
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" Fugitive leader/command shortcuts
nmap <leader>gl :Git log --pretty="format:\%Cgreen\%h\%Creset \%an - \%s" --graph<CR>
nmap <leader>gll :Git log<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gst :Gstatus<CR>
nmap <leader>gaa :Git add --all .<CR>
nmap <leader>ga :Git add .<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>grm :Gremove<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gp :Gpush<CR>

nmap <leader>gpp :Gpush
nmap <leader>gm :Gmerge
nmap <leader>gco :Git checkout

" Git-gutter
nmap <leader>gt :GitGutterToggle<CR>
nmap <leader>gtl :GitGutterLineHighlightsToggle<CR>
nmap ]h <plug>GitGutterNextHunk<CR>
nmap [h <plug>GitGutterPrevHunk<CR>
hi SignColumn           ctermbg=none
hi GitGutterAdd         ctermfg=113 ctermbg=none	cterm=none	guifg=#95e454	gui=italic
hi GitGutterDelete	    ctermfg=203                             guifg=#ff5f55
hi GitGutterChange      ctermfg=111	ctermbg=none	cterm=none  guifg=#88b8f6

hi GitGutterAddLine	                ctermbg=235		cterm=none	guibg=#242424	gui=none
hi GitGutterDeleteLine	            ctermbg=203		cterm=none	guibg=#ff5f55	gui=none
hi GitGutterChangeLine	            ctermbg=235		cterm=none	guibg=#242424	gui=none
hi GitGutterChangeDeleteLine	    ctermbg=137		cterm=none  guibg=#e5786d

let g:gitgutter_highlight_lines = 0

" Mark/InterestingWords highlights
let g:interestingWordsGUIColors = ['#95e454', '#ff5ff5', '#88b8f6', '#e5786d']
let g:interestingWordsTermColors = ['113', '203', '111', '137']

hi MarkWord1    ctermbg=113 	guibg=#95e454    ctermfg=232 	guifg=#000000
hi MarkWord2	ctermbg=203     guibg=#ff5f55    ctermfg=232    guifg=#000000
hi MarkWord3    ctermbg=111		guibg=#88b8f6    ctermfg=232	guifg=#000000
hi MarkWord4	ctermbg=137	    guibg=#e5786d    ctermfg=232    guifg=#000000

"Eclim
let g:EclimCompletionMethod = 'omnifunc'

"============================================
"               AUTOCOMMANDS
"============================================

" Prevent UltiSnips from stealing ctrl-k.
augroup VimStartup
autocmd!
autocmd VimEnter * sil! iunmap <c-k>
augroup end"

autocmd VimEnter * :EclimDisable

" Close preview windows
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

autocmd FileType html set ft=htmldjango
autocmd FileType html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType htmldjango set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Indent all html tags
autocmd FileType html let g:html_indent_inctags = "html,body,head,tbody"
autocmd FileType htmldjango let g:html_indent_inctags = "html,body,head,tbody"

autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()

"============================================
"                 UNITE
"============================================

"Unite setup
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=buffer file<cr>
nnoremap <C-p> :Unite file_rec/async -start-insert<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match -start-insert buffer<cr>
nnoremap <space>b :Unite -start-insert buffer<cr>
nnoremap <space>f :VimFiler -buffer-name=explorer
            \-split -simple -winwidth=30 -toggle -no-quit<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom#profile('default', 'context', {
        \   'direction': 'topleft',
        \   'winheight': 18,
        \   'prompt': '» ',
        \   'marked_icon': '⚲',
        \   'smartcase': 1,
        \})

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.gradle/',
      \ '\.idea/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ '.class',
      \ 'build/intermediates/',
      \ ], '\|'))

" Vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "luna"

" YCM setup
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword

" UltiSnips setup
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

"============================================
"                Functions
"============================================

" Use <tab> for Ultisnips and YCM

function! g:UltiSnips_Complete()
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res == 0
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Highlight all repeated lines

function! HighlightRepeats() range
    let lineCounts = {}
    let lineNum = a:firstline
    while lineNum <= a:lastline
        let lineText = getline(lineNum)
        if lineText != ""
            let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
        endif
        let lineNum = lineNum + 1
    endwhile
    exe 'syn clear Repeat'
    for lineText in keys(lineCounts)
        if lineCounts[lineText] >= 2
            exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
        endif
    endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" Toggle highlighting of the variable under the cursor

let g:toggleHighlight = 1
function! ToggleHighlight(...)
  if a:0 == 1 "toggle behaviour
    let g:toggleHighlight = 1 - g:toggleHighlight
    call clearmatches()
  endif

  if g:toggleHighlight == 0 "normal action, do the hi
    silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
  else
    " do nothing
  endif
endfunction

autocmd CursorMoved * call ToggleHighlight()
map <C-f> :call ToggleHighlight(1)<CR>


map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Enable and Ping eclim
function! StartEclim()
    execute "EclimEnable"
    execute "PingEclim"
endfunction

command StartEclim call StartEclim()
