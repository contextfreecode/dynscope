(defvar mode "safe")

(deftype task () '(or list string))

(declaim (ftype (function (task) integer) really-process))
(defun really-process (task)
  (write-line (format nil "~a: ~a" mode task))
  (length task))

(declaim (ftype (function (task) integer) process))
(defun process (task)
  (really-process task))

(declaim (ftype (function () null) main))
(defun main ()
  (write-line (format nil "~{~a~^ ~}" (list
    (process "something")
    (process "reliable")
    (process (list "again")))))
  ())

(main)
