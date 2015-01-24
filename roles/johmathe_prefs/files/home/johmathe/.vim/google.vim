" Google configuration.
syntax on
source ~/.vim/google-orig.vim
if filereadable("/google/src/head/depot/eng/vim/google.vim")
  source /google/src/head/depot/eng/vim/google.vim
elseif filereadable("/google/src/head/depot/eng/vim/google.vim")
  source /google/src/head/depot/eng/vim/google.vim
else
  source ~/.vim/google-orig.vim
endif
set nolist

" Perforce commands.
command! -nargs=* -complete=file PEdit :!g4 edit %
command! -nargs=* -complete=file PRevert :!g4 revert %
command! -nargs=* -complete=file PDiff :!g4 diff %

function! s:CheckOutFile()
 if filereadable(expand("%")) && ! filewritable(expand("%"))
   let s:pos = getpos('.')
   let option = confirm("Readonly file, do you want to checkout from p4?"
     \, "&Yes\n&No", 1, "Question")
   if option == 1
     PEdit
   endif
   edit!
   call cursor(s:pos[1:3])
 endif
endfunction
au FileChangedRO * nested :call <SID>CheckOutFile()

" Set up gvimdiff for Perforce.
function! DiffSetup()
  let &columns = 88 * 2
  wincmd =
  wincmd w
  normal! gg
endfunction

if &diff && has('gui_running')
  autocmd VimEnter * call DiffSetup()
endif

" Detect editing P4 files.
function! EditPerforceFile()
 setlocal nolist noet tw=0 ts=8 sw=8 sts=8 ft=conf
 if search("<enter description here>") > 0
   normal! C
   startins!
 elseif bufname('*') != 'message'
   /^Description:/
   normal! 2w
 endif
endfunction

augroup filetypedetect
autocmd BufNewFile,BufRead /tmp/g4_*,*p4-change*,*p4-client*
  \ call EditPerforceFile()
augroup END

" Map gpylint to :make when editing a Python file.
function! PyLintSetup()
  set makeprg=(echo\ '[%]';\ gpylint\ %)
  set errorformat=%+P[%f],%t:\ %#%l:%m
endfunction
autocmd FileType python call PyLintSetup()

" Group machines by specs.
command! GroupMachines % ! cut -c 8- | sort | uniq -c | sort -brnk 1

" Grab machine names from mdb ri -A.
command! GetMachines w ! echo $(bycol 1)

" Make GVim usable when background is set to dark.
highlight Normal guifg=gray guibg=black

" HTML highlighting for ezt files.
au! BufNewFile,BufRead *.ezt set filetype=html textwidth=0
