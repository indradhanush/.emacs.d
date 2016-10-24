;;; startup --- configuration for emacs startup

;;; Commentary:

;;; Code:

(server-start)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)


(provide 'startup)
;;; startup.el ends here
