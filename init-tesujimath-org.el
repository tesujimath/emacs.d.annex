;;; init-tesujimath-org --- tweaks for org mode

;;; Commentary:
;;; Additional tweaks over purcell version.

;;; Code:

;; for navi mode
(require-package 'outshine)
(require-package 'navi-mode)
(require 'navi-mode)

;; for word count
(require-package 'org-wc)

;; for export to taskjuggler
;(require 'ox-taskjuggler)

(setq org-edit-timestamp-down-means-later nil)

;; for org capture
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/kanban.org"))
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("!" "Ideas" entry (file+headline "" "Ideas")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("j" "Journal" entry (file+headline  "Journal")
         "* %?\nEntered on %U\n  %i\n  %a")
        ))

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
   (mscgen . t)
   (python . t)
   (sass . t)
   (sql . t)
   ))
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

(setq org-agenda-custom-commands
      `(
        ("k" todo "TODO|IN-PROGRESS|WAITING")
        ("b" todo "BACKLOG")
        ("t" todo "TODO")
        ("i" todo "IN-PROGRESS")
        ("w" todo "WAITING")
        ))

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
             (define-key org-mode-map (kbd "C-c n") '(lambda ()
                                                       (interactive "")
                                                       (foldout-zoom-subtree 0)
                                                       ))
             (define-key org-mode-map (kbd "C-c w") '(lambda ()
                                                       (interactive "")
                                                       (foldout-exit-fold 0)
                                                       ))
             ))

(provide 'init-tesujimath-org)
;;; init-tesujimath-org.el ends here
