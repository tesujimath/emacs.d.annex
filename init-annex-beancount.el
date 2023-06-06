;;; init-annex-beancount --- beancount mode

;;; Commentary:
;;; Loads and customizes beancount mode

;;; Code:

(use-package beancount
  :quelpa (beancount :fetcher github :repo "beancount/beancount-mode")
  :config
  (add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))
  )

(provide 'init-annex-beancount)
;;; init-annex-beancount.el ends here
