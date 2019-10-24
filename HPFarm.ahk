#MaxThreadsPerHotkey 2
CoordMode, Mouse, Client
global boxSize := 36
global HotbarCounter := 1
global ItemCounter := 0
global InvRow := 0
global moveFor90 := 1060

bridge(dist) {
    Send {s down}
    Loop, %dist% {
        if (ItemCounter >= 64) {
            if (HotbarCounter >= 9) {
                Sleep, 50
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
                Send {z down}
                Send 1
                HotbarCounter := 1
                InvRow++
            }
            HotbarCounter++
            Send %HotbarCounter%
            ItemCounter := 0
        }
        Send {RButton}
        Sleep, 500
        }
    Send {s up}
    return
}

fillHotbar(a) {
    Sleep, 200
    Send {z up}
    Sleep, 200
    Send e
    Sleep, 200
    MouseMove, 816, 526+InvRow*36
    Sleep, 20
    SendInput {LShift down}
    Click
    Sleep, 50
    Loop, 7 {
        MouseMove, 36, 0, 0, R
        Sleep, 50
        Click
        Sleep, 50
    }
    SendInput {LShift up}
    Send {Esc}
    Sleep, 50
    Send 1
    HotbarCounter := 1
    InvRow++
    if (InvRow >= 4) {
        Exit
    }
    return true
}

checkItems(a) {
    if (ItemCounter >= 64) {
        isEmpty := false
        if (HotbarCounter >= 8) {
            isEmpty := true
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
    return isEmpty
}


Numpad4::
    Toggle := !Toggle
    needRefill := false
    if (Toggle) {
        Send {z down}
        Send {s down}
    }
    Loop {
        if (not Toggle) {
            Send {z up}
            Send {s up}
            break
        }
        Send {d down}
        Sleep, 200
        Loop, 159 {
            needRefill := checkItems(1)
            if (needRefill = true) {
                Send {d up}
                Send {s up}
                Sleep, 50
                Send {w down}
                Send {a down}
                Sleep, 400
                Send {w up}
                Send {a up}
                Sleep, 100
                hbfilled := fillHotbar(1)
                Sleep, 250
                Send {z down}
                Sleep, 200
                Send {z down}
                Send {d down}
                Send {s down}
                Sleep, 200
                needRefill := false
            }
            Sleep, 10
            ItemCounter++
            Sleep, 20
            Send {RButton}
            Sleep, 730
            if (not Toggle) {
                Send {z up}
                Send {s up}
                Send {d up}
                break
            }
        }
        if (not Toggle) {
            Send {z up}
            Send {s up}
            break
        }
        Loop, 100 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 300)
        }
        needRefill := checkItems(1)
        if (needRefill = true) {
            Send {d up}
            Send {s up}
            Sleep, 50
            Send {w down}
            Send {a down}
            Sleep, 400
            Send {w up}
            Send {a up}
            hbfilled := fillHotbar(1)
            Sleep, 250
            Send {z down}
            Sleep, 200
            Send {z down}
            Send {d down}
            Send {s down}
            Sleep, 200
            needRefill := false
        }
        ItemCounter++
        Sleep, 50
        Send {RButton down}
        Loop, 100 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt",-1)
            Sleep, 1
        }
        Send {RButton up}
        Loop, 280 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt",-1)
            Sleep, 1
        }
        Send {d up}
        Send {a down}
        Sleep, 200
        Loop, 159 {
            
            needRefill := checkItems(1)
            if (needRefill) {
                Send {a up}
                Send {s up}
                Sleep, 50
                Send {w down}
                Send {d down}
                Sleep, 400
                Send {w up}
                Send {d up}
                Sleep, 100
                hbfilled := fillHotbar(1)
                Sleep, 250
                Send {z down}
                Sleep, 200
                Send {z down}
                Send {a down}
                Send {s down}
                Sleep, 200
                needRefill := false
            }
            ItemCounter++
            Sleep, 20
            Send {RButton}
            Sleep, 730
            if (not Toggle) {
                Send {z up}
                Send {s up}
                Send {a up}
                break
            }
        }
        if (not Toggle) {
            Send {z up}
            Send {s up}
            break
        }
        Loop, 100 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 300)
        }
        needRefill := checkItems(1)
        if (needRefill) {
            Send {a up}
            Send {s up}
            Sleep, 50
            Send {w down}
            Send {d down}
            Sleep, 400
            Send {w up}
            Send {d up}
            hbfilled := fillHotbar(1)
            Sleep, 250
            Send {z down}
            Sleep, 200
            Send {z down}
            Send {a down}
            Send {s down}
            Sleep, 200
            needRefill := false
        }
        ItemCounter++
        Sleep, 50
        Send {RButton down}
        Loop, 100 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt",-1)
            Sleep, 1
        }
        Send {RButton up}
        Loop, 280 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt",-1)
            Sleep, 1
        }
        Send {a up}
    }
