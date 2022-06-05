#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Reference: https://www.autohotkey.com/docs/Tutorial.html

; -------------------- Quick Notes -------------------- 
; ^ - CTRL
; ! - ALT
; + - SHIFT
; # - WIN
; & - Combine two keys

; Use Window Spy addon app to get window information


; -------------------- KEY MAPS------------------------ 

; -----------------------------------------------------
; Vim-like navigation using CTRL + HJKL (Outisde of Ubuntu)
#IfWinNotActive Ubuntu 
  $!j::
    Sendplay, {Down}
  return

  $!k::
    Sendplay, {Up}
  return

  $!h::
    Send, {Left}
  return

  $!l::
    Send, {Right}
  return


#IfWinActive

; Jump to start of line
!Backspace::
  Send, {Home}
return

; Jump to end of line
!Space::
  Send, {End}
return

; Highlight right character-wise 
$!+l::
  Send, {Shift Down}{Right}
return

; Highlight right word-wise 
^$!+l::
  Send, {Shift Down}{Ctrl Down}{Right}
return

; Highlight left character-wise 
$!+h::
  Send, {Shift Down}{Left}
return

; Highlight left word-wise 
^$!+h::
  Send, {Shift Down}{Ctrl Down}{Left}
return

; Jump to next line with cursor anywhere
!Enter::
  Send, {End}{Enter}
return

; -----------------------------------------------------

; Easier vimming
Capslock::Esc

; -----------------------------------------------------
; Window navigation with CTRL + 1-0
; Make sure to move all windows to the bottom bar in the correct order
!1:: ; VPN
  Send, #1
return 

!2:: ; Screen Clipper
  Send, #2
return 

!3:: ; MS Teams
  Send, #3
return 

!4:: ; Outlook
  Send, #4
return 

!5:: ; OneNote
  Send, #5
return 

!6:: ; Windows Terminal
  Send, #6
return 

!7:: ; Work Browser
  Send, #7
return 

!8:: ; Personal Browser
  Send, #8
return 

!9:: ; VS Code 
  Send, #9
return 

!0:: ; Database  
  Send, #0
return 


; -----------------------------------------------------

; Xah Lee Workflow Challenge
F1::
  Send, {LWin Down}{Left}{LWin Up} ; Move window one monitor left 
  ; Requires "Move Windows Based on Relative Position" in Fancy Zones
return

F2::WinMinimize, A ; Minimize active window
; TODO: Try this out - Used to Remap F11 - Full Screen

F3::
  Send, {LWin Down}{Right}{LWin Up} ; Move window one monitor right
  ; Requires "Move Windows Based on Relative Position" in Fancy Zones
return

F4::!F4 ; Alt + F4 - Close window
F6::!Tab ; Alt + Tab - Switch window

; TODO: Map F7-F9

; F10 Voice Recognition
#IfWinActive ahk_exe OUTLOOK.EXE
  F10::!` ; Activate Outlook dictate
#IfWinActive

#IfWinActive ahk_exe msedge.exe
  F10::^+. ; Activate Edge google voice search
#IfWinActive 

#IfWinActive ahk_exe Explorer.EXE 
  F10::#^s ; Activate Windows Speech Recognition
#IfWinActive

F10::#h ; Activate Windows dictate 

F11::Media_Next  
F12::Media_Play_Pause  

; -----------------------------------------------------

