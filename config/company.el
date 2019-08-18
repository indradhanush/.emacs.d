;;; company --- configuration for autcompletion using company-mode

;;; Commentary:

;;; Code:
(use-package company
  :ensure t
  :defer t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t))


;; (add-hook 'after-init-hook 'global-company-mode)

(provide 'company)
;;; company.el ends here
