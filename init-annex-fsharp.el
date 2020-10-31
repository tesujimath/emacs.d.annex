;;; init-annex-fsharp --- fsharp mode

;;; Commentary:
;;; Loads and customizes fsharp mode

;;; Code:

(require-package 'fsharp-mode)
(setq inferior-fsharp-program "dotnet fsi --readline-")

;;(require-package 'eglot)
;;(add-hook 'fsharp-mode-hook 'eglot-ensure)

(provide 'init-annex-fsharp)
;;; init-annex-fsharp.el ends here
