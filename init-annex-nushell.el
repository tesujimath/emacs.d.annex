;;; init-annex-nushell --- support for Nushell

;;; Commentary:

;;; Code:

(require-package 'nushell-mode)

(defun tesujimath/clean-buffer-zellij () (interactive)
       "clean zellij pane markup from current buffer"
       (save-excursion
         ;; kill the blank lines
         (beginning-of-buffer)
         (while (re-search-forward "^│\\s *│$" nil t)
           (replace-match ""))

         ;; kill the lines with content
         (beginning-of-buffer)
         (while (re-search-forward "^│\\(.*[^ ]\\) *│$" nil t)
           (replace-match "\\1"))

         ;; finally kill any stray bars at the beginning of a line
         ;; which sometimes arise because the line end is truncated
         ;; (may be a bug in alacritty or zellij)
         (beginning-of-buffer)
         (while (re-search-forward "^│" nil t)
           (replace-match ""))
         ))

(defun tesujimath/clean-buffer-nushell () (interactive)
       "clean nushell right prompt from current buffer"
       (save-excursion
         (beginning-of-buffer)
         (while (re-search-forward " *[0-9]\\{1,2\\}/[0-9]\\{1,2\\}/[0-9]\\{2,4\\} [0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\} [AP]M$" nil t)
           (replace-match ""))
         ))

(defun tesujimath/clean-buffer () (interactive)
       "clean nushell and zellij markup from current buffer"
       (tesujimath/clean-buffer-zellij)
       (tesujimath/clean-buffer-nushell)
       )

(provide 'init-annex-nushell)
;;; init-annex-nushell.el ends here
