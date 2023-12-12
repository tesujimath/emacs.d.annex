;;; init-annex-org --- tweaks for org mode

;;; Commentary:
;;; Additional tweaks over purcell version.

;;; Code:

;; BACKLOG(b!) TODO(t!) IN-PROGRESS(i!) WAITING(w@/!) | DONE(d!) CANCELLED(c@)
(setq org-todo-keywords
      (quote ((sequence "BACKLOG(b!)" "TODO(t)" "IN-PROGRESS(i!)" "|" "DONE(d!/!)" "CANCELLED(c@)")
              (sequence "IN-PROGRESS(i!)" "WAITING(w@/!)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "IN-PROGRESS(i!)" "|" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "TODO")

(setq org-todo-keyword-faces
      (quote (("TODO" :inherit warning)
              ("IN-PROGRESS" :inherit font-lock-string-face))))


;; for structure template expansion
(require 'org-tempo)

;; for navi mode
(require-package 'outshine)
(require-package 'navi-mode)
(require 'navi-mode)

;; for word count, use my own version of org-wc
(let ((org-wc-dir (expand-file-name "~/vc/tesujimath/org-wc")))
  (if (file-directory-p org-wc-dir)
      (progn
        (push org-wc-dir load-path)
        (load "org-wc"))
    (require-package 'org-wc)))

;; for export to taskjuggler
;;(require 'ox-taskjuggler)

(setq org-edit-timestamp-down-means-later nil)

;; for org capture
(setq org-directory (expand-file-name "~/mobile/notes"))
(setq org-default-notes-file (concat (file-name-as-directory org-directory) "inbox.org"))
(setq org-capture-templates
      '(
        ;; https://github.com/sprig/org-capture-extension
        ("L" "Link" entry (file+headline "resources.org" "Unclassified")
         "** TODO %:description\n%:link\n%?")
        ("p" "Link" entry (file+headline "resources.org" "Unclassified")
         "** TODO %:description\n%:link\n\n%i\n%?")

        ("t" "Todo" entry (file+headline "" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("!" "Ideas" entry (file+headline "" "Ideas")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("j" "Journal" entry (file+headline  "Journal")
         "* %?\nEntered on %U\n  %i\n  %a")
        ))

;; for org-protocol
;; https://orgmode.org/worg/org-contrib/org-protocol.html
(require 'server)
(unless (server-running-p)
  (server-start))
(require 'org-protocol)

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "C-c C-h") 'hide-sublevels)
             (turn-on-flyspell)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (css . t)
   (js . t)
   (latex . t)
   ;(mscgen . t)
   (python . t)
   (sass . t)
   (sql . t)
   ))
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

;; export timestamps without brackets
;; http://stackoverflow.com/questions/23297422/org-mode-timestamp-format-when-exported
(defun tesujimath/org-export-filter-timestamp-remove-brackets (timestamp backend info)
  "removes relevant brackets from a timestamp"
  (cond
   ((org-export-derived-backend-p backend 'latex)
    (replace-regexp-in-string "[<>]\\|[][]" "" timestamp))
   ((org-export-derived-backend-p backend 'html)
    (replace-regexp-in-string "&[lg]t;\\|[][]" "" timestamp))))

(eval-after-load 'ox '(add-to-list
                       'org-export-filter-timestamp-functions
                       'tesujimath/org-export-filter-timestamp-remove-brackets))

(require 'foldout)
(add-hook 'org-mode-hook
          '(lambda ()
             (let ((org-mode-n-map (make-sparse-keymap)))
               (define-key org-mode-map (kbd "C-c n") org-mode-n-map)
               (define-key org-mode-n-map (kbd "n") '(lambda ()
                                                       (interactive "")
                                                       (foldout-zoom-subtree 0)
                                                       ))
               (define-key org-mode-n-map (kbd "w") '(lambda ()
                                                       (interactive "")
                                                       (foldout-exit-fold 0)
                                                       ))
               (define-key org-mode-n-map (kbd "c") 'tesujimath/clean-buffer)
               )
             (define-key org-mode-map (kbd "C-c 1") '(lambda ()
                                                       (interactive "")
                                                       (outline-hide-sublevels 1)
                                                       ))
             (define-key org-mode-map (kbd "C-c 2") '(lambda ()
                                                       (interactive "")
                                                       (outline-hide-sublevels 2)
                                                       ))
             (define-key org-mode-map (kbd "C-c 3") '(lambda ()
                                                       (interactive "")
                                                       (outline-hide-sublevels 3)
                                                       ))
             (define-key org-mode-map (kbd "C-c 9") '(lambda ()
                                                       (interactive "")
                                                       (outline-hide-sublevels 9)
                                                       ))
             ))

(provide 'init-annex-org)
;;; init-annex-org.el ends here
