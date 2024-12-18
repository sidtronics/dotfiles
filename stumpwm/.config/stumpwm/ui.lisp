(setf *input-window-gravity* :center)
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
