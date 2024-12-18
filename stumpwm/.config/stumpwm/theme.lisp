
;; Font config
(load-module "ttf-fonts")
(set-font (make-instance 'xft:font
           :family "FiraCode Nerd Font Propo"
           :subfamily "Bold"
           :size 9
           :antialias t))

;; Message and Input colors


;; Modeline colors
(setf *MODE-LINE-BACKGROUND-COLOR* "#000000")
(setf *MODE-LINE-FOREGROUND-COLOR* "#FF0000")
(setf *MODE-LINE-BORDER-COLOR* "#000000")
(setf *HIDDEN-WINDOW-COLOR* "^(:fg \"#808080\")")
