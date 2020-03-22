#MaxThreadsPerHotkey 2
CoordMode, Mouse, Client
Toggle := false
CancelCraft := false

;
;hold down right and forward while left clicking and moving the mouse slightly
;


Numpad9::
    Pressed := false
    Toggle := !Toggle
    Loop {
        if (not Toggle) {
            Send {w up}
            Send {LCtrl up}
            Send {LButton up}
            Send {d up}
            Exit
        }
        ;if (KeyIsDown := GetKeyState("LButton", "P")) {
            if (not Pressed) {
                Send {w down}
                Send {d down}
                Send {LButton down}
                Pressed := true
            }
            Sleep, 40
            Loop, 10 {
                DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 0)
                Sleep, 1
            }
            Sleep, 40
            Loop, 10 {
                DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 0)
                Sleep, 1
            }
        ;}
        ;if (not KeyIsDown := GetKeyState("LButton", "P")) {
        ;    if (Pressed) {
        ;        Send {w up}
        ;        Send {LButton up}
        ;        Send {d up}
        ;        Pressed := false
        ;    }
        ;}
    }
return

;
;Autocraft whole inventory into enchanteds except last 6 slots of hotbar
;Will make another one for string

Numpad8::
    Send 9
    Sleep, 100
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Send {RButton}
    Sleep, 300
    MouseMove, 960, 443 
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Sleep, 50
    Send {LButton}
    Sleep, 100
    Send {LShift down}
    MouseMove, 815, 524+60
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Sleep, 100
    Loop, 5 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    MouseMove, 1030, 410
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    MouseMove 815+36*5, 524+60
    Sleep, 50
    Loop, 4 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    MouseMove, 815, 524+36+60
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    ;second craft
    Sleep, 50
    MouseMove 1030, 410
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    MouseMove 815+36, 524+36+60
    Sleep, 50
    Loop, 5 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    MouseMove 1030, 410
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    Sleep, 50
    MouseMove 815+36*6, 524+36+60
    Sleep, 50
    Loop, 3 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    MouseMove 815, 524+36*2+60
    Loop, 2 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    Sleep, 50
    MouseMove 1030, 410
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    ;third craft
    MouseMove 815+36*2, 524+36*2+60
    Sleep, 50
    Loop, 5 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    Sleep, 50
    MouseMove 1030, 410
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    MouseMove 815+36*7, 524+36*2+60
    Sleep, 50
    Loop, 2 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    MouseMove 815, 524+36*3+10+60
    Sleep, 50
    Loop, 3 {
        if (CancelCraft) {
        CancelCraft := false
        Exit
    }
        Click
        MouseMove, 36, 0, 2, R
        Sleep, 100
    }
    MouseMove 1030, 410
    Sleep, 50
    if (CancelCraft) {
        CancelCraft := false
        Exit
    }
    Click
    Sleep, 50
    Send {LShift up}
    Send {Esc}
    ;if (CancelCraft) {
    ;    CancelCraft := false
    ;    Exit
    ;}
    ;Sleep, 100
    ;Send 9
    ;Sleep, 300
    ;Send {RButton}
    ;Sleep, 100
    ;MouseMove 1070, 410
    ;Sleep, 100
    ;if (CancelCraft) {
    ;    CancelCraft := false
    ;    Exit
    ;}
    ;Send {LButton}
    ;MouseMove 815, 524
    ;Sleep, 20
    ;Send {LShift down}
    ;Sleep, 200
    ;MouseMove, 36, 0, 2, R
    ;if (CancelCraft) {
    ;    CancelCraft := false
    ;    Exit
    ;}
    ;Sleep, 200
    ;Send +{Click}
   ; Sleep, 10
    ;Send {LShift up}
    ;Send {Esc}
return

;
;for enchanted books
;

Numpad1::
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
        Click
        Sleep, 150
}
return

Numpad7::
    CancelCraft := true
return