#SingleInstance, Force
SendMode Input

Numpad9::
    Toggle := !Toggle
    if Toggle {
        Send {Click, L, D}
        BlockInput, On
    }
    else {
        Send {Click, L, U}
        BlockInput, Off
    }
