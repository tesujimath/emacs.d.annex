;;; init-tesujimath-template --- template files

;;; Commentary:
;;; Provides for template files for major modes

;;; Code:

(defun tesujimath/insert-template-doc (template-path)
  "Insert a template doc in the current buffer if empty."
  (interactive "")
  (if (= (buffer-size (current-buffer)) 0)
      (let* ((filename (expand-file-name template-path)))
        (if (file-exists-p filename)
            (insert-file filename)))))

(provide 'init-tesujimath-template)
;;; init-tesujimath-template.el ends here
