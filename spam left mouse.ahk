#MaxThreadsPerHotkey 2
Numpad1::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
        Click
        Sleep, 20
}
return