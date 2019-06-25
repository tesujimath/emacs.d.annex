;;; init-tesujimath-groovy --- groovy mode

;;; Commentary:
;;; Loads and customizes groovy mode

;;; Code:

(require-package 'groovy-mode)

(add-to-list 'auto-mode-alist '("\\.nf\\'" . groovy-mode))
;; (after-load 'groovy-mode
;;   (add-hook 'groovy-mode-hook
;;             (lambda () (setq tab-width 4)))
;;   )

(provide 'init-tesujimath-groovy)
;;; init-tesujimath-groovy.el ends here
