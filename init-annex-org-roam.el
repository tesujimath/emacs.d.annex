;;; init-annex-org-roam --- tweaks for org-roam mode

;;; Commentary:

;;; Code:

(use-package org-roam
  :config
  (setq org-roam-directory "~/vc/sjg/roam")
  (org-roam-db-autosync-mode)

  ;; https://orgmode.org/worg/org-contrib/org-protocol.html
  (require 'server)
  (unless (server-running-p)
    (server-start))
  (require 'org-protocol)
  )

(provide 'init-annex-org-roam)
;;; init-annex-org-roam.el ends here