return

Numpad7::
    Toggle := !Toggle
    dir := True
    if (Toggle) {
    Send {z down}
    Loop, 100 {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 300)
    }
    Sleep, 250
    Loop, 80 {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", -1)
        Sleep, 1
    }
    }


    Loop {
        if (not Toggle){
            Send {z up}
            Send {s up}
            Send {RButton up}
            break
        }
    Send {s down}
    Sleep, 500
    Send {s up}
    Loop, %moveFor90% {
        DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 0)
        Sleep, 1
    }
    Send {s down}
    Sleep, 500
    Send {s up}
    Sleep, 50
    if (ItemCounter >= 64) {
        if (HotbarCounter >= 9) {
            Sleep, 50
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
            Send {z down}
            Send 1
            HotbarCounter := 1
            InvRow++
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
    Send {RButton}
    Sleep, 500
    Loop, %moveFor90% {
        DllCall("mouse_event", "UInt", 0x01, "UInt", -1, "UInt", 0)
        Sleep, 1
    }
    Sleep, 250
    Send {s down}
    Send {a down}
    Loop, 157 {
        if (ItemCounter >= 64) {
        if (HotbarCounter >= 9) {
            Sleep, 50
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
            Send {z down}
            Send 1
            HotbarCounter := 1
            InvRow++
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
        Send {RButton}
        Sleep, 500
        }
    Send {s up}
    Send {a up}


    Send {s down}
    Sleep, 500
    Send {s up}
    Loop, %moveFor90% {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 0)
        Sleep, 1
    }
    Send {s down}
    Sleep, 500
    Send {s up}
    Sleep, 50
    if (ItemCounter >= 64) {
        if (HotbarCounter >= 9) {
            Sleep, 50
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
            Send {z down}
            Send 1
            HotbarCounter := 1
            InvRow++
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
    Send {RButton}
    Sleep, 500
    Loop, %moveFor90% {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 1, "UInt", 0)
        Sleep, 1
    }
    Sleep, 250
    Send {s down}
    Send {a down}
    Loop, 157 {
        if (ItemCounter >= 64) {
        if (HotbarCounter >= 9) {
            Sleep, 50
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
            Send {z down}
            Send 1
            HotbarCounter := 1
            InvRow++
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
        Send {RButton}
        Sleep, 500
        }
    Send {s up}
    Send {a up}
    }


return

Numpad9::
    Toggle := !Toggle
    if (Toggle) {
    SendInput {z down}
    Send {d down}
    }
    Loop{
    if (not Toggle){
            Send {z up}
            Send {d up}
            break
        }
        Send {RButton}
        ItemCounter++
        Sleep, 50
        Loop, 20 {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 5)
        Sleep, 1
        }
        Send {RButton}
        ItemCounter++
        Sleep, 50
        Loop, 20 {
        DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", -5)
        Sleep, 1
        }
        Sleep, 200
        if (ItemCounter >= 64) {
        if (HotbarCounter >= 9) {
            Sleep, 50
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
            Send {z down}
            Send 1
            HotbarCounter := 1
            InvRow++
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
    }
return

Numpad8::
        Toggle := !Toggle
        if (Toggle) {
        SendInput {z down}
        Send {a down}
        }
        Loop{
        if (not Toggle){
                Send {z up}
                Send {a up}
                break
            }
            Send {RButton}
            ItemCounter++
            Sleep, 50
            Loop, 20 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 5)
            Sleep, 1
            }
            Send {RButton}
            ItemCounter++
            Sleep, 50
            Loop, 20 {
            DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", -5)
            Sleep, 1
            }
            Sleep, 200
            if (ItemCounter >= 64) {
        if (HotbarCounter >= 9) {
            Sleep, 50
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
            Send {z down}
            Send 1
            HotbarCounter := 1
            InvRow++
        }
        HotbarCounter++
        Send %HotbarCounter%
        ItemCounter := 0
    }
            
        }
return

;if (dist >= 158) {
;        if (direction == "d") {
;            direction := "a"
;        }
;        if (direction == "a") {
;            direction := "d"
;        }
;        
;    }