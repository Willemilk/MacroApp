isMacroRunning := false
imagePath := A_ScriptDir . "\CoolImage.png"

Gui, +Resize +MinSize +MaxSize +OwnDialogs
Gui, Add, Text, x20 y20 w200 h30, Pizza Time
Gui, Add, Picture, x20 y60 w200 h100, %imagePath%
Gui, Add, Button, x20 y180 w200 h30 gRunMacro1, Type 'test' and Enter every 5 seconds (Ctrl+1)
Gui, Add, Button, x20 y220 w200 h30 gRunSpamKeys, Spam 'a' key (Ctrl+2)
Gui, Add, Button, x20 y260 w200 h30 gRunSpamKeys2, Spam 'Enter' key (Ctrl+3)
Gui, Add, Button, x20 y300 w200 h30 gRunSpamWASD, Spam 'W A S D Space' (Ctrl+4)
Gui, Add, Button, x20 y340 w200 h30 gRunSpamSpace, Spam 'Space' key (Ctrl+5)
Gui, Add, Button, x20 y380 w200 h30 gStopMacro, STOP THAT MACRO! (Esc)
Gui, Show, w250 h440, Macro Application
Return

RunMacro1:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    SetTimer, TypeTest, 5000
    Return

TypeTest:
    Send, test
    Send, {Enter}
Return

RunSpamKeys:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    SetTimer, SpamAKey, 100
    Return

SpamAKey:
    Send, a
Return

RunSpamKeys2:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    SetTimer, SpamEnterKey, 100
    Return

SpamEnterKey:
    Send, {Enter}
Return

RunSpamWASD:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    SetTimer, SpamWASDKeys, 200
    Return

SpamWASDKeys:
    Send, {w down}
    Sleep, 200
    Send, {w up}
    Send, {a down}
    Sleep, 200
    Send, {a up}
    Send, {s down}
    Sleep, 200
    Send, {s up}
    Send, {d down}
    Sleep, 200
    Send, {d up}
    Send, {Space down}
    Sleep, 200
    Send, {Space up}
Return

RunSpamSpace:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    SetTimer, SpamSpaceKey, 100
    Return

SpamSpaceKey:
    Send, {Space}
Return

StopMacro:
    if (!isMacroRunning)
    {
        MsgBox, No macro is running.
        Return
    }
    isMacroRunning := false
    SetTimer, TypeTest, Off
    SetTimer, SpamAKey, Off
    SetTimer, SpamEnterKey, Off
    SetTimer, SpamWASDKeys, Off
    SetTimer, SpamSpaceKey, Off
    MsgBox, The macro has been stopped!
    Gui, Show
Return

^1::GoSub, RunMacro1
^2::GoSub, RunSpamKeys
^3::GoSub, RunSpamKeys2
^4::GoSub, RunSpamWASD
^5::GoSub, RunSpamSpace
Esc::GoSub, StopMacro

GuiClose:
    ExitApp
