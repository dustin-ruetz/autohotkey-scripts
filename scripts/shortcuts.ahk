/*
  - shortcuts to applications and workflows
  - key combo: Ctrl + Windows + [Key]
*/

; use OpenApp for built-in PATH-aware Windows applications
OpenApp(Name, Parameter := "") {
  If !Parameter {
    Run, %Name%.exe
  } Else {
    Run, %Name%.exe %Parameter%
  }
}

; use OpenScoopApp for Scoop-installed applications
OpenScoopApp(Name, Parameter := "") {
  StartMenuPath = %UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scoop Apps

  If !Parameter {
    Run, %StartMenuPath%\%Name%.lnk
  } Else {
    Run, %StartMenuPath%\%Name%.lnk %Parameter%
  }
}

; use OpenStoreApp for Microsoft Store-installed applications
OpenStoreApp(Name) {
  ClipboardBackup := Clipboard
  KeyWait, Ctrl
  Send, {LWin}
  Sleep, 250
  Clipboard = %Name%
  Send, ^v
  Sleep, 250
  Send, {Enter}
  Clipboard = %ClipboardBackup%
}

/*
** letter keys **
*/

; description: Bitwarden
^#B::
  OpenScoopApp("Bitwarden")
  Return

; description: Calculator
^#C::
  OpenApp("calc")
  Return

; description: Excel
^#E::
  OpenApp("EXCEL")
  Return

; description: FileZilla
^#F::
  OpenScoopApp("FileZilla")
  Return

; description: GIMP
^#G::
  OpenScoopApp("GIMP")
  Return

; description: music (Google Play Music Desktop Player)
^#M::
  Run, C:\Users\dustin\AppData\Local\GPMDP_3\app-4.5.0\Google Play Music Desktop Player.exe
  Return

; description: Notepad
^#N::
  OpenApp("notepad")
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
  OpenScoopApp("Cmder", "/start " SelectedFolder)
  OpenScoopApp("Visual Studio Code", SelectedFolder)

  Return

; description: Paint
^#P::
  OpenApp("mspaint")
  Return

; description: reload main.ahk
; - refreshes all scripts\*ahk files
^#R::
  Run, %A_ScriptDir%\main.ahk
  Return

; description: Snipping Tool
^#S::
  OpenApp("SnippingTool")
  Return

; description: Trello
^#T::
  OpenStoreApp("Trello")
  Return

; description: Visual Studio Code
^#V::
  OpenScoopApp("Visual Studio Code")
  Return

; description: Word
^#W::
  OpenApp("WINWORD")
  Return

/*
** function keys **
*/

; description: Chrome
^#F1::
  OpenScoopApp("Google Chrome")
  Return
; description: Chrome (incognito)
^#F2::
  OpenScoopApp("Google Chrome", "--incognito")
  Return

; description: Firefox
^#F3::
  OpenScoopApp("Mozilla Firefox")
  Return
; description: Firefox (private)
^#F4::
  OpenScoopApp("Mozilla Firefox", "-private-window")
  Return

; description: Internet Explorer
^#F5::
  OpenApp("iexplore")
  Return
; description: Internet Explorer (private)
^#F6::
  OpenApp("iexplore", "-private")
  Return

; description: Cmder
^#F7::
  OpenScoopApp("Cmder")
  Return

; cSpell:words FileZilla, GPMDP, iexplore, MAMP, mspaint, Trello, WINWORD
