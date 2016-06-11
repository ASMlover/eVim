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

func! s:AddFileHeader4C()
  call append(0, "/*")
  call append(1, " * Copyright (c) ".strftime("%Y")." ".g:company_name.". All rights reserved.")
  call append(2, " *")
  call append(3, " * Redistribution and use in source and binary forms, with or without")
  call append(4, " * modification, are permitted provided that the following conditions")
  call append(5, " * are met:")
  call append(6, " *")
  call append(7, " *  * Redistributions of source code must retain the above copyright")
  call append(8, " *    notice, this list ofconditions and the following disclaimer.")
  call append(9, " *")
  call append(10," *  * Redistributions in binary form must reproduce the above copyright")
  call append(11," *    notice, this list of conditions and the following disclaimer in")
  call append(12," *    the documentation and/or other materialsprovided with the")
  call append(13," *    distribution.")
  call append(14," *")
  call append(15," * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS")
  call append(16," * \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT")
  call append(17," * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS")
  call append(18," * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE")
  call append(19," * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,")
  call append(20," * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,")
  call append(21," * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;")
  call append(22," * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER")
  call append(23," * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT")
  call append(24," * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN")
  call append(25," * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE")
  call append(26," * POSSIBILITY OF SUCH DAMAGE.")
  call append(27," */")
  echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

func! s:AddFileHeader4CPP()
  call append(0, "// Copyright (c) ".strftime("%Y")." ".g:company_name.". All rights reserved.")
  call append(1, "//")
  call append(2, "// Redistribution and use in source and binary forms, with or without")
  call append(3, "// modification, are permitted provided that the following conditions")
  call append(4, "// are met:")
  call append(5, "//")
  call append(6, "//  * Redistributions of source code must retain the above copyright")
  call append(7, "//    notice, this list ofconditions and the following disclaimer.")
  call append(8, "//")
  call append(9, "//  * Redistributions in binary form must reproduce the above copyright")
  call append(10,"//    notice, this list of conditions and the following disclaimer in")
  call append(11,"//    the documentation and/or other materialsprovided with the")
  call append(12,"//    distribution.")
  call append(13,"//")
  call append(14,"// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS")
  call append(15,"// \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT")
  call append(16,"// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS")
  call append(17,"// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE")
  call append(18,"// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,")
  call append(19,"// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,")
  call append(20,"// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;")
  call append(21,"// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER")
  call append(22,"// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT")
  call append(23,"// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN")
  call append(24,"// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE")
  call append(25,"// POSSIBILITY OF SUCH DAMAGE.")
  echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

func! s:AddFileHeader4Script()
  call append(0, "# Copyright (c) ".strftime("%Y")." ".g:company_name.". All rights reserved.")
  call append(1, "#")
  call append(2, "# Redistribution and use in source and binary forms, with or without")
  call append(3, "# modification, are permitted provided that the following conditions")
  call append(4, "# are met:")
  call append(5, "#")
  call append(6, "#  * Redistributions of source code must retain the above copyright")
  call append(7, "#    notice, this list ofconditions and the following disclaimer.")
  call append(8, "#")
  call append(9, "#  * Redistributions in binary form must reproduce the above copyright")
  call append(10,"#    notice, this list of conditions and the following disclaimer in")
  call append(11,"#    the documentation and/or other materialsprovided with the")
  call append(12,"#    distribution.")
  call append(13,"#")
  call append(14,"# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS")
  call append(15,"# \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT")
  call append(16,"# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS")
  call append(17,"# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE")
  call append(18,"# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,")
  call append(19,"# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,")
  call append(20,"# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;")
  call append(21,"# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER")
  call append(22,"# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT")
  call append(23,"# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN")
  call append(24,"# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE")
  call append(25,"# POSSIBILITY OF SUCH DAMAGE.")
  echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

