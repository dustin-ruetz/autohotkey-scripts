/*
    - shortcuts to server files and commands
    - key combo: Ctrl + Windows + [Key]
    - note: "workingdir" is used to run the CMD scripts from their own directory
*/

/*
** number row keys **
*/

; description: open finances spreadsheet
^#`::
    Run, S:\Financial\2017-finances.xlsx
    Return

; description: wake server
^#1::
    Run, C:\_server\server-wake.lnk WorkingDir
    Return

; description: put server to sleep
^#2::
    Run, C:\_server\server-sleep.lnk WorkingDir
    Return