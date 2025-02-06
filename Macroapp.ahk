isMacroRunning := false
imagePath := A_ScriptDir . "\CoolImage.png"

Gui, +Resize +MinSize +MaxSize +OwnDialogs
Gui, Add, Text, x20 y20 w200 h30, Pizza Time
Gui, Add, Picture, x20 y60 w200 h100, %imagePath%
Gui, Add, Button, x20 y180 w200 h30 gRunMacro1, Type 'test' and Enter every 5 seconds (Ctrl+1)
Gui, Add, Button, x20 y220 w200 h30 gRunHelloWorld, Type 'Hello World' (Ctrl+2)
Gui, Add, Button, x20 y260 w200 h30 gRunSpamKeys, Spam 'a' key (Ctrl+3)
Gui, Add, Button, x20 y300 w200 h30 gRunSpamPizza, Spam 'Pizza' (Ctrl+4)
Gui, Add, Button, x20 y340 w200 h30 gRunSpamCheese, Spam 'Cheese' (Ctrl+5)
Gui, Add, Button, x20 y380 w200 h30 gRunSpamKeys2, Spam 'Enter' key (Ctrl+6)
Gui, Add, Button, x20 y420 w200 h30 gStopMacro, STOP THAT MACRO! (Esc)
Gui, Show, w250 h480, Macro Application
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

RunHelloWorld:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    Send, hello world
    Send, {Enter}
    isMacroRunning := false
    Gui, Show
Return

RunSpamPizza:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    Send, Pizza
    Send, {Enter}
    isMacroRunning := false
    Gui, Show
Return

RunSpamCheese:
    if (isMacroRunning)
    {
        MsgBox, A macro is already running! Stop it first.
        Return
    }
    isMacroRunning := true
    Gui, Hide
    Send, Cheese
    Send, {Enter}
    isMacroRunning := false
    Gui, Show
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
    MsgBox, The macro has been stopped!
    Gui, Show
Return

^1::GoSub, RunMacro1
^2::GoSub, RunHelloWorld
^3::GoSub, RunSpamKeys
^4::GoSub, RunSpamPizza
^5::GoSub, RunSpamCheese
^6::GoSub, RunSpamKeys2
Esc::GoSub, StopMacro

GuiClose:
    ExitApp
