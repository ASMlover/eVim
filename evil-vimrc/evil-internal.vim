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

" useful functions
silent func! DARWIN()
  return has("macunix")
endfunction

silent func! LINUX()
  return (has("unix") && !has("macunix") && !has("win32unix"))
endfunction

silent func! WINDOWS()
  return (has("win32") || has("win64"))
endfunction

silent func! RANDOM()
  if WINDOWS()
    return system("echo %RANDOM%")
  else
    return system("echo $RANDOM")
  endif
endfunction

silent func! SWITCH_COLOR()
  let colors_array = [
        \ ["molokai", 'light'],
        \ ["molokai", 'dark'],
        \ ["solarized", 'light'],
        \ ["solarized", 'dark'],
        \ ["apprentice", 'light'],
        \ ["apprentice", 'dark'],
        \ ["space-vim-dark", 'light'],
        \ ["space-vim-dark", 'dark'],
        \]
  let use_color = colors_array[RANDOM() % len(colors_array)]
  execute "colorscheme " . use_color[0]
  execute "set background=" . use_color[1]
endfunction
