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

if filereadable(expand("~/.vim/eVim/setup.vim"))
  source ~/.vim/eVim/setup.vim
endif

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set showcmd
if g:using_tab_indent
  set noexpandtab                                            " do not expand tab to space
  set tabstop=4                                              " actual tabs occupy 4 characters
  set shiftwidth=4                                           " normal mode indentation commands use 4 spaces
  set softtabstop=4                                          " insert mode tab and backspace use 4 spaces
else
  set expandtab                                              " expand tabs to space
  set tabstop=8                                              " actual tabs occupy 8 characters
  set shiftwidth=2                                           " normal mode indentation commands use 2 spaces
  set softtabstop=2                                          " insert mode tab and backspace use 2 spaces
endif
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set encoding=utf-8                                           " character encoding used in vim is utf-8
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
set autochdir                                                " auto change the current working directory while opening file
" set clipboard=unnamedplus                                    " allow access system clipboard
set listchars=tab:>-,trail:-                                 " show tab as '>---'
set t_Co=256                                                 " set number of colors
set background=dark                                          " set {color} for the background
set guifont=Consolas:h11
if WINDOWS()
  colorscheme solarized
  if has('gui_running')
    au GUIEnter * simalt ~x
  endif

  " fixed the utf-8 display error for windows
  " set fileencoding=chinese
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  language messages zh_CN.utf-8
else
  let g:solarized_termcolors=256
  " colorscheme molokai
  colorscheme solarized
endif

" keyboard shortcuts
let mapleader = ','
nnoremap <leader>= :Align
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
  nnoremap <silent> <F8> :SCCompileRun<CR>
  nnoremap <silent> <F9> :SCCompile<CR>
  if WINDOWS()
    " allow access system clipboard
    nnoremap <silent> <C-S-v> "*p
  endif
endif
" key-mapping for indentLine
nnoremap <silent> <leader>i :LeadingSpaceToggle<CR>
" key-mapping for showing tab
nnoremap <silent> <leader>, :set list!<CR>
" key-mapping for git command
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
" key-mapping for editing my vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
" key-mapping for reloading my vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

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
if filereadable(expand("~/.vim/eVim/bundles.vimrc/init.vim"))
  source ~/.vim/eVim/bundles.vimrc/init.vim
endif
" source local vimrc
if filereadable(expand("~/.vim/eVim/local/vimrc/init.vim"))
  source ~/.vim/eVim/local/vimrc/init.vim
endif
