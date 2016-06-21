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

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" bundles here are part of the core setup.
" DO NOT add bundles to this list, as they might get removed when you upgrade.
" please create ~/.vim/vimrc.bundles.local and add any extra bundles you want.

" the plugin manager for vim
Bundle 'gmarik/Vundle.vim'
" molokai color scheme for vim
Bundle 'ASMlover/molokai'
" solarized color scheme for vim
Bundle 'ASMlover/vim-colors-solarized'
" help folks to align text, etc
Bundle 'vim-scripts/Align'
" use ag(the_silver_searcher, better than ack, which is better than grep)
Bundle 'rking/ag.vim'
" a tree explorer plugin for vim
Bundle 'scrooloose/nerdtree'
" nerdtree and tabs together in vim
Bundle 'jistr/vim-nerdtree-tabs'
" a plugin that displays tags in a window
Bundle 'majutsushi/tagbar'
" display the indention levels with thin vertical lines
Bundle 'Yggdroot/indentLine'
" git commands in vim
Bundle 'tpope/vim-fugitive'
" rename the current file in the vim buffer and retain relative path
Bundle 'danro/rename.vim'
" smart status airline for vim
Bundle 'ASMlover/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
if g:using_matching_vimrc
  " a plugin marking it more convenient to compile or run a single source file
  Bundle 'xuhdev/SingleCompile'
  " next generation completion framework after neocomplcache
  Bundle 'Shougo/neocomplete.vim'
  " async clang code completion
  Bundle 'osyo-manga/vim-marching'
  " interactive command execution in vim
  Bundle 'Shougo/vimproc.vim'
endif
if g:plugin_ctrlp_enabled
  " full path fuzzy file, buffer, meu, tag... finder for vim
  Bundle 'kien/ctrlp.vim'
endif
if g:plugin_leaderf_enabled
  " quickly locate files, buffers, mrus in large project
  Bundle 'Yggdroot/LeaderF'
endif
if g:plugin_pyflakes_enabled
  " a plugin for checking Python code on the fly
  Bundle 'kevinw/pyflakes-vim'
endif
if g:plugin_syntastic_enabled
  " syntax checking hacks for vim
  Bundle 'scrooloose/syntastic'
endif
if g:plugin_jedi_enabled
  " jedi autocompletion
  Bundle 'davidhalter/jedi-vim'
endif
if g:plugin_ycm_enabled
  " a code-completion engine for vim
  Bundle 'Valloric/YouCompleteMe'
endif

" install local bundles configure if available
Import local/bundles.vim
