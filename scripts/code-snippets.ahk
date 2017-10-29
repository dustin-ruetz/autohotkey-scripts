/*
    - shortcuts to copy+paste code snippets
    - key combo: Alt + Windows + [Key]
*/

/*
    CopyPaste function
    - pass in a file to read its contents
    - copy contents to the clipboard
    - paste contents in active window
*/
CopyPaste(FileName) {
    static CSPath := "D:\dr_dev-web\code-snippets\"
    FileRead, Clipboard, %CSPath%%FileName%
    Send, ^v
}

/*
** letter keys **
*/

!#A::
    CopyPaste("js_function-arrow.js")
    Return

!#C::
    CopyPaste("js_consoleLog.js")
    Return

!#D::
    CopyPaste("js_domContentLoaded.js")
    Return

!#E::
    CopyPaste("js_addEventListener.js")
    Return

!#F::
    CopyPaste("js_function.js")
    Return

!#Q::
    CopyPaste("js_documentQuerySelector.js")
    Return

!#T::
    CopyPaste("js_timeout.js")
    Return