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
    Run, %ProgramFiles%\GIMP 2\bin\gimp-2.8.exe
    Return

; description: KeePass
^#K::
    Run, %ProgramFiles% (x86)\KeePass Password Safe 2\KeePass.exe
    Return

RunMusic() {
    Run, C:\Users\dustin\AppData\Local\GPMDP_3\app-4.5.0\Google Play Music Desktop Player.exe
    Return
}
; description: music (Google Play Music Desktop Player)
^#M::
    RunMusic()
    Return

; description: Notepad
^#N::
    Run, notepad.exe
    Return

; description: open dev workflow (Cmder, MAMP, VS Code)
^#O::
    FileSelectFolder, SelectedFolder, D:\, 3, Select a folder to work on.

    ; if the select folder dialog is dismissed, end the function
    If ErrorLevel
        Return

    ; open the project folder in Cmder and Visual Studio Code
    RunCmder("", SelectedFolder)
    RunVSCode(SelectedFolder)

    ; if the project is a WordPress site, start MAMP
    wp := "wp"
    If InStr(SelectedFolder, wp)
        Run, C:\MAMP\MAMP.exe

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
    ; Run, %windir%\system32\SnippingTool.exe
    Run, SnippingTool.exe
    Return

RunVSCode(Directory:="") {
    Run, %ProgramFiles%\Microsoft VS Code\Code.exe %Directory%
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

RunCmder(Flag:="", Directory:="/START D:\dr_dev-web") {
    Run, C:\tools\cmder\cmder%Flag%.lnk %Directory%
    Return
}
; description: Cmder
^#F7::
    RunCmder()
    Return
; description: Cmder (admin)
^#F8::
    RunCmder("--admin")
    Return