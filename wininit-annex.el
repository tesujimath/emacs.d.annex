;;; wininit-annex --- windows specific config

;;; Commentary:
;;; Extras for windows specific config

;;; Code:

;; git-bash
(defun git-bash () (interactive)
       (let ((explicit-shell-file-name "C:/Program Files/Git/bin/bash"))
         (call-interactively 'shell)))

;; cygwin-mount, not in MELPA, or anywhere else AFAIK
;; then, customize Cygwin Mount points
(load "vendor/cygwin-mount")
(cygwin-mount-activate)

(provide 'wininit-annex)
;;; wininit-annex.el ends here
