
(setf *time-modeline-string* "%a %d/%m/%y %H:%M:%S")
(setf *mode-line-timeout* 5)

(defparameter *battery-icons*
  (make-array 11
              :initial-contents
              '(#\󰂎 #\󰁺 #\󰁻 #\󰁼 #\󰁽 #\󰁾 #\󰁿 #\󰂀 #\󰂁 #\󰂂 #\󰁹)))

(defun battery ()
  (let*
      ((cap (parse-integer (uiop:read-file-string "/sys/class/power_supply/BAT0/capacity")))
       (stat (char (uiop:read-file-string "/sys/class/power_supply/BAT0/status") 0))
       (icon (aref *battery-icons* (floor (/ cap 10)))))
    (if (char-equal stat #\D)
        (format nil "~a ~a%" icon cap)
        (format nil "~a 󱐋 ~a%" icon cap))))

(setf *screen-mode-line-format*
      (list "[%n] %v ^>" '(:eval (battery)) " | %d"))

(enable-mode-line (current-screen) (current-head) t)
