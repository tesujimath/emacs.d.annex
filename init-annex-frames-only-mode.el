;;; init-annex-frames-only-mode --- a global minor mode

;;; Commentary:
;;; Support for frames-only-mode

;;; Code:

(require-package 'frames-only-mode)

;; there may be some further tweaks required here

;; (with-eval-after-load 'frames-only-mode
;;   ;;(setq ido-default-buffer-method 'selected-window)
;;   )

;; disabled because frames-only-mode probably does this
;; from https://www.reddit.com/r/emacs/comments/9ih3fo/frameoriented_workflow/
;; (setq display-buffer-alist nil)
;; (setq display-buffer-alist
;;       '((".*" (display-buffer-reuse-window
;;                display-buffer-pop-up-frame)
;;          (reusable-frames . t))))

(provide 'init-annex-frames-only-mode)
;;; init-annex-frames-only-mode.el ends here
