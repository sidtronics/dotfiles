
; Font
(load-module "ttf-fonts")
(set-font (make-instance 'xft:font
           :family "FiraCode Nerd Font Propo"
           :subfamily "Bold"
           :size 11
           :antialias t))

;; Gravity
(setf *input-window-gravity* :center)
(setf *message-window-gravity* :center)
(setf *message-window-input-gravity* :top)

;; Borders
(setf *normal-border-width* 2)
(setf *maxsize-border-width* 2)
(setf *mode-line-border-width* 2)
(set-msg-border-width 2)

;; Window format
(setf *window-format* "%s%n:%4c%m")

;; Show atmost 5 completion candidates
(setf *input-refine-candidates-fn*
      (lambda (str candidates)
        (let ((matched
               (remove-if-not (lambda (elt)
                                (when (listp elt)
                                  (setf elt (car elt)))
                                (and (<= (length str) (length elt))
                                     (string= str elt
                                              :end1 (length str)
                                              :end2 (length str))))
                              candidates)))
          (subseq matched 0 (min 10 (length matched))))))