func! s:AddFileHeader4Python()
  call append(0, "#!/usr/bin/env python")
  call append(1, "# -*- coding: UTF-8 -*-")
  call append(2, "#")
  call append(3, "# Copyright (c) ".strftime("%Y")." ".g:company_name.". All rights reserved.")
  call append(4, "#")
  call append(5, "# Redistribution and use in source and binary forms, with or without")
  call append(6, "# modification, are permitted provided that the following conditions")
  call append(7, "# are met:")
  call append(8, "#")
  call append(9, "#  * Redistributions of source code must retain the above copyright")
  call append(10,"#    notice, this list ofconditions and the following disclaimer.")
  call append(11,"#")
  call append(12,"#  * Redistributions in binary form must reproduce the above copyright")
  call append(13,"#    notice, this list of conditions and the following disclaimer in")
  call append(14,"#    the documentation and/or other materialsprovided with the")
  call append(15,"#    distribution.")
  call append(16,"#")
  call append(17,"# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS")
  call append(18,"# \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT")
  call append(19,"# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS")
  call append(20,"# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE")
  call append(21,"# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,")
  call append(22,"# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,")
  call append(23,"# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;")
  call append(24,"# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER")
  call append(25,"# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT")
  call append(26,"# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN")
  call append(27,"# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE")
  call append(28,"# POSSIBILITY OF SUCH DAMAGE.")
  echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

func! s:AddFileHeader4Shell()
  call append(0, "#!/usr/bin/env bash")
  call append(1, "#")
  call append(2, "# Copyright (c) ".strftime("%Y")." ".g:company_name.". All rights reserved.")
  call append(3, "#")
  call append(4, "# Redistribution and use in source and binary forms, with or without")
  call append(5, "# modification, are permitted provided that the following conditions")
  call append(6, "# are met:")
  call append(7, "#")
  call append(8, "#  * Redistributions of source code must retain the above copyright")
  call append(9, "#    notice, this list ofconditions and the following disclaimer.")
  call append(10,"#")
  call append(11,"#  * Redistributions in binary form must reproduce the above copyright")
  call append(12,"#    notice, this list of conditions and the following disclaimer in")
  call append(13,"#    the documentation and/or other materialsprovided with the")
  call append(14,"#    distribution.")
  call append(15,"#")
  call append(16,"# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS")
  call append(17,"# \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT")
  call append(18,"# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS")
  call append(19,"# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE")
  call append(20,"# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,")
  call append(21,"# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,")
  call append(22,"# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;")
  call append(23,"# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER")
  call append(24,"# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT")
  call append(25,"# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN")
  call append(26,"# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE")
  call append(27,"# POSSIBILITY OF SUCH DAMAGE.")
  echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

" Updated modified filename and time
func! s:UpdateTitle()
  normal m'
  execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
  normal ''
  normal mk
  execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
  execute "noh"
  normal 'k
  echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

" 0: default/C
" 1: cpp
" 2: Script
func! TitleDescription(type)
  let n=1
  while n < 10
    let line = getline(n)
      if line =~ '^\#\s*\S*Copyright:\S*.*$'
        call s:UpdateTitle()
        return
      endif
      let n = n + 1
  endwhile

  if a:type == 0
    call s:AddFileHeader4C()
  elseif a:type == 1
    call s:AddFileHeader4CPP()
  elseif a:type == 2
    call s:AddFileHeader4Script()
  else
    call s:AddFileHeader4C()
  endif
endfunction

" add file header
nnoremap <silent> <F3> :call TitleDescription(2)<CR>'s
nnoremap <silent> <F4> :call TitleDescription(0)<CR>'s
nnoremap <silent> <F5> :call TitleDescription(1)<CR>'s

autocmd! BufNewFile *.c call s:AddFileHeader4C()
autocmd! BufNewFile *.cpp,*.cc,*.cxx,*.hpp call s:AddFileHeader4CPP()
autocmd! BufNewFile *.mk,Makefile call s:AddFileHeader4Script()
autocmd! BufNewFile *.py call s:AddFileHeader4Python()
autocmd! BufNewFile *.sh call s:AddFileHeader4Shell()
