#MaxThreadsPerHotkey 2
lane := 1
Numpad9::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    if (KeyIsDown := GetKeyState("LButton", "P")) {
        Send Bot with Morg{Enter}
        Sleep, 100
    }
}
return