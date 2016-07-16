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
plug_url='https://github.com/junegunn/vim-plug.git'

upgrade_repo() {
  echo "updating $1 ..."
  if [ $1 = $app_name ]; then
    cd $app_dir &&
      git pull
  fi
}

clone_repo() {
  echo "cloning eVim ..."
  if [ ! -e $app_dir/evil-vimrc ]; then
    app_dir=$HOME/$app_name
    git clone $app_url $app_dir
    cd $app_dir
  else
    upgrade_repo $app_name "successfully updated $app_name"
  fi
}

install_vim_plug() {
  echo "install vim-plug ..."
  if [ ! -d $app_dir/vim-plug ]; then
    echo "cloning vim-plug ..."
    git clone $plug_url
  else
    echo "upgrading vim-plug ..."
    cd vim-plug && git pull && cd -
  fi
  cp $app_dir/vim-plug/plug.vim $HOME/.vim/autoload
}

create_vimrc() {
  echo "creating configure for vim ..."
  if [ ! -d $HOME/.vim ]; then
    mkdir -p $HOME/.vim
  fi
  if [ ! -d $HOME/.vim/autoload ]; then
    mkdir -p $HOME/.vim/autoload
  fi

  install_vim_plug "successfully install vim-plug ..."

  cp $app_dir/vimrc $HOME/.vimrc
  if [ -d $HOME/.vim/evil-vimrc ]; then
    rm -rf $HOME/.vim/evil-vimrc
  fi
  cp -R $app_dir/evil-vimrc $HOME/.vim
  cp -R $app_dir/extras/syntax $HOME/.vim/
}

setup_plugins() {
  echo "setting vim-plug for vim ..."
  vim -u $HOME/.vim/evil-vimrc/evil-install.vim +PlugInstall +qall
}

do_install() {
  clone_repo    "successfully cloned" $app_name
  create_vimrc  "setting up vimrc"
  setup_plugins "now updating/installing plugins using vim-plug"
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
