;;; rust --- configuration for rust

;;; Commentary:

;;; Code:
;; (use-package rust-mode
;;   :ensure t
;;   :defer t)

;; (use-package racer
;;   :ensure t
;;   :defer t
;;   :config
;;   (require 'rust-mode)
;;   (add-hook 'rust-mode-hook #'racer-mode)
;;   (add-hook 'racer-mode-hook #'eldoc-mode)
;;   (add-hook 'racer-mode-hook #'company-mode)
;;   (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;   (define-key rust-mode-map (kbd "C-.") #'racer-find-definition)
;;   (define-key rust-mode-map (kbd "C-,") #'pop-tag-mark)

;;   (define-key rust-mode-map (kbd "M-.") nil)
;;   (define-key rust-mode-map (kbd "M-,") nil)

;;   (setq company-tooltip-align-annotations t))

;; (provide 'rust)
;;; rust.el ends here
