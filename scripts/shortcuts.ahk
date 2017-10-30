/*
    - shortcuts to applications and workflows
    - key combo: Ctrl + Windows + [Key]
*/

/*
** letter keys **
*/

^#C::
    Run, calc.exe
    Return

^#E::
    Run, EXCEL.EXE
    Return

^#G::
    Run, %ProgramFiles%\GIMP 2\bin\gimp-2.8.exe
    Return

^#K::
    Run, %ProgramFiles% (x86)\KeePass Password Safe 2\KeePass.exe
    Return

RunMAMP() {
    Run, C:\MAMP\MAMP.exe
    Return
}

^#N::
    Run, notepad.exe
    Return

; web project workflow
^#P::
    InputBox, Site, Open a site, Enter the directory of the site you want to work on., , 350, 125,
    , , , , D:\dr_dev-web\

    ; open the site's directory in Cmder and Visual Studio Code
    RunCmder("", Site)
    RunVSCode(Site)

    ; if the site is a WordPress site, start MAMP
    WordPress := "wp"
    If InStr(Site, WordPress)
        RunMAMP()

    Return

; reload main.ahk script
; - refreshes all scripts\*ahk files
^#R::
    Run, %A_ScriptDir%\main.ahk
    Return

^#S::
    ; Run, %windir%\system32\SnippingTool.exe
    Run, SnippingTool.exe
    Return

RunVSCode(Directory:="") {
    Run, %ProgramFiles%\Microsoft VS Code\Code.exe %Directory%
    Return
}
^#V::
    RunVSCode()
    Return

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
^#F1::
    RunChrome()
    Return
^#F2::
    RunChrome("--incognito")
    Return

RunFirefox(Flag:="") {
    Run, firefox.exe %Flag%
    Return
}
^#F3::
    RunFirefox()
    Return
^#F4::
    RunFirefox("-private-window")
    Return

RunIE(Flag:="") {
    Run, iexplore.exe %Flag%
    Return
}
^#F5::
    RunIE()
    Return
^#F6::
    RunIE("-private")
    Return

RunCmder(Flag:="", Directory:="/START D:\dr_dev-web") {
    Run, C:\tools\cmder\cmder%Flag%.lnk %Directory%
    ; wait indefinitely for the Cmder window to load, then force it right using Windows + RightArrow
    WinWait, Cmder
    Send, #{Right}
    Return
}
^#F7::
    RunCmder()
    Return
^#F8::
    RunCmder("--admin")
    Return