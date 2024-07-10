;;; init-annex-nushell --- support for Nushell

;;; Commentary:

;;; Code:

(require-package 'nushell-mode)

(defun tesujimath/clean-nushell-buffer () (interactive)
       "clean nushell markup from current buffer"
       (save-excursion
         ;; remove nushell right prompt
         (beginning-of-buffer)
         (while (re-search-forward " *\\([0-9]+ \\)?[0-9]\\{1,2\\}/[0-9]\\{1,2\\}/[0-9]\\{2,4\\} [0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\} [AP]M$" nil t)
           (replace-match ""))
         ))

(provide 'init-annex-nushell)
;;; init-annex-nushell.el ends here
