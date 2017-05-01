;;; python --- configuration for python

;;; Commentary:

;;; Code:

(use-package python-mode
  :ensure t
  :config
  (require 'python-mode))

(use-package virtualenv
  :ensure t)

(use-package jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  ;; (jedi:install-server)

  ;; redefine jedi's C-. (jedi:goto-definition)
  ;; to remember position, and set C-, to jump back
  (add-hook 'python-mode-hook
            '(lambda ()
               (local-set-key (kbd "C-.") 'jedi:goto-definition)
               (local-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker)
               (local-set-key (kbd "C-c d") 'jedi:show-doc)
               (local-set-key (kbd "C-<tab>") 'jedi:complete)))
  )

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq venv-location "~/.venv/")
  (setq eshell-prompt-function
        (lambda ()
          (concat venv-current-name " $ ")))

  (add-hook 'python-mode-hook
            (lambda () (hack-local-variables)
              (venv-workon project-venv-name)))
  )


(set-register ?i "import ipdb; ipdb.set_trace()")


(use-package pip-requirements
  :ensure t
  :config
  (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup))

(provide 'python)
;;; python.el ends here
