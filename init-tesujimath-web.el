;;; init-tesujimath-web --- web mode tweaks

;;; Commentary:

;;; Code:

(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;; customizations
(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-code-indent-offset 2)
            ))

(provide 'init-tesujimath-web)
;;; init-tesujimath-web.el ends here
