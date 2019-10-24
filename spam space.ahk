#MaxThreadsPerHotkey 2
Numpad1::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    if (KeyIsDown := GetKeyState("v", "P")){
        Send, {Space down}
        Sleep, 10
        Send, {Space up}
    }
}
return