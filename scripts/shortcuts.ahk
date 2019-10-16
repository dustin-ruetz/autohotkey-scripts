/*
  - shortcuts to applications and workflows
  - key combo: Ctrl + Windows + [Key]
*/

/*
  OpenApp function
    - pass in an application name to open it (string, required)
    - pass in a command line parameter, ex: "--incognito", "C:\Users\", etc. (string, optional)
    - pass in a "true" to close the shim Command Prompt window (boolean, optional)
*/
OpenApp(Name, Parameter := "", HasShimWindow := false) {
  If !Parameter {
    Run, %Name%
  } Else {
    Run, %Name% %Parameter%
  }

  ; shim Command Prompt windows are created when opening applications installed via Scoop
  If HasShimWindow {
    ; wait 1000ms (i.e. 1s) to ensure that the shim command has time to execute
    Sleep, 1000

    ; close the shim Command Prompt window
    ; - adapted from post #5 by SKAN on the AutoHotkey forums
    ; - https://autohotkey.com/board/topic/32456-winclose-not-closing-cmd-for-some-reason/?p=206332
    WinWait, ahk_class ConsoleWindowClass
    PostMessage, 0x112, 0xF060, , , %USERPROFILE%\scoop\shims\%Name%
  }
}

OpenScoopApp(Directory, Executable, Parameter := "") {
  App = %UserProfile%\scoop\apps\%Directory%\current\%Executable%

  If !Parameter {
    Run, %App%
  } Else {
    Run, %App% %Parameter%
  }
}

/*
** letter keys **
*/

; description: Bitwarden
^#B::
  OpenScoopApp("bitwarden", "Bitwarden.exe")
  Return

; description: Calculator
^#C::
  OpenApp("calc.exe")
  Return

; description: Excel
^#E::
  OpenApp("EXCEL.EXE")
  Return

; description: FileZilla
^#F::
  OpenApp("filezilla.exe", , true)
  Return

; description: GIMP
^#G::
  OpenApp("gimp.exe", , true)
  Return

; description: KeePass
^#K::
  OpenApp("keepass.exe", , true)
  Return

; description: music (Google Play Music Desktop Player)
^#M::
  Run, C:\Users\dustin\AppData\Local\GPMDP_3\app-4.5.0\Google Play Music Desktop Player.exe
  Return

; description: Notepad
^#N::
  OpenApp("notepad.exe")
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

  ; open the project folder in Cmder and Visual Studio Code
  OpenApp("cmder.exe", "/start " SelectedFolder)
  OpenApp("code.cmd", SelectedFolder)

  Return

; description: Paint
^#P::
  OpenApp("mspaint.exe")
  Return

; description: reload main.ahk
; - refreshes all scripts\*ahk files
^#R::
  Run, %A_ScriptDir%\main.ahk
  Return

; description: Snipping Tool
^#S::
  OpenApp("SnippingTool.exe")
  Return

; description: Visual Studio Code
^#V::
  OpenApp("code.cmd")
  Return

; description: Word
^#W::
  OpenApp("WINWORD.EXE")
  Return

/*
** function keys **
*/

; description: Chrome
^#F1::
  OpenApp("chrome.exe", , true)
  Return
; description: Chrome (incognito)
^#F2::
  OpenApp("chrome.exe", "--incognito", true)
  Return

; description: Firefox
^#F3::
  OpenApp("firefox.exe", , true)
  Return
; description: Firefox (private)
^#F4::
  OpenApp("firefox.exe", "-private-window", true)
  Return

; description: Internet Explorer
^#F5::
  OpenApp("iexplore.exe")
  Return
; description: Internet Explorer (private)
^#F6::
  OpenApp("iexplore.exe", "-private")
  Return

; description: Cmder
^#F7::
  OpenApp("cmder.exe")
  Return
