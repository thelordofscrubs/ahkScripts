
Numpad0::
            InvRow := 0
            Send e
            Sleep, 100
            MouseMove, -(4*36), 18+InvRow*36, 0 , R
            Sleep, 20
            SendInput {LShift down}
            Loop, 8 {
                Sleep, 50
                Click
                Sleep, 50
                MouseMove, 36, 0, 0, R
                Sleep, 50
            }
            SendInput {LShift up}
            Send {Esc}
            Send 1
            HotbarCounter := 2
return

Numpad1::
    SendInput {w down}
    Sleep, 215
    SendInput {w up}
return

Numpad2::
    DllCall("mouse_event", "UInt", 0x01, "UInt", 50, "UInt", 0)    
return
;Loop, 1060 {
;DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 0)
;Sleep, 1
;}
Numpad3::

    Loop, 100 {
    DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 300)
    }

    Loop, 1060 {
    DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", -1)
    Sleep, 1
    }
return

Numpad4::
    Loop, 380 {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt",-1)
        Sleep, 1
    }
return

Numpad5::
Send {d down}
Sleep, 500
Send {e}
Sleep, 200
Send {Esc}
return