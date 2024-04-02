;;; init-annex-groovy --- groovy mode

;;; Commentary:
;;; Loads and customizes groovy mode

;;; Code:

(require-package 'groovy-mode)

(add-to-list 'auto-mode-alist '("\\.nf\\'" . groovy-mode))
;; (with-eval-after-load 'groovy-mode
;;   (add-hook 'groovy-mode-hook
;;             (lambda () (setq tab-width 4)))
;;   )

(provide 'init-annex-groovy)
;;; init-annex-groovy.el ends here
