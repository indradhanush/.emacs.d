;;; startup --- configuration for emacs startup

;;; Commentary:

;;; Code:

(server-start)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Enable commands that are disabled by default
(enable-command 'set-goal-column)

(provide 'startup)
;;; startup.el ends here
