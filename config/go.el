;;; go --- configuration for golang

;;; Commentary:

;;; Code:

;; (use-package exec-path-from-shell
;;   :ensure t
;;   :defer t
;;   :functions exec-path-from-shell-copy-env
;;   :config
;;   (when (memq window-system '(mac ns))
;;     (exec-path-from-shell-copy-env "GOROOT")
;;     (exec-path-from-shell-copy-env "GOPATH")))

;; (use-package go-mode
;;   :ensure t
;;   :defer t
;;   :config
;;   (autoload 'go-mode "go-mode" nil t)
;;   (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
;;   (add-hook 'go-mode-hook 'lsp-deferred))

(use-package go-mode
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))

;; (use-package go-mode
;;   :ensure t
;;   :defer t
;;   :mode "\\.go\\'"
;;   :config
;;   (autoload 'go-mode "go-mode" nil t)
;;   (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))


;;   (setq gofmt-command "gofmt")

;;   (defun goimports-fmt ()
;;     "Hack to use goimports to auto add/remove unsued imports."
;;     (interactive)
;;     (setq gofmt-command "goimports")
;;     (gofmt)
;;     (setq gofmt-command "gofmt"))

;;   (defun go-mode-setup ()
;;     "Enable configurations for go."
;;     (setq gofmt-command "goimports")
;;     (add-hook 'before-save-hook 'gofmt-before-save)
;;     ;; (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-.") 'godef-jump)))
;;     (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-u C-.") 'godef-jump-other-window)))
;;     (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-,") 'xref-pop-marker-stack)))
;;     (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c v") 'goimports-fmt)))
;;     (set-register ?e "if err != nil {zE
;; 		return err
;; 	}")
;;     (set-fill-column 100)
;;     (add-hook 'go-mode-hook #'hs-minor-mode)
;;     ;; (local-set-key (kbd "<C-return>") 'hs-toggle-hiding)

;;     (local-set-key (kbd "C-.") 'godef-jump)
;;     (add-hook 'go-mode-hook 'go-mode-setup)))

;; (use-package go-eldoc
;;   :ensure t
;;   :defer t
;;   :config
;;   (go-eldoc-setup))


;; (use-package go-autocomplete
;;   :ensure t
;;   :defer t
;;   :config
;;   (require 'auto-complete-config)
;;   (ac-config-default))

;; (use-package golint
;;   :ensure t
;;   :defer t)

;; (use-package go-guru
;;   :ensure t
;;   :defer t)

;; (use-package go-playground
;;   :ensure t
;;   :defer t)


(provide 'go)
;;; go.el ends here
