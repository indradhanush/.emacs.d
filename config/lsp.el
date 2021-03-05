;;; lsp --- configuration for lsp-mode

;;; Commentary:

;;; Code:

;; (use-package lsp-mode
;;   :ensure t
;;   :commands (lsp lsp-deferred)
;;   :hook (go-mode . lsp-deferred)
;;   :config
;;   (setq gc-cons-threshold 400000000)
;;   (setq read-process-output-max (* 1024 1024)) ;; 1mb
;;   (setq lsp-idle-delay 0.500)
;;   (setq lsp-log-io nil) ; if set to true can cause a performance hit
;;   )

;; flycheck syntax checker
;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; ;; LSP
;; (use-package lsp-mode
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook ((python-mode . lsp-deferred)
;;          (go-mode . lsp-deferred)
;;          (rust-mode . lsp-deferred)
;;          (typescript-mode . lsp-deferred)
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   (setq gc-cons-threshold 400000000)
;;   (setq read-process-output-max (* 1024 1024)) ;; 1mb
;;   (setq lsp-idle-delay 0.500)
;;   (setq lsp-log-io nil) ; if set to true can cause a performance hit
;;   :commands (lsp lsp-deferred))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (lsp-ui-doc-position 'bottom))

;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; (use-package company-lsp
;;   :commands company-lsp)

;; ;;Optional - provides snippet support.

;; (use-package yasnippet
;;   :commands yas-minor-mode
;;   :hook (
;;          (go-mode . yas-minor-mode)
;;          (python-mode . yas-minor-mode)
;;          ))

;; (setq lsp-ui-doc-enable t
;;       lsp-ui-peek-enable t
;;       lsp-ui-sideline-enable t
;;       lsp-ui-imenu-enable t
;;       lsp-ui-flycheck-enable t)

;; ;; DAP
;; (use-package dap-mode
;;   ;; Uncomment the config below if you want all UI panes to be hidden by default!
;;   ;; :custom
;;   ;; (lsp-enable-dap-auto-configure nil)
;;   ;; :config
;;   ;; (dap-ui-mode 1)
;;   :commands dap-debug
;;   :config
;;   ;; Set up Node debugging
;;   (require 'dap-node)
;;   (dap-node-setup) ;; Automatically installs Node debug adapter if needed
;;   (require 'dap-go)
;;   (dap-go-setup)
;;   (require 'dap-hydra)
;;   (require 'dap-gdb-lldb)
;;   (dap-gdb-lldb-setup)

;;   ;; Bind `C-c l d` to `dap-hydra` for easy access
;;   (general-define-key
;;     :keymaps 'lsp-mode-map
;;     :prefix lsp-keymap-prefix
;;     "d" '(dap-hydra t :wk "debugger")))





;; ;; ;; Set up before-save hooks to format buffer and add/delete imports.
;; ;; ;; Make sure you don't have other gofmt/goimports hooks enabled.
;; ;; (defun lsp-go-install-save-hooks ()
;; ;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;; ;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; ;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; ;; ;; Optional - provides fancier overlays.
;; ;; (use-package lsp-ui
;; ;;   :ensure t
;; ;;   :commands lsp-ui-mode)

;; ;; ;; Company mode is a standard completion package that works well with lsp-mode.
;; ;; (use-package company
;; ;;   :ensure t
;; ;;   :config
;; ;;   ;; Optionally enable completion-as-you-type behavior.
;; ;;   (setq company-idle-delay 0)
;; ;;   (setq company-minimum-prefix-length 1))

;; ;; ;; Optional - provides snippet support.
;; ;; (use-package yasnippet
;; ;;   :ensure t
;; ;;   :commands yas-minor-mode
;; ;;   :hook (go-mode . yas-minor-mode))


;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

;; ;;; lsp.el ends here
