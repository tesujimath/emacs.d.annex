;;; init-annex-image-dired --- image-dired tweaks

;;; Commentary:

;;; Code:

(with-eval-after-load 'image-dired
  (add-to-list 'image-dired-cmd-create-thumbnail-options "-auto-orient")
  (add-to-list 'image-dired-cmd-create-temp-image-options "-auto-orient")
  (add-to-list 'image-dired-cmd-create-standard-thumbnail-options
               "-auto-orient"))

(provide 'init-annex-image-dired)
;;; init-annex-image-dired.el ends here
