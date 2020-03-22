#SingleInstance, Force
SendMode Input

Numpad9::
    Toggle := !Toggle
    if Toggle {
        Send {Click, R, D}
    }
    else {
        Send {Click, R, U}
    }
