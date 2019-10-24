#MaxThreadsPerHotkey 2
y := 5
t := 30
x := 0
Numpad9::
CoordMode, Mouse, Screen
Toggle := !Toggle
Loop {
    if (not Toggle){
        break
    }
    if (KeyIsDown := GetKeyState("LButton", "P")){
        DllCall("mouse_event", "UInt", 0x01, "UInt", x, "UInt", y)
        Sleep, t
    }
    if (KeyIsDown := GetKeyState("NumpadAdd", "P")){
        if (y > 5) {
            y--
        } else if (t > 100) {
            y--
        } else {
            t+=2
        }
        Sleep, 20
    }
    if (KeyIsDown := GetKeyState("NumpadSub", "P")){
        if (y < 5) {
            y++
        } else if (t > 3){
            t-=2
        } else {
            y++
        }

        Sleep, 20
    }
;    if (KeyIsDown := GetKeyState("NumpadDiv", "P")){
;       x--
;       Sleep, 100
;    }
;    if (KeyIsDown := GetKeyState("NumpadMult", "P")){
;        x++
;        Sleep, 100
;    }
}
return

;NumpadSub::
;t-=2
;return

;NumpadAdd::
;t+=2
;        if (t > 100 and y = 5){
;            y := 2
;            t := 40
;        }
;return

NumpadDiv::
x--
return

NumpadMult::
x++
return

^Numpad1::
preset1 := {px: x, py: y, pt: t}
;MsgBox, % "preset1 is set with " . x . ", " . y . ", and " . t
return

^Numpad2::
preset2 := {px: x, py: y, pt: t}
return

^Numpad3::
preset3 := {px: x, py: y, pt: t}
return

^Numpad4::
preset4 := {px: x, py: y, pt: t}
return

!Numpad1::
;MsgBox, % "setting x equal to " . preset1["px"] . ", y equal to " . preset1["py"] . "and t equal to " . preset1["pt"]
x := preset1["px"]
y := preset1["py"]
t := preset1["pt"]
return

!Numpad2::
x := preset2["px"]
y := preset2["py"]
t := preset2["pt"]
return

!Numpad3::
x := preset3["px"]
y := preset3["py"]
t := preset3["pt"]
return

!Numpad4::
x := preset4["px"]
y := preset4["py"]
t := preset4["pt"]
return