/*
  - main.ahk uses #Include to map out all AHK files from scripts\
  - adapted from a post by Maestr0 on the AutoHotkey forums
  - https://autohotkey.com/board/topic/78798-include-all-files-in-a-folder
*/

#SingleInstance, Force

; relative path to scripts\ so that paths can be relative within include.ahk
#Include, %A_ScriptDir%\scripts\

; use *i to handle the file being non-existent
#Include, *i %A_ScriptDir%\include\include.ahk

; read the *old* include.ahk file and store its contents in IncludeOld
FileRead, IncludeOld, %A_ScriptDir%\include\include.ahk

; delete the include.ahk file
FileDelete, %A_ScriptDir%\include\include.ahk

/*
  - loop through all scripts\*.ahk files
  - for each file in the loop, add an #Include %FileName% line to include.ahk
*/
Loop, %A_ScriptDir%\scripts\*.ahk
  FileAppend, `n#Include %A_LoopFileName%, %A_ScriptDir%\include\include.ahk

; read the *new* include.ahk file and store its contents in IncludeNew
FileRead, IncludeNew, %A_ScriptDir%\include\include.ahk

/*
  - compare IncludeOld and IncludeNew
  - if they're not the same then this means a file was added or removed, so reload main.ahk
*/
If IncludeOld <> %IncludeNew%
  Reload
