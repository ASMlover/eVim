" Copyright (c) 2014 ASMlover. All rights reserved.
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

" do not bother with vi compatibility
set nocompatible                                             " must be first line

" configure vim
silent func! OSX()
  return has("macunix")
endfunction
silent func! LINUX()
  return (has("unix") && !has("macunix") && !has("win32unix"))
endfunction
silent func! WINDOWS()
  return (has("win32") || has("win64"))
endfunction

if !WINDOWS()
  set shell=/bin/sh
endif

" on windows, we alse use '.vim' instead of 'vimfiles'; this make
" synchronization across (heterogeneous) system easier
if WINDOWS()
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME
endif

" read configure
if filereadable(expand("~/.vim/vimrc.conf"))
  source ~/.vim/vimrc.conf
endif

" install vundle bundles
if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
" enable syntax highlighting
syntax on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set showcmd
if g:using_tab_indent
  set noexpandtab
  set tabstop=4                                              " actual tabs occupy 8 characters
  set shiftwidth=4                                           " normal mode indentation commands use 4 spaces
  set softtabstop=4                                          " insert mode tab and backspace use 2 spaces
else
  set expandtab                                              " expand tabs to space
  set tabstop=8                                              " actual tabs occupy 8 characters
  set shiftwidth=2                                           " normal mode indentation commands use 4 spaces
  set softtabstop=2                                          " insert mode tab and backspace use 2 spaces
endif
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set fileencoding=utf-8                                       " default fileencoding is utf-8
set fileencodings=utf-8,ucs-bom,default,latin1
set fileformat=unix                                          " default fileformat is unix
set fileformats=unix,dos,mac
set nobackup                                                 " do not create backup file
set noundofile                                               " do not create undo file
set number                                                   " show line numbers
set ruler                                                    " show where you are
set laststatus=2                                             " always show statusline
set cursorline                                               " show cursor of current line
set autochdir
" set clipboard=unnamedplus                                    " allow access system clipboard
set listchars=tab:>-,trail:-                                 " show tab as '>---'

set t_Co=256
set background=dark
set guifont=Consolas:h11
if WINDOWS()
  colorscheme solarized
  au GUIEnter * simalt ~x
else
  let g:solarized_termcolors=256
  " colorscheme molokai
  colorscheme solarized
endif

" remember the location of last time shut off
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" keyboard shortcuts
let mapleader = ','
nnoremap <leader>l :Align
nnoremap <leader>a :Ag<space>
" opens a fresh NERD tree
nnoremap <silent> <leader>d :NERDTreeToggle<CR>
" jump to current file in the NERD tree
nnoremap <silent> <leader>j :NERDTreeFind<CR>
nnoremap <silent> <leader>] :TagbarToggle<CR>
if g:plugin_ctrlp_enabled
  nnoremap <silent> <leader>f :CtrlP<CR>
  nnoremap <silent> <leader>b :CtrlPBuffer<CR>
  nnoremap <silent> <leader>p :CtrlP<CR>
  nnoremap <silent> <leader>P :CtrlPClearCache<CR>:CtrlP<CR>
endif
if g:plugin_leaderf_enabled
  " `,f` launch LeaderF to search files
  " `,b` launch LeaderF to search buffers
  " `,p` the same as `,f`
  nnoremap <silent> <leader>p :Leaderf<CR>
endif
if g:using_matching_vimrc
  " key-mapping for SingleCompile(compile or run a single source file)
  nnoremap <silent> <F9> :SCCompile<CR>
  nnoremap <silent> <leader>r :SCCompileRun<CR>
  if WINDOWS()
    " allow access system clipboard
    nnoremap <silent> <C-S-v> "*p
  endif
endif
" key-mapping for indentLine
nnoremap <silent> <leader>i :LeadingSpaceToggle<CR>
" key-mapping for showing tab
nnoremap <silent> <leader>, :set list!<CR>

" configure for nerdtree-tabs
" let g:NERDTreeDirArrows=0 " diable this if not support NERDTreeDirArrows
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1

" configure for indentLine
let g:indentLine_enabled=0
let g:indentLine_char='.'
let g:indentLine_leadingSpaceChar='.'

" configure for spell bad colors
hi SpellBad ctermbg=52

" configure for bundles plugins
if filewritable(expand("~/.vim/bundles.vimrc/configure.vimrc"))
  source ~/.vim/bundles.vimrc/configure.vimrc
endif

" source local vimrc
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif
