SendMode Input
SetWorkingDir, %A_ScriptDir%

global ranarrPos := 381
global ranarrPosy := 127
global ranarrColor := 0x254503

global vialPos := 426
global vialPosy := 130
global vialColor := 0x9A9EBC

global bankPos := 257
global bankPosy := 230
global bankClose := 491
global bankClosey := 51
global depInv :=450
global depInvy :=337

global comb1Pos := 626
global comb1Posy := 364

global comb2Pos := 665
global comb2Posy := 365

global comb3Pos := 261
global comb3Posy := 462

Numpad9::
    global startTime := A_Now
    WinActivate, RuneLite - herbEnthusia
    
    Loop {
        randomTimeSmall()
        shouldBreak := depWith()
        if shouldBreak {
            break
        }
        randomTime()
        combineUnf()
        Sleep, 10000
        randomTime()
        shouldBreak := checkTime()
        if shouldBreak {
            break
        }
    }

return

Numpad8::
    ;st := A_Now
    ;Random, sleepTime, 1000*3, 1000*10
    ;Sleep, sleepTime
    ;ct := A_Now
    ;EnvSub ct, st, S
    ;MsgBox envsub shows that %ct% seconds passed while it was actually %sleepTime%
    ;openBank()
    ;Sleep, 1000
    ;closeBank()
    ;MouseGetPos, MouseX, MouseY
    WinActivate, RuneLite - herbEnthusia
    PixelGetColor, pc, ranarrPos, ranarrPosy, RGB
    MsgBox the color is %pc%
    ;MouseMove, ranarrPos, ranarrPosy
    ;PixelGetColor, pc, vialPos, vialPosy, RGB
    ;if (pc = vialColor) {
    ;    MsgBox there are vials
    ;    return
    ;}
    ;MsgBox there are no vials
    ;if (pc = ranarrColor) {
    ;    MsgBox pc equyals ranarrColor
    ;}
return

openBank() {
    Random, rand, -30, 30
    MouseMove, bankPos+rand, bankPosy+rand
    Sleep, 400+rand
    Click
}

closeBank() {
    Random, rand, -5, 5
    MouseMove, bankClose+rand, bankClosey+rand
    Sleep, 400+rand
    Click
}

checkRanarr() {
    PixelGetColor, pc, ranarrPos, ranarrPosy, RGB
    if (pc = ranarrColor) {
        return True
    }
    return False

}

checkVials() {
    PixelGetColor, pc,  vialPos, vialPosy, RGB
    if (pc = vialColor) {
        return True
    }
    return False
}

combineUnf() {
    MouseMove, comb1Pos, comb1Posy
    randomTimeSmall()
    randomMouse()
    randomTimeSmall()
    Click
    randomTimeSmall()
    MouseMove, comb2Pos, comb2Posy
    randomTimeSmall()
    randomMouse()
    randomTimeSmall()
    Click
    randomTime()
    MouseMove, comb3Pos, comb3Posy
    randomTimeSmall()
    randomMouse()
    randomTimeSmall()
    Click
    randomTimeSmall()
}

randomTime() {
    Random, rand, -100, 100
    Sleep, 1700+rand
}

randomTimeBig() {
    Random, rand, -100, 100
    Sleep, 2000+rand
}

randomTimeSmall() {
    Random, rand, -100, 100
    Sleep, 1400+rand
}

randomMouse() {
    Random, rand, -5, 5
    MouseMove, rand, rand, 1, R
}

checkTime() {
    curTime = A_Now
    EnvSub, curTime, startTime, M
    if (curTime > 240) {
        return True
    }
    return False
}

depWith() {
    openBank()
    MouseMove, depInv, depInvy
    randomMouse()
    randomTime()
    Click
    if (!checkRanarr()) {
        return True
    }
    randomTime()
    MouseMove, ranarrPos, ranarrPosy
    randomMouse()
    randomTime()
    Click
    if (!checkVials()) {
        return True
    }
    randomTime()
    MouseMove, vialPos, vialPosy
    randomMouse()
    randomTime()
    Click
    randomTime()
    closeBank()
    return False
}
