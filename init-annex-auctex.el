;;; init-annex-auctex --- load and customize auctex mode

;;; Commentary:

;;; Code:

(require-package 'auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook '(lambda ()
                              (turn-on-flyspell)))

(provide 'init-annex-auctex)
;;; init-annex-auctex.el ends here
