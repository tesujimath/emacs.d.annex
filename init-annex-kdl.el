;;; init-annex-kdl --- kdl support

;;; Commentary:
;;; Loads and customizes a mode which works for kdl files

;;; Code:

;; (use-package sdlang-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.kdl\\'" . sdlang-mode)))

(require-package 'sdlang-mode)

(add-to-list 'auto-mode-alist '("\\.kdl\\'" . sdlang-mode))

(provide 'init-annex-kdl)
;;; init-annex-kdl.el ends here
