;;; init-tesujimath-template --- tesujimath customizations to Steve Purcell's emacs.d

;;; Commentary:
;;; Additional tweaks all performed as add-ons, rather than editing existing Lisp.
;;; This is the top level for the tesujimath customizations.

;;; Code:

;; packages requiring customization
(require 'init-tesujimath-auctex)
(require 'init-tesujimath-dired)
(require 'init-tesujimath-go)
(require 'init-tesujimath-groovy)
(require 'init-tesujimath-julia)
(require 'init-tesujimath-midnight)
(require 'init-tesujimath-org)
(require 'init-tesujimath-template)
(require 'init-tesujimath-web)

;; packages not requiring customizaion
(require-package 'protobuf-mode)
;; puppet mode may be bundled
(unless (require 'puppet-mode nil t) (progn (require-package 'puppet-mode)
                                            (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
                                            (add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
                                            ))
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

;; paredit-everywhere-mode is an acquired taste
(remove-hook 'prog-mode-hook 'paredit-everywhere-mode)

(provide 'init-tesujimath)
;;; init-tesujimath.el ends here
