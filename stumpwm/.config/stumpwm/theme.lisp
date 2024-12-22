
;; Wallpaper
(run-shell-command "feh --bg-scale ~/Pictures/Walls/green-tiger.jpg")

;; Window colors
(set-focus-color "#00FF00")
(set-unfocus-color "#808080")
(set-float-focus-color "#00FF00")
(set-float-unfocus-color "#808080")

;; Message and Input colors
(set-fg-color "#00FF00")
(set-border-color "#00FF00")

;; Modeline colors
(setf *MODE-LINE-BACKGROUND-COLOR* "#000000")
(setf *MODE-LINE-FOREGROUND-COLOR* "#00FF00")
(setf *MODE-LINE-BORDER-COLOR* "#000000")
(setf *HIDDEN-WINDOW-COLOR* "^(:fg \"#808080\")")
