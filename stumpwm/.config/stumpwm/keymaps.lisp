
;;; Change prefix to Super:
(run-shell-command "xmodmap -e 'clear mod4'" t)
(run-shell-command "xmodmap -e \'keycode 133 = F20\'" t)
(set-prefix-key (kbd "F20"))

;;; Top-level keymaps:
(define-key *top-map* (kbd "XF86MonBrightnessDown")
  "run-shell-command light -U 2")

(define-key *top-map* (kbd "XF86MonBrightnessUp")
  "run-shell-command light -A 2")

(define-key *top-map* (kbd "XF86AudioLowerVolume")
  "run-shell-command wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- --limit 1.0")

(define-key *top-map* (kbd "XF86AudioRaiseVolume")
  "run-shell-command wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ --limit 1.0")

(define-key *top-map* (kbd "XF86AudioMute")
  "run-shell-command pactl set-sink-mute @DEFAULT_SINK@ toggle")

(define-key *top-map* (kbd "XF86AudioMicMute")
  "run-shell-command pactl set-source-mute @DEFAULT_SOURCE@ toggle")

(define-key *top-map* (kbd "F2")
  "run-shell-command mpc toggle")

;;; Root-level keymaps:

;; Window:
(define-key *root-map* (kbd "RET") "pull-hidden-next")

;; Group:
(define-key *root-map* (kbd "1") "gselect 1")
(define-key *root-map* (kbd "2") "gselect 2")
(define-key *root-map* (kbd "3") "gselect 3")
(define-key *root-map* (kbd "4") "gselect 4")
(define-key *root-map* (kbd "5") "gselect 5")

;; Applications
(define-key *root-map* (kbd "t") "exec alacritty")
(define-key *root-map* (kbd "b") "exec zen-browser")

;; Misc:
(define-key *root-map* (kbd "e") "exec")
(define-key *root-map* (kbd "ESC") "abort")
(define-key *root-map* (kbd "B") "banish")
;(define-key *root-map* (kbd "x") "kill")
;(define-key *root-map* (kbd "X") "remove")
(define-key *root-map* (kbd "m") "mode-line")
