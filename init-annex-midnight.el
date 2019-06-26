;;; init-annex-midnight --- for cleaning up unused buffers

;;; Commentary:
;;; Provides for midnight files for major modes, via midnight.* files in ~/etc

;;; Code:

(require 'midnight)
(setq clean-buffer-list-delay-general 3)
(setq clean-buffer-list-kill-never-regexps
      '(
        "\\` \\*Minibuf-.*\\*\\'"
        "\\` \\*shell.*.*\\*\\'"
        ))

(provide 'init-annex-midnight)
;;; init-annex-midnight.el ends here
