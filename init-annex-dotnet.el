;;; init-annex-dotnet --- dotnet support

;;; Commentary:
;;; Loads and customizes dotnet related packages

;;; Code:

;; C#
(require-package 'csharp-mode)

;; F#

(require-package 'fsharp-mode)
(setq inferior-fsharp-program "dotnet fsi --readline-")

;; LSP server using omnisharp
(require-package 'eglot)
;;(add-hook 'csharp-mode-hook 'eglot-ensure)
;;(add-hook 'fsharp-mode-hook 'eglot-ensure)

(provide 'init-annex-dotnet)
;;; init-annex-dotnet.el ends here
