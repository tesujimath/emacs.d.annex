;;; init-local.el --- Load the annex to the configuration
;;; Commentary:

;; This file loads the extras, which are kept separately.

;;; Code:

;; packages requiring customization
(require 'init-annex-asciidoc)
(require 'init-annex-auctex)
(require 'init-annex-deadgrep)
(require 'init-annex-dotnet)
(require 'init-annex-dired)
(require 'init-annex-earthly)
(require 'init-annex-git)
(require 'init-annex-go)
(require 'init-annex-graphql)
(require 'init-annex-groovy)
(require 'init-annex-haskell)
(require 'init-annex-image-dired)
(require 'init-annex-julia)
(require 'init-annex-markdown)
(require 'init-annex-midnight)
(require 'init-annex-nix)
(require 'init-annex-org)
(require 'init-annex-org-jira)
(require 'init-annex-powershell)
(require 'init-annex-r)
(require 'init-annex-template)
(require 'init-annex-fonts)
(require 'init-annex-unicode)
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
;;(require-package 'vcl-mode)

(require-package 'string-inflection)

;;
;; flyspell in some additional modes
;;
(after-load 'markdown-mode
  (add-hook 'markdown-mode-hook 'turn-on-flyspell))


;;
;; global keys
;;
;;(global-set-key (kbd "<f5>") 'auto-fill-mode)
(global-set-key (kbd "<f5>") 'deadgrep)
(global-set-key (kbd "<f8>") 'compile)
(global-set-key (kbd "<f9>") 'goto-line)
(global-set-key (kbd "C-x y") 'rename-buffer)
(global-set-key (kbd "<pause>") 'ignore)

(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q C-u") 'string-inflection-all-cycle)
(global-set-key (kbd "C-q C-i") 'quoted-insert)

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
