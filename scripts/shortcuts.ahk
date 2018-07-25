/*
  - shortcuts to applications and workflows
  - key combo: Ctrl + Windows + [Key]
*/

/*
** letter keys **
*/

; description: Calculator
^#C::
  Run, calc.exe
  Return

; description: Excel
^#E::
  Run, EXCEL.EXE
  Return

; description: FileZilla
^#F::
  Run, filezilla.exe
  Return

; description: GIMP
^#G::
  Run, gimp.exe
  Return

; description: KeePass
^#K::
  Run, keepass.exe
  Return

; description: music (Google Play Music Desktop Player)
^#M::
  Run, C:\Users\dustin\AppData\Local\GPMDP_3\app-4.5.0\Google Play Music Desktop Player.exe
  Return

; description: Notepad
^#N::
  Run, notepad.exe
  Return

; description: open dev workflow (MAMP, Cmder, VS Code)
^#O::
  FileSelectFolder, SelectedFolder, D:\, 3, Select a project folder to open.

  ; if the FileSelectFolder dialog is dismissed, end the function
  If ErrorLevel
    Return

  ; the second parameter of MsgBox is Options; 68 is its summed value
    ; 4  = MsgBox with "Yes" and "No" buttons
    ; 64 = MsgBox with an "i" (info) icon
  MsgBox, 68, Open MAMP?, If this is a WordPress site, select "Yes" to open MAMP.
  IfMsgBox Yes
    Run, C:\MAMP\MAMP.exe

  ; open Cmder and open the project folder in Visual Studio Code
  RunCmder()
  RunVSCode(SelectedFolder)

  Return

; description: Paint
^#P::
  Run, mspaint.exe
  Return

; description: reload main.ahk
; - refreshes all scripts\*ahk files
^#R::
  Run, %A_ScriptDir%\main.ahk
  Return

; description: Snipping Tool
^#S::
  Run, SnippingTool.exe
  Return

RunVSCode(Directory:="") {
  Run, code.cmd %Directory%
  Return
}
; description: Visual Studio Code
^#V::
  RunVSCode()
  Return

; description: Word
^#W::
  Run, WINWORD.EXE
  Return

/*
** function keys **
*/

RunChrome(Flag:="") {
  Run, chrome.exe %Flag%
  Return
}
; description: Chrome
^#F1::
  RunChrome()
  Return
; description: Chrome (incognito)
^#F2::
  RunChrome("--incognito")
  Return

RunFirefox(Flag:="") {
  Run, firefox.exe %Flag%
  Return
}
; description: Firefox
^#F3::
  RunFirefox()
  Return
; description: Firefox (private)
^#F4::
  RunFirefox("-private-window")
  Return

RunIE(Flag:="") {
  Run, iexplore.exe %Flag%
  Return
}
; description: Internet Explorer
^#F5::
  RunIE()
  Return
; description: Internet Explorer (private)
^#F6::
  RunIE("-private")
  Return

RunCmder(Flag:="") {
  Run, cmder.exe
  Return
}
; description: Cmder
^#F7::
  RunCmder()
  Return
