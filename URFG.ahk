#MaxThreadsPerHotkey 2
Toggle := false


Numpad7::
Toggle := !Toggle

Loop {
    if (not Toggle) {
        Exit
    }
    SendInput w
    Sleep, 100
    SendInput q
    Sleep, 100
    SendInput e
    Sleep, 100
}

return