;;; init-annex-haskell --- further tweaks to haskell support

;;; Commentary:
;;; To get dante to be able to run stack in stack-exec-path-mode,
;;; tried adding this ~/.stack/config.yaml
;;; nix:
;;;   # both stack and nix are required for Steve Purcell's stack-exec-path-mode
;;;   # so that both stack and nix-shell are on the path made by stack exec
;;;   packages: ["stack", "nix"]                                        ;
;;; but it didn't work, so ended up removing stack-exec-path-mode as a haskell-mode-hook

;;; Code:

(remove-hook 'haskell-mode-hook 'stack-exec-path-mode)
(remove-hook 'dhall-mode-hook 'stack-exec-path-mode)

(provide 'init-annex-haskell)
;;; init-annex-haskell.el ends here
