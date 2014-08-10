" Load Plugins
execute pathogen#infect()


"============================================
"                GENERAL
"============================================

let mapleader="," " Set leader key to comma

set nocompatible        " Set fist, as this option affects others
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hidden              " Hide, not Close buffers
set nu
set number              " Show line numbers
set pastetoggle=<F2>    " Paste code without vim auto indenting it
set nuw=1               " Make numberline as small as possible
set autoindent
set nocp
set et

set backspace=2
set encoding=utf-8
set scrolloff=3

set shortmess+=I        " Remove intro text

" Sources vimrc, useful when editing vimrc settings
nmap <silent> <leader>so :so $MYVIMRC<CR>

" Remove need for Shift to type commands
nnoremap ; :

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

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_incsearch = 1

" Close preview windows
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Vim Show indents
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=black

" Delete trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"CtrlP key
nmap <C-b> :CtrlPBuffer<CR>
nmap <silent> <leader>m :CtrlPMRU<CR>

nmap <C-c> :EasyMotion<CR>

" Tagbar/IndentGuides Toggle keys
nmap <C-z> :TagbarToggle<CR>
nmap <C-a> :IndentGuidesToggle<CR>

" NERDTree
let g:NERDTreeWinSize=24
let NERDTreeIgnore = ['\.pyc$', '\.class$', '\.git$', '\.o$']

"Syntastic setup
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jshint']

"Tagbar setup
let g:tagbar_width = 28


" Prevent UltiSnips from stealing ctrl-k.
augroup VimStartup
autocmd!
autocmd VimEnter * sil! iunmap <c-k>
augroup end"

"============================================
"               AUTOCOMMANDS
"============================================

autocmd FileType html set ft=htmldjango
autocmd FileType html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType htmldjango set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" indent all html tags
autocmd FileType html let g:html_indent_inctags = "html,body,head,tbody"
autocmd FileType htmldjango let g:html_indent_inctags = "html,body,head,tbody"

"============================================
"                 CTRLP
"============================================
set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'bower_dir': '\v[\/](bower_components)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "luna"

" YCM setup
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

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


hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen
