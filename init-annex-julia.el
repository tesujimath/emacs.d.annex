;;; init-annex-julia --- support for Julia programming

;;; Commentary:

;;; Code:

(require-package 'julia-mode)
(require-package 'julia-repl)
(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))

(add-hook 'julia-mode-hook 'julia-repl-mode)

(provide 'init-annex-julia)
;;; init-annex-julia.el ends here
