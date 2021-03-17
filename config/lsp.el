;;; lsp --- configuration for lsp-mode

;;; Commentary:

;;; Code:


;; A modern list API for Emacs. No 'cl required. Used here by lsp-mode.
(use-package dash
  :ensure t)

;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (go-mode . lsp-deferred)
;;          ;; if you want which-key integration
;;          ;; (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   ;; (setq gc-cons-threshold 100000000)
;;   ;; (setq read-process-output-max (* 1024 1024)) ;; 1mb
;;   ;; (setq lsp-idle-delay 1)
;;   ;; (setq lsp-log-io nil) ; if set to true can cause a performance hit
;;   :commands lsp lsp-deferred))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :init
  (setq lsp-keymap-prefix "s-g")
  ;; :bind (("s-g" . lsp-keymap-prefix))
  :config
  ;; (setq lsp-gopls-staticcheck t)
  ;; (setq lsp-eldoc-render-all t)
  ;; (setq lsp-gopls-complete-unimported t)
  (setq lsp-enable-file-watchers nil)
  ;; (setq lsp-enable-snippet nil)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 1)
  (setq lsp-log-io nil) ; if set to true can cause a performance hit
  )


;; (add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-alignment 'window)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-imenu-enable t)
  (setq lsp-ui-imenu-auto-refresh t)
  ;; (lsp-ui-sideline-show-diagnostics t)
  ;; (lsp-ui-sideline-show-hover t)
  ;; (lsp-ui-sideline-show-code-actions t)
  ;; (lsp-ui-sideline-update-mode t)
  (setq lsp-ui-doc-delay 0.1)
  (setq lsp-ui-sideline-delay 1)

  :bind (
         ("C-c f" . lsp-ui-flycheck-list)
         (:map lsp-ui-flycheck-list-mode-map
               ;; Swap keybindings for view and visit. Since I am most
               ;; likely to visit the error from flycheck, binding the visit
               ;; function to <return> makes more conventional sense for me
               ;; personally.
               ("<return>" . lsp-ui-flycheck-list--visit)
               ("M-<return>" . lsp-ui-flycheck-list--view)
               ("C-g" . lsp-ui-flycheck-list--quit))
         (:map lsp-ui-mode-map
               ("M-i" . lsp-ui-imenu)
               ("s-g d" . lsp-ui-doc-mode)
               ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
               ([remap xref-find-references]  . lsp-ui-peek-find-references))))


;; :bind
;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)


;; (require 'lsp-ui)
;; (define-key lsp-ui-mode-map (kbd "M-i") #'lsp-ui-imenu)
;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)




;; (define-key lsp-ui-mode-map (kbd "ESC ESC") #'lsp-ui-doc-hide)
;; (define-key lsp-ui-mode-map (kbd ""

;; (setq lsp-ui-doc-enable nil)
;; (setq lsp-ui-peek-enable t)
;; (setq lsp-ui-sideline-enable t)
;; (setq lsp-ui-imenu-enable t)

;; (use-package company-lsp

;;   :ensure t
;;   :config
;;   :commands company-lsp)

;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

;; (use-package company-lsp
;;   :load-path "lisp/company-lsp"
;;   :ensure t
;;   :config
;;   :commands company-lsp)

;; (company-lsp)

(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(provide 'lsp)
;;; lsp.el ends here
