;;; osx --- OSX specific configurations.

;;; Commentary:

;;; Code:

;; Bugfix for Kill a line on OSX; Comment out on Linux.
(setq save-interprogram-paste-before-kill nil)

;; Remap command to behave as Meta and Option as Super.
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(provide 'osx)
;;; osx.el ends here
