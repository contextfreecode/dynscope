(defvar *mode* "safe")

(deftype task () '(or list string))

(declaim (ftype (function (task) integer) really-process))
(defun really-process (task)
  (format t "~a: ~a~%" *mode* task)
  (length task))

(declaim (ftype (function (task) integer) process))
(defun process (task)
  (really-process task))

(declaim (ftype (function (string function) result) with-mode))
(defun with-mode (mode action)
  (let ((*mode* mode)) (funcall action)))

(declaim (ftype (function () null) main))
(defun main ()
  (format t "~{~a~^ ~}~%" (list
    (process "something")
    (with-mode "faster" (lambda () (process "reliable")))
    (process (list "again"))))
  ())

(main)
