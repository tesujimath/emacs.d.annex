;;; init-annex-org-jira --- Jira integration for org

;;; Commentary:

;;; Code:

;; Jira integration with org-jira

;; use local development version of org-jira if it exists
(let ((local-org-jira-dir (expand-file-name "~/vc/dev/org-jira")))
  (if (file-directory-p local-org-jira-dir)
      (push local-org-jira-dir load-path)))

(with-eval-after-load 'org-jira-mode
  (or (file-directory-p org-jira-working-dir)
      (make-directory org-jira-working-dir))
  )

(require-package 'org-jira)

(provide 'init-annex-org-jira)
;;; init-annex-org-jira.el ends here
