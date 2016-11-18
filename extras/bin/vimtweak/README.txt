VimTweak
                                     Yasuhiro Matsumoto <mattn@mail.goo.ne.jp>

* What is this
  This is a tweaking dll for GVim.

* Install
  copy vimtweak.dll to same directory with gvim.exe

* Usage
  Alpha Window:
    200/255 alpha
    :call libcallnr("vimtweak.dll", "SetAlpha", 200)
    reset alpha
    :call libcallnr("vimtweak.dll", "SetAlpha", 255)

  Maximized Window:
    Enable
    :call libcallnr("vimtweak.dll", "EnableMaximize", 1)
    Disable
    :call libcallnr("vimtweak.dll", "EnableMaximize", 0)

  TopMost Window:
    Enable
    :call libcallnr("vimtweak.dll", "EnableTopMost", 1)
    Disable
    :call libcallnr("vimtweak.dll", "EnableTopMost", 0)

* Attention
    In x86 platform use 'vimtweak.dll' directly, in x64 platform, please
    rebuild it(Use VS2015 x64 Command).
    \> cl -LD vimtweak.c user32.lib
