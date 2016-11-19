;;; go --- configuration for golang

;;; Commentary:

;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOROOT")
    (exec-path-from-shell-copy-env "GOPATH")))


(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package go-eldoc
  :ensure t
  :config
  (go-eldoc-setup))

(defun go-mode-setup ()
  "Enable configurations for go."
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-.") 'godef-jump)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-u C-.") 'godef-jump-other-window)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-,") 'xref-pop-marker-stack))))

(add-hook 'go-mode-hook 'go-mode-setup)

(use-package go-autocomplete
  :ensure t
  :config
  (require 'auto-complete-config))

(use-package golint
  :ensure t)

(use-package go-guru
  :ensure t)

(use-package go-playground
  :ensure t)


(provide 'go)
;;; go.el ends here
