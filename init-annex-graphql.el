;;; init-annex-graphql --- graphql mode

;;; Commentary:
;;; Loads and customizes graphql mode

;;; Code:

(require-package 'graphql-mode)

(add-to-list 'auto-mode-alist '("\\.graphql\\'" . graphql-mode))

(provide 'init-annex-graphql)
;;; init-annex-graphql.el ends here
