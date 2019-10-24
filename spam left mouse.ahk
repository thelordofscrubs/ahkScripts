#MaxThreadsPerHotkey 2
Numpad1::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    if (KeyIsDown := GetKeyState("LShift", "P")){
        Click
        Sleep, 2
    }
}
return