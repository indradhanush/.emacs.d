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


(add-hook 'go-mode-hook (lambda () (auto-complete-mode -1)))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda()
                            (global-visual-line-mode nil)
                            ;; (yafolding-mode t)
                            (setq tab-width 4)
                            (setq fill-column 100)
                            ))

  (setenv "GOROOT" (string-trim (shell-command-to-string "go env GOROOT")))
  (setenv "GOPATH" (string-trim (shell-command-to-string "go env GOPATH"))))


  ;; :hook ((go-mode . lsp-deferred)
  ;;        (before-save . lsp-format-buffer)
  ;;        (before-save . lsp-organize-imports)))

(use-package dap-mode)

(provide 'go)
;;; go.el ends here
