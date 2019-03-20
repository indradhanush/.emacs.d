;;; terraform --- configuration for terraform-mode


;;; Commentary:

;;; Code:

(use-package terraform-mode
  :ensure t
  :defer t
  :config
  (add-hook 'terraform-mode-hook 'terraform-format-on-save-mode)
  (add-hook 'terraform-mode-hook
            (lambda () (local-set-key (kbd "C-M-\\") 'terraform-format-buffer))))

;;; terraform.el ends here
