#!/usr/bin/env bash
#
# Copyright (c) 2014 ASMlover. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list ofconditions and the following disclaimer.
#
#  * Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materialsprovided with the
#    distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

app_name='eVim'
app_dir=$(cd `dirname $0`; pwd)
app_url='https://github.com/ASMlover/eVim.git'
vundle_url='https://github.com/gmarik/Vundle.vim.git'

upgrade_repo() {
  echo "updating $1 ..."
  if [ $1 = $app_name ]; then
    cd $app_dir &&
      git pull
  fi

  if [ $1 = "Vundle" ]; then
    cd $HOME/.vim/bundle/Vundle.vim &&
      git pull
  fi
}

clone_repo() {
  echo "cloning eVim ..."
  if [ ! -e $app_dir ]; then
    git clone $app_url $app_dir
  else
    upgrade_repo $app_name "successfully updated $app_name"
  fi
}

clone_vundle() {
  echo "cloning Vundle.vim ..."
  if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    git clone $vundle_url $HOME/.vim/bundle/Vundle.vim
  else
    upgrade_repo "Vundle" "successfully updated Vundle"
  fi
}

create_vimrc() {
  echo "creating configure for vim ..."
  if [ ! -d $HOME/.vim ]; then
    mkdir -p $HOME/.vim
  fi
  if [ ! -d $HOME/.vim/bundle ]; then
    mkdir -p $HOME/.vim/bundle
  fi

  cp $app_dir/vimrc $HOME/.vimrc 
  cp $app_dir/vimrc.bundles $HOME/.vim/
  cp $app_dir/vimrc.bundles.local $HOME/.vim/ 
  cp $app_dir/vimrc.local $HOME/.vim/ 
  cp -R $app_dir/bundles.vimrc $HOME/.vim/ 
  cp -R $app_dir/syntax $HOME/.vim/
}

setup_vundle() {
  echo "setting vundles for vim ..."
  vim -u $HOME/.vim/vimrc.bundles +PluginInstall +qall
}

do_install() {
  clone_repo    "successfully cloned" $app_name
  create_vimrc  "setting up vimrc"
  clone_vundle  "successfully cloned Vundle"
  setup_vundle  "now updating/installing plugins using Vundle"
  echo 'installing eVim successfully ...'
}

do_uninstall() {
  echo "starting uninstall eVim ..."
  rm -rf $HOME/.vim
  rm -rf $HOME/.vimrc
  echo "uninstall successfully ..."
}

case "$1" in
  'install')
    do_install
    ;;
  'uninstall')
    do_uninstall
    ;;
  *)
    echo "USAGE: $0 {install|uninstall}"
    exit 3
    ;;
esac

exit 0
