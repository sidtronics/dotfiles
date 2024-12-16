
;; Change prefix to Super:
(run-shell-command "xmodmap -e 'clear mod4'" t)
(run-shell-command "xmodmap -e \'keycode 133 = F20\'" t)
(set-prefix-key (kbd "F20"))

;; Top-level keymaps:
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
