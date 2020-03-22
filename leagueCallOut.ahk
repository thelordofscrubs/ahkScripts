#MaxThreadsPerHotkey 2
lane := 1
Numpad9::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    if (KeyIsDown := GetKeyState("LButton", "P")) {
        Send Bot with yo1324{Enter}
        Sleep, 100
    }
    Sleep, 10
}
return

!k::
#InstallKeybdHook
KeyHistory
return