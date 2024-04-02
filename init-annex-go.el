;;; init-annex-go --- go mode

;;; Commentary:
;;; Loads and customizes go mode

;;; Code:

(require-package 'go-mode)

(with-eval-after-load 'go-mode
  (add-hook 'go-mode-hook
            (lambda () (setq tab-width 4)))
  (add-hook 'before-save-hook 'gofmt-before-save)
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (setq gofmt-command "goimports")
  )

(provide 'init-annex-go)
;;; init-annex-go.el ends here
