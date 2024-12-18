
(setf *screen-mode-line-format*
  (list "[%n] ^>%d"))

(setf *time-modeline-string* "%a %d/%m/%y %H:%M:%S")
(setf *mode-line-timeout* 5)
(mode-line)
