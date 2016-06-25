" Copyright (c) 2016 ASMlover. All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
"
"  * Redistributions of source code must retain the above copyright
"    notice, this list ofconditions and the following disclaimer.
"
"  * Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in
"    the documentation and/or other materialsprovided with the
"    distribution.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
" FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
" COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
" INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
" BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
" ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
" POSSIBILITY OF SUCH DAMAGE.

" hide menu bar and tool bar use<F2>
if WINDOWS()
  set guioptions-=T
  set guioptions-=m
  map <silent> <F2> :if &guioptions =~# 'T' <Bar>
      \set guioptions-=T <Bar>
      \set guioptions-=m <Bar>
    \else <Bar>
      \set guioptions+=T <Bar>
      \set guioptions+=m <Bar>
    \endif<CR>
endif

" auto pair complete
func! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction
" auto pair complete key-mapping
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap < <><ESC>i
" inoremap > <c-r>=ClosePair('>')<CR>
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i

" add vimtweak plugin (just for windows)
" cp vimtweak.dll $VIMRUNTIME
if WINDOWS()
  nnoremap <silent> <F12> :call libcallnr("vimtweak.dll", "SetAlpha", 240)<CR>
endif

" add syntax highlighting
augroup filetype
  " Lua
  au! BufNewFile,BufRead *.lua,*.lum   setf lua
  " Markdown
  au! BufNewFile,BufRead *.md,*.mkd,*.mkdn,*.mdwn,*.mdown,*.markdown   setf markdown
  " python
  if g:using_tab_indent
    au! FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
  endif
augroup end

" remember the location of last time shut off
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" automatically removing all trailing whitespace
autocmd! BufWritePre * :%s/\s\+$//e

" configure for file-headers
Import plugs-vimrc/evil-header.vim
