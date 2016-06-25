@echo off

REM Copyright (c) 2014 ASMlover. All rights reserved.
REM
REM Redistribution and use in source and binary forms, with or without
REM modification, are permitted provided that the following conditions
REM are met:
REM
REM  * Redistributions of source code must retain the above copyright
REM    notice, this list ofconditions and the following disclaimer.
REM
REM  * Redistributions in binary form must reproduce the above copyright
REM    notice, this list of conditions and the following disclaimer in
REM    the documentation and/or other materialsprovided with the
REM    distribution.
REM
REM THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
REM "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
REM LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
REM FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
REM COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
REM INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
REM BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
REM LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
REM CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
REM LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
REM ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
REM POSSIBILITY OF SUCH DAMAGE.

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_DIR=%cd%
if not exist "%APP_DIR%" @set APP_DIR=%HOME%\eVim
if not exist "%APP_DIR%" (
  echo cloning eVim ...
  call git clone https://github.com/ASMlover/eVim.git "%APP_DIR%"
) else (
  @set ORIGINAL_DIR=%cd%
  echo updating eVim ...
  chdir /d "%APP_DIR%"
  call git pull
  chdir /d "%ORIGINAL_DIR%"
  call cd "%APP_DIR%"
)

if not exist "%HOME%\.vim" (
  call mkdir "%HOME%\.vim"
)

if not exist "%HOME%\.vim\autoload%" (
  call mkdir "%HOME%\.vim\autoload"
)
call copy /Y plug-tools\plug.vim "%HOME%\.vim\autoload\"

REM copy configure of vim
call copy /Y vimrc "%HOME%\_vimrc"
if exist "%HOME%\.vim\evil-vimrc" (
  call rmdir /s /q "%HOME%\.vim\evil-vimrc"
)
xcopy /s /e /q /y .\evil-vimrc "%HOME%\.vim\evil-vimrc\"

REM copy useful command: ag.exe, ctags.exe and vimtweak.dll
call copy /y bin\ag.exe "%VIMRUNTIME%"
call copy /y bin\ctags.exe "%VIMRUNTIME%"
call copy /y bin\vimtweak.dll "%VIMRUNTIME%"

REM copy my customized syntax(lua, c, python)
if not exist "%HOME%\.vim\syntax" (
  call mkdir "%HOME%\.vim\syntax"
)
call copy /y syntax\* "%HOME%\.vim\syntax"

call gvim -u "%HOME%\.vim\evil-vimrc\evil-setup.vim" +PlugInstall +qall

echo installing eVim successfully ...
pause
@echo on
