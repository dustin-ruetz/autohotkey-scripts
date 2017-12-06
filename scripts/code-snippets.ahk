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

; description: arrow function
!#A::
    CopyPaste("js_function-arrow.js")
    Send, {Left}
    Return

; description: console.log
!#C::
    CopyPaste("js_consoleLog.js")
    Send, {Left}
    Send, {Left}
    Return

; description: DOMContentLoaded
!#D::
    CopyPaste("js_domContentLoaded.js")
    Return

; description: addEventListener
!#E::
    CopyPaste("js_addEventListener.js")
    Return

; description: function
!#F::
    CopyPaste("js_function.js")
    Send, {Left}
    Return

; description: document.querySelector
!#Q::
    CopyPaste("js_documentQuerySelector.js")
    Send, {Left}
    Send, {Left}
    Return

; description: timeout
!#T::
    CopyPaste("js_timeout.js")
    Return