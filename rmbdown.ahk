#SingleInstance, Force
SendMode Input

Numpad9::
    Toggle := !Toggle
    if Toggle {
        Send {Click, R, D}
        BlockInput, On
    }
    else {
        Send {Click, R, U}
        BlockInput, Off
    }
