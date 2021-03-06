/*
  - shortcuts to copy+paste code snippets
  - key combo: Alt + Windows + [Key]
*/

/*
  CopyPaste function
    - pass in a file to read its contents
    - set ClipboardBackup to the clipboard's current contents
    - copy the file's contents to the clipboard
    - paste the file's contents in the active window
    - set the clipboard to ClipboardBackup
*/
CopyPaste(FileName) {
  static CSPath := "D:\dr_dev-web\code-snippets\"
  ClipboardBackup := Clipboard
  FileRead, Clipboard, %CSPath%%FileName%
  Send, ^v
  Clipboard = %ClipboardBackup%
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
