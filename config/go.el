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
  (setq gofmt-command "gofmt")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package go-eldoc
  :ensure t
  :config
  (go-eldoc-setup))

(defun goimports-fmt ()
  "Hack to use goimports to auto add/remove unsued imports."
  (interactive)
  (setq gofmt-command "goimports")
  (gofmt)
  (setq gofmt-command "gofmt"))

(defun go-mode-setup ()
  "Enable configurations for go."
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-.") 'godef-jump)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-u C-.") 'godef-jump-other-window)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-,") 'xref-pop-marker-stack)))
  (add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c v") 'goimports-fmt))))

(add-hook 'go-mode-hook 'go-mode-setup)

(use-package go-autocomplete
  :ensure t
  :config
  (require 'auto-complete-config)
  (ac-config-default))

(use-package golint
  :ensure t)

(use-package go-guru
  :ensure t)

(use-package go-playground
  :ensure t)


(provide 'go)
;;; go.el ends here
