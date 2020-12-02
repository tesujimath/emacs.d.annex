;;; init-local.el --- Load the annex to the configuration
;;; Commentary:

;; This file loads the extras, which are kept separately.

;;; Code:

;; packages requiring customization
(require 'init-annex-auctex)
(require 'init-annex-csharp)
(require 'init-annex-dired)
(require 'init-annex-fsharp)
(require 'init-annex-go)
(require 'init-annex-groovy)
(require 'init-annex-julia)
(require 'init-annex-midnight)
(require 'init-annex-nix)
(require 'init-annex-org)
(require 'init-annex-powershell)
(require 'init-annex-r)
(require 'init-annex-template)
(require 'init-annex-web)
(require 'init-annex-yafolding)

;; packages not requiring customizaion
(require-package 'actionscript-mode)

(require-package 'caddyfile-mode)
(add-hook 'caddyfile-mode-hook
          (lambda () (setq tab-width 2
                      indent-tabs-mode nil)))

(require-package 'protobuf-mode)
;; puppet mode may be bundled
(unless (require 'puppet-mode nil t) (progn (require-package 'puppet-mode)
                                            (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
                                            (add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
                                            ))
;(require-package 'vcl-mode)

;;
;; flyspell in some additional modes
;;
(after-load 'markdown-mode
  (add-hook 'markdown-mode-hook 'turn-on-flyspell))


;;
;; global keys
;;
(global-set-key (kbd "<f5>") 'auto-fill-mode)
(global-set-key (kbd "<f8>") 'compile)
(global-set-key (kbd "<f9>") 'goto-line)
(global-set-key (kbd "C-x y") 'rename-buffer)
(global-set-key (kbd "<pause>") 'ignore)

;;
;; template documents
;;

(defun tesujimath/insert-template-html () (tesujimath/insert-template-doc "~/etc/template.html"))
(add-hook 'html-mode-hook 'tesujimath/insert-template-html)

(defun tesujimath/insert-template-tex () (tesujimath/insert-template-doc "~/etc/template.tex"))
(add-hook 'LaTeX-mode-hook 'tesujimath/insert-template-tex)

;;
;; other tweaks
;;

;; don't use a pager inside Emacs
(setenv "PAGER" "cat")

;; paredit-everywhere-mode is an acquired taste
(remove-hook 'prog-mode-hook 'paredit-everywhere-mode)

;; don't want control-Z to suspend frame, it just hangs Emacs
(global-unset-key (kbd "C-z"))

;; Windows-only config
(if (eq system-type 'windows-nt)
    (require 'wininit-annex))

(provide 'init-local)

;;; init-local.el ends here
