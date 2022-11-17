;;; osx --- OSX specific configurations.

;;; Commentary:

;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :functions exec-path-from-shell-copy-env
  :config
  ;; (when (memq window-system '(mac ns))
    ;; (exec-path-from-shell-copy-env "PATH")

    ;; Bugfix for Kill a line on OSX; Comment out on Linux.
    ;; (setq save-interprogram-paste-before-kill nil)

    ;; Remap command to behave as Meta and Option as Super.

    )

(exec-path-from-shell-copy-env "PATH")
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


(provide 'osx)


;;; osx.el ends here
