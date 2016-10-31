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

" configure for powerline
let g:airline_powerline_fonts=1
if g:airline_powerline_fonts
  if WINDOWS()
    let g:Powerline_symbols='fancy'
    set guifont=Consolas\ for\ Powerline\ FixedD:h11
    if !exists('g:airline_symbols')
      let g:airline_symbols={}
    endif
    let g:airline_symbols.branch="\u2b60"
    let g:airline_symbols.readonly="\u2b64"
    let g:airline_symbols.linenr="\u2b61"
    let g:airline_symbols.maxlinenr='Ξ'
    let g:airline_left_sep="\u2b80"
    let g:airline_left_alt_sep="\u2b81"
    let g:airline_right_sep="\u2b82"
    let g:airline_right_alt_sep="\u2b83"
    let g:airline#extensions#tabline#left_sep="\u2b80"
    let g:airline#extensions#tabline#left_alt_sep="\u2b81"
  elseif DARWIN()
    " just for MacVim
    if has('gui_running')
      set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    endif
  elseif LINUX()
    if !has('gui_running')
      let g:Powerline_symbols='fancy'
      set guifont=PowerlineSymbols\ for\ Powerline
      if !exists('g:airline_symbols')
        let g:airline_symbols={}
      endif
      let g:airline_symbols.maxlinenr='Ξ'
    endif
  endif
endif
let g:airline_theme='xtermlight'
let g:airline_section_y=airline#section#create(['ffenc', '[BN:%{bufnr("%")}]'])
let g:airline_extensions=['branch', 'tabline']
let g:airline#extensions#branch#format='CustomBranchName'
func! CustomBranchName(name)
  return '('. a:name . ')'
endfunction
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#buffer_idx_mode=1
nmap <silent> <leader>1 <Plug>AirlineSelectTab1
nmap <silent> <leader>2 <Plug>AirlineSelectTab2
nmap <silent> <leader>3 <Plug>AirlineSelectTab3
nmap <silent> <leader>4 <Plug>AirlineSelectTab4
nmap <silent> <leader>5 <Plug>AirlineSelectTab5
nmap <silent> <leader>6 <Plug>AirlineSelectTab6
nmap <silent> <leader>7 <Plug>AirlineSelectTab7
nmap <silent> <leader>8 <Plug>AirlineSelectTab8
nmap <silent> <leader>9 <Plug>AirlineSelectTab9
nmap <silent> <leader>+ <Plug>AirlineSelectNextTab
nmap <silent> <leader>- <Plug>AirlineSelectPrevTab
