/*
  - methods for typing strings
  - key combo: Ctrl + Windows + [Key]
*/

/*
** number pad keys **
*/

^#Numpad0::
  Clipboard = Use Clipboard to copy+paste text (preferred method).
  Send, ^v
  Return

^#Numpad1::
  SendInput, {Raw}Use SendInput to type text.
  Return
