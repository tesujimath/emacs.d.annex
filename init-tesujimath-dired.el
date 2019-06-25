;;; init-tesujimath-dired --- further dired tweaks

;;; Commentary:

;;; Code:

(defun tesujimath/dired-view-external-aux (current-file)
  "View file using external program."
  (cond ((eq system-type 'gnu/linux)
         ;; alas xdg-open is at the mercy of the current desktop
         ;; and enlightenment doesn't honour the mimeapps.list file,
         ;; so use the gnome opener, which needs process-connection type nil
         (let ((process-connection-type nil)
               (cmd (concat "gvfs-open \"" current-file "\"")))
           (start-process-shell-command cmd nil cmd)))
        ((eq system-type 'windows-nt)
         (w32-shell-execute "open" current-file))
        ))

(defun tesujimath/dired-view-file-external ()
  "View selected files using external program."
  (interactive "")
  (tesujimath/dired-view-external-aux (dired-get-filename)))

(defun tesujimath/dired-view-current-dir-external ()
  "View current directory using external program."
  (interactive "")
  (tesujimath/dired-view-external-aux (dired-current-directory)))

(after-load 'dired
  (add-hook 'dired-mode-hook
            (lambda () (define-key dired-mode-map (kbd "C-c v") 'tesujimath/dired-view-file-external)
              (define-key dired-mode-map (kbd "C-c d") 'tesujimath/dired-view-current-dir-external))))

(provide 'init-tesujimath-dired)
;;; init-tesujimath-dired.el ends here
