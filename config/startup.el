;;; startup --- configuration for emacs startup

;;; Commentary:

;;; Code:

(server-start)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Ensure that windows like magit-status split vertically instead of horizontally
(setq split-height-threshold nil)

(provide 'startup)
;;; startup.el ends here
