#MaxThreadsPerHotkey 2

Numpad7::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    Send {d Down}
    Send {Right Down}
    Sleep, 1
    Send {d Up}
    Send {Right Up}
    Sleep, 5
}
return

Numpad8::
Toggle1 := !Toggle1
Loop {
    if (not Toggle1){
        break
    }
    Send {Space Down}
    Sleep, 5000
    Send {Space Up}
    Sleep, 20
}
return

!k::
#InstallKeybdHook
KeyHistory
return

Numpad9::
Toggle2 := !Toggle2
Loop {
    if (not Toggle2){
        started := !started
        Send {d Up}
        Sleep, 1
        Send {Right Up}
        break
    }
    if (not started){
    Send {d Down}
    Sleep, 1
    Send {Right Down}
    started := !started
    }
}
return