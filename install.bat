@echo off

:: Copyright (c) 2014 ASMlover. All rights reserved.
::
:: Redistribution and use in source and binary forms, with or without
:: modification, are permitted provided that the following conditions
:: are met:
::
::  * Redistributions of source code must retain the above copyright
::    notice, this list ofconditions and the following disclaimer.
::
::  * Redistributions in binary form must reproduce the above copyright
::    notice, this list of conditions and the following disclaimer in
::    the documentation and/or other materialsprovided with the
::    distribution.
::
:: THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
:: "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
:: LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
:: FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
:: COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
:: INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
:: BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
:: LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
:: CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
:: LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
:: ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
:: POSSIBILITY OF SUCH DAMAGE.

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_DIR=%cd%
if not exist "%APP_DIR%\evil-vimrc" @set APP_DIR=%HOME%\eVim
if not exist "%APP_DIR%" (
  echo cloning eVim ...
  call git clone https://github.com/ASMlover/eVim.git "%APP_DIR%"
  chdir /d "%APP_DIR%"
) else (
  @set ORIGINAL_DIR=%cd%
  echo updating eVim ...
  chdir /d "%APP_DIR%"
  call git pull
  chdir /d "%ORIGINAL_DIR%"
  chdir /d "%APP_DIR%"
)

if not exist "%HOME%\.vim" (
  call mkdir "%HOME%\.vim"
)

:: copy
if not exist "%HOME%\.vim\autoload%" (
  call mkdir "%HOME%\.vim\autoload"
)
:: download vim-plug
if not exist "%APP_DIR%\vim-plug" (
  echo cloning vim-plug ...
  call git clone https://github.com/junegunn/vim-plug.git
) else (
  echo updating vim-plug ...
  chdir vim-plug
  call git pull
  chdir ..
)
call copy /Y vim-plug/plug.vim "%HOME%\.vim\autoload\"

:: copy configure of vim
call copy /Y vimrc "%HOME%\_vimrc"
if exist "%HOME%\.vim\evil-vimrc" (
  call rmdir /s /q "%HOME%\.vim\evil-vimrc"
)
xcopy /s /e /q /y .\evil-vimrc "%HOME%\.vim\evil-vimrc\"

:: copy useful command: ag.exe, ctags.exe and vimtweak.dll
call copy /y extras\bin\ag.exe "%VIMRUNTIME%"
call copy /y extras\bin\ctags.exe "%VIMRUNTIME%"
call copy /y extras\bin\vimtweak.dll "%VIMRUNTIME%"

:: copy my customized syntax(lua, c, python)
if not exist "%HOME%\.vim\syntax" (
  call mkdir "%HOME%\.vim\syntax"
)
call copy /y extras\syntax\* "%HOME%\.vim\syntax"

call gvim -u "%HOME%\.vim\evil-vimrc\evil-setup.vim" +PlugInstall +qall

echo installing eVim successfully ...
pause
@echo on
