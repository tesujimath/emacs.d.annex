;;; init-annex-nushell --- support for Nushell

;;; Commentary:

;;; Code:

(require-package 'nushell-mode)

(defun tesujimath/clean-buffer () (interactive)
       "clean nushell and zellij markup from current buffer"
       (save-excursion
         ;; indent any nushell tables by a couple of spaces to protect them from zellij frame removal
         (beginning-of-buffer)
         (while (re-search-forward "^│\\([╭│├╰]\\)" nil t)
           (replace-match "│  \\1"))

         ;; kill the blank lines
         (beginning-of-buffer)
         (while (re-search-forward "^│\\s *│$" nil t)
           (replace-match ""))

         ;; kill the lines with content
         (beginning-of-buffer)
         (while (re-search-forward "^│\\(.*[^ ]\\) *│$" nil t)
           (replace-match "\\1"))

         ;; kill any stray bars at the beginning of a line
         ;; which sometimes arise because the line end is truncated
         ;; (may be a bug in alacritty or zellij)
         ;; but this destroys nushell tables
         (beginning-of-buffer)
         (while (re-search-forward "^│" nil t)
           (replace-match ""))

         ;; remove nushell right prompt
         (beginning-of-buffer)
         (while (re-search-forward " *\\([0-9]+ \\)?[0-9]\\{1,2\\}/[0-9]\\{1,2\\}/[0-9]\\{2,4\\} [0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\} [AP]M$" nil t)
           (replace-match ""))
         ))

(provide 'init-annex-nushell)
;;; init-annex-nushell.el ends here
