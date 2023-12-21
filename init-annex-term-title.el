;;; init-annex-term-title

;;; Commentary:
;;; Loads and customizes term-title mode

;;; Code:

;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; term-titleic = basic term-title-mode + additions

(use-package term-title
  :quelpa (term-title :fetcher github :repo "CyberShadow/term-title")
  :config
  (term-title-mode)
  )

(provide 'init-annex-term-title)
;;; init-annex-term-title.el ends here
