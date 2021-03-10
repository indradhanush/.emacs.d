;;; company --- configuration for autcompletion using company-mode

;;; Commentary:

;;; Code:
;; (use-package company
;;   :ensure t
;;   :config
;;   ;; don't add any delay before trying to complete thing being typed
;;   ;; the call/response to gopls is asynchronous so this should have little
;;   ;; to no affect on edit latency
;;   (setq company-idle-delay 0)
;;   ;; start completing after a single character instead of 3
;;   (setq company-minimum-prefix-length 1)
;;   ;; align fields in completions
;;   (setq company-tooltip-align-annotations t)

;;   (add-hook 'after-init-hook 'global-company-mode)

;;   )

;; (add-hook 'after-init-hook 'global-company-mode)

;; (provide 'company)
;;; company.el ends here
