;;; wininit-annex --- windows specific config

;;; Commentary:
;;; Loads and customizes go mode

;;; Code:

;; git-bash
(defun git-bash () (interactive)
       (let ((explicit-shell-file-name "C:/Program Files/Git/bin/bash"))
         (call-interactively 'shell)))

;; cygwin-mount, not in MELPA, or anywhere else AFAIK
;; then, customize Cygwin Mount points
(load-file "vendor/cygwin-mount.el")
(cygwin-mount-activate)

(provide 'wininit-annex)
;;; wininit-annex.el ends here
