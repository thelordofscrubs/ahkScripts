#MaxThreadsPerHotkey 2
#SingleInstance, Force
SendMode Input


Numpad9::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    Send {Click, L}
    Sleep, 2000
}
return

