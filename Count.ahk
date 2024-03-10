;Startup
#Persistent
#SingleInstance
;#NoTrayIcon
SetWinDelay, 10
Coordmode, ToolTip, Screen
Coordmode, Mouse, Screen
Coordmode, Pixel, Screen
SetWorkingDir %A_ScriptDir%

; ^+z::
; newline = ""
; l1 := 0
; l2 := 0
; Loop, 5
; {
; Send, ^+{Right}
; StringLen, l1, newline
; Send, ^c
; StringLen, l2, Clipboard
; StringTrimLeft, newword, Clipboard, l1
; StringReplace , newword, newword, %A_Space%,,All
; newline := Clipboard
; MsgBox Clipboard: %Clipboard% `nNew line: %newline% `nNew Word: %newword%.
; }
; return

; ^!z::
; newline = ""
; l1 := 0
; l2 := 0
; nwords := 0
; Loop,
; {
; Send, +{Right}
; StringLen, l1, newselection
; Send, ^c
; StringLen, l2, Clipboard
; StringTrimLeft, newletter, Clipboard, l1
; newselection := Clipboard
; if (newletter = " ")
; {
; nwords += 1
; }
; else
; {

; }
;MsgBox Clipboard: %Clipboard% `nNew selection: %newselection% `nNew letter: %newletter%. `nWords: %nwords%
; if (nwords >= 100)
; {
; break
; }
; }
; word := ". "
; var := newselection 
; StringReplace, var, var, %word%, %word%, UseErrorLevel
; sentences := ErrorLevel
; density := nwords / sentences
; MsgBox `nSelection: %newselection% `nWords: %nwords% `nSentences: %sentences% `nDensity: %density%
; return

#1::
clipboard =
Send, ^c
ClipWait, 1
newselection := Clipboard . " "
again:
word := ". "
var := newselection 
StringReplace, var, var, %word%, %word%, UseErrorLevel
sentences := ErrorLevel

word := "  "
var := newselection 
StringReplace, var, var, %word%, %word%, UseErrorLevel
doublespaces := ErrorLevel

word := " "
var := newselection 
StringReplace, var, var, %word%, %word%, UseErrorLevel
nwords := ErrorLevel - doublespaces




density := nwords / sentences

InputBox, newselection , , Selection:`n`n%newselection% `n`nWords: %nwords% `nSentences: %sentences% `nDensity: %density%, , 800 , 600 , , , , , %Clipboard%
newselection := newselection . " "
if ErrorLevel
    return
else
    goto again
return
return
