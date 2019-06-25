;;; init-tesujimath-auctex --- load and customize auctex mode

;;; Commentary:

;;; Code:

(require-package 'auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook '(lambda ()
                              (turn-on-flyspell)))

(provide 'init-tesujimath-auctex)
;;; init-tesujimath-auctex.el ends here
