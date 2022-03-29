#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Reference: https://www.autohotkey.com/docs/Tutorial.html

; ---------- Quick Notes ----------
; ^ - CTRL
; ! - ALT
; + - SHIFT
; # - WIN
; & - Combine two keys


; ---------- KEY MAPS ----------

; Use Window Spy addon app to get window information
; Vim-like navigation using CTRL + HJKL (Outisde of tmux)
#IfWinNotActive Ubuntu 
  $^j::
    Sendplay, {Down}
  return

  $^k::
    Sendplay, {Up}
  return

  $^h::
    Send, {Left}
  return

  $^l::
    Send, {Right}
  return


#IfWinActive

; Jump to start/end of line
^Backspace::
  Send, {Home}
return

^Space::
  Send, {End}
return

; Jump to next line with cursor anywhere
^Enter::
  Send, {End}{Enter}
return

; Select part of line forward/backward
$^+l::
  Send, {Shift Down}{Right}
return

$^+h::
  Send, {Shift Down}{Left}
return


; ---------- KEY REMAPS ----------
; Window navigation with CTRL + 1-0
; Make sure to move all windows to the bottom bar in the correct order
^1::#1 ; VPN
^2::#2 ; Screen Clipper
^3::#3 ; MS Teams
^4::#4 ; Outlook
^5::#5 ; OneNote
^6::#6 ; Windows Terminal
^7::#7 ; Work Browser
^8::#8 ; Personal Browser
^9::#9 ; File Explorer
^0::#0 ; Power BI

; Xah Lee Workflow Challenge
F1::#+Left ; Move window one monitor left
F2::F11 ; Remap F11 - Full Screen
F3::#+Right ; Move window one monitor right
F4::!F4 ; Alt + F4 - Close window
F6::!Tab ; Alt + Tab - Switch window

F11::Media_Play_Pause  
F12::Media_Next  
