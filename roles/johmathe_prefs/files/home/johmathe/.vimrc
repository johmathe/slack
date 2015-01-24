" Google configuration.
source ~/.vim/google.vim
" Personnal addons
source ~/.vim/addons-johmathe.vim
set background=dark " Make colors suitable for a dark background.
syntax on           " Syntax highlighting.
syntax reset        " Use the default colors.
set t_Co=256        " Enable support for 256 colors.

" Keep a viminfo file.
set viminfo='50,<300,s100,h

set nocompatible    " Do not emulate vi.
set history=200     " Number of command history lines.
set undolevels=200  " Number of undo levels.
set expandtab       " Tabs are converted to spaces.
set shiftwidth=2    " Numbers of spaces to (auto)indent with.
set softtabstop=2   " Number of characters in one tab.
set smarttab        " Convert tab to spaces.
set autoindent      " Always set auto-indenting on.
set smartindent     " Try to guess the indent level.
set scrolloff=3     " Keep 3 lines when scrolling.
set incsearch       " Do incremental searching.
set ignorecase      " Do case-insensitive searching by default.
set smartcase       " Override ic if pattern contains upper case characters.
set showmatch       " Show matching braces.
set nohls           " Do not highlight search results.
set showcmd         " Show partial commands in status bar.
set showmode        " Show current mode.
set autowrite       " Write on make/shell commands.
set timeoutlen=250  " Time to wait after ESC.
set numberwidth=3   " Minimal number of columns to use for the line number.
set ruler           " Show current line/column.
set modeline        " Enable modelines.
set modelines=5     " Look for modelines in the first 5 lines.
set bs=2            " Allow backspace over everything in insert mode.
set encoding=utf-8  " Use UTF-8.
set wildmenu        " Enhanced auto-completion for command mode.
set title           " Change title of terminal window.
set nostartofline   " Do not jump to first char with page commands.

set nobackup        " Do not keep a backup file.
" set backupdir=~/.vim/backups " Where backups will go.
" set directory=~/.vim/tmp     " Where temporary files will go.

" Enable folding and open all folds by default.
set foldmethod=indent
set foldlevel=99

" Show line numbers if the window is wide enough.
if winwidth(0) >= 84
  set number
else
  set nonumber
endif

" File type plugins and indentation.
filetype on
filetype plugin on
filetype indent on

" Toggle quickfix.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    botright copen 8
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Work more logically within wrapped lines.
noremap j gj
noremap k gk

augroup filetype
  au FileType * map <F1> :<CR>
  au FileType python map <F1> :!python -i %<CR>
  au FileType haskell map <F1> :!ghci %<CR>
augroup end

" Move between tabs using alt+left and alt-right.
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
inoremap <A-Right> <C-PageDown>
inoremap <A-Left> <C-PageUp>

" Quickfix mappings.
map <silent> <F5> :QFix<CR>
map <silent> <F6> :cprev<CR>
map <silent> <F7> :cnext<CR>
map <silent> <F8> :make<CR>

" <F10> enables spellchecking.
map <silent> <F10> :set spell!<CR>
imap <F10> <ESC>:set spell!<CR>i

" <F11> opens tag list.
map <silent> <F9> :TlistToggle<CR>

" <F12> toggles paste mode.
set pastetoggle=<F12>

" Set a spellfile.
set spellfile=~/.vimdict.utf-8.add

" Map omni-completion to ctrl-space.
inoremap <Nul> <C-x><C-o>

" Enable omni-completion.
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete

" Diff current buffer with saved file.
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! ggdd
  diffthis
  exec "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffSaved call s:DiffWithSaved()

" Highlight extra spaces at the end of lines.
highlight SpaceHighlight ctermbg=red guibg=red
match SpaceHighlight /\s\+\%#\@<!$/

" Use yellow to highlight matching parens.
highlight MatchParen ctermbg=yellow

" Append closing char automatically.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

inoremap "      ""<Left>
inoremap ""     ""
inoremap """    """

inoremap '      ''<Left>
inoremap ''     ''
inoremap '''    '''

" Try a little harder to find tags in larger projects.
set tags=tags,./tags,../tags,../../tags

" Plugins: git, taglist.
