;; -*- eval: (read-only-mode 1) -*-

;; ~/.emacs.d/config.el -- Emacs configurations

;; Generated by Emacs Modular Configuration version 0.1
;; DO NOT EDIT THIS FILE.
;; Edit the files under '~/.emacs.d/config' directory tree, 
;; then run within emacs 'M-x emc-merge-config-files'

;; ############################################################################
;; Config file: ~/.emacs.d/config/autocomplete.el
;;; auto-complete ---- configuration for autocompletion using auto-complete

;;; Commentary:

;;; Code:
;; (use-package auto-complete
;;   :ensure t
;;   :defer t
;;   :config
;;   (ac-config-default)

;;   (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;;   (add-to-list 'ac-modes 'terraform-mode)

;;   (setq ac-use-menu-map t)
;;   (setq ac-menu-height 20)
;;   (setq ac-auto-show-menu 0.3)
;;   (setq ac-use-fuzzy t)
;;   (setq ac-disable-faces nil)
;;   )

;; Hack. ac-dabbrev.el is placed at lisp/ac-dabbrev.el
;; (require 'ac-dabbrev)
;; (add-to-list 'ac-sources 'ac-source-dabbrev)

;; (provide 'autocomplete)
;;; autocomplete.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/company.el
;;; company --- configuration for autcompletion using company-mode

;;; Commentary:

;;; Code:
(use-package company
  :ensure t
  :config
  ;; don't add any delay before trying to complete thing being typed
  ;; the call/response to gopls is asynchronous so this should have little
  ;; to no affect on edit latency
  (setq company-idle-delay 0)
  ;; start completing after a single character instead of 3
  (setq company-minimum-prefix-length 1)
  ;; align fields in completions
  (setq company-tooltip-align-annotations t)

  (add-hook 'after-init-hook 'global-company-mode)
  )



;; (add-hook 'after-init-hook 'global-company-mode)

;; (provide 'company)
;;; company.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/editor.el
;;; editor --- configuration for emacs editor.

;;; Commentary:

;;; Code:

(server-start)

;; Make emacs frames opaque. This is required when running something like picom.
(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))

(setq column-number-mode t)

(blink-cursor-mode 0)

(savehist-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Tab behaviour
(setq-default c-basic-offset 4)
(setq tab-width 4)
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)

;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; Scroll window under mouse
(setq mouse-wheel-follow-mouse 't)

(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; Hide Scroll Bar
;; Update: 2022-03-29: Do not hide scroll bar mode if centaur-mode is used.
;; https://github.com/ema2159/centaur-tabs/issues/110
;; (scroll-bar-mode -1)

;; Hide Tool Bar
(tool-bar-mode -1)

;; Hide Menu Bar
(menu-bar-mode -1)

;; Colour theme
(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))

;; #################################################
;; Custom key bindings

;; Bind M-x to smex
;; (use-package smex
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "M-x") 'smex))


;; Backspace settings
(global-set-key (kbd "C-?") 'help-command)
;; (global-set-key (kbd "M-?") 'mark-paragraph)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "M-h") 'backward-kill-word)


;; Rename both file and buffer
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "New name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)

(global-auto-revert-mode t)

(use-package fill-column-indicator
  :ensure t
  :functions turn-on-fci-mode
  :defer t
  :config
  (setq fci-rule-column 120)
  ;; (turn-on-fci-mode)
  )

(setq visible-bell 'nil)
(setq ring-bell-function 'ignore)

(toggle-truncate-lines 1)

(global-hl-line-mode 1)
;; (global-visual-line-mode 1)
(toggle-word-wrap nil)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (forward-line)))

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(set-face-attribute 'default nil :height 95)
;; (set-face-attribute 'default nil :width 'normal)
;; (set-face-attribute 'default nil :weight 'normal)

(defun pairing-mode ()
  "Customize editor look and feel to make it easy for the person on the other side of the network."
  (interactive)
  (set-face-attribute 'default (selected-frame) :height 140)
  (linum-mode))

(defun unpairing-mode ()
  "Customize editor look and feel to make it easy for the person on the other side of the network."
  (interactive)
  (set-face-attribute 'default nil :height 105)
  (global-linum-mode 0))

(defun standalone-mode ()
  "Customize editor look and feel when working only on the laptop."
  (interactive)
  (set-face-attribute 'default nil :height 100))

(defun set-font-size (size)
  "Set font SIZE."
  (interactive "nSet font size: ")
  (set-face-attribute 'default nil :height size))


(defun font-size-50 ()
  "Set font size 50."
  (interactive)
  (set-face-attribute 'default nil :height 50))

(defun font-size-60 ()
  "Set font size 60."
  (interactive)
  (set-face-attribute 'default nil :height 60))

(defun font-size-70 ()
  "Set font size 70."
  (interactive)
  (set-face-attribute 'default nil :height 70))

(defun font-size-80 ()
  "Set font size 80."
  (interactive)
  (set-face-attribute 'default nil :height 80))

(defun font-size-90 ()
  "Set font size 90."
  (interactive)
  (set-face-attribute 'default nil :height 90))

(defun font-size-95 ()
  "Set font size 95."
  (interactive)
  (set-face-attribute 'default nil :height 95))

(defun font-size-100 ()
  "Set font size 100."
  (interactive)
  (set-face-attribute 'default nil :height 100))

(defun font-size-105 ()
  "Set font size 100."
  (interactive)
  (set-face-attribute 'default nil :height 105))

(defun font-size-110 ()
  "Set font size 100."
  (interactive)
  (set-face-attribute 'default nil :height 110))

(defun external-fhd-mode ()
  "Customize editor look and feel when working with an external FHD screen."
  (interactive)
  (set-face-attribute 'default nil :height 60))

(defun change-font-size-this-frame ()
  "Customize editor look and feel of current frame."
  (interactive)
  (set-face-attribute 'default (selected-frame) :height 110))

(defun ultra-hd-mode ()
  "Customize editor look and feel of current frame."
  (interactive)
  (set-face-attribute 'default nil :height 110))

(require 'framemove)
(setq framemove-hook-into-windmove t)

(require 'buffer-move)

(global-set-key (kbd "C-c l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c L") 'global-display-line-numbers-mode)
(global-display-line-numbers-mode -1)


;; Run `M-x byte-compile RET ~/.emacs.d/lisp/workgroups.el` to speed things up.
;; (require 'workgroups)
;; (use-package workgroups
;;   :ensure t
;;   :init
;;   (workgroups-mode 1))

;; (use-package undo-tree
;   :ensure t
;;   :config
;;   (global-undo-tree-mode))
;; (require 'undo-tree)
;; (global-undo-tree-mode)

;; (use-package emojify
;;   :hook (after-init . global-emojify-mode))

(set-fontset-font t 'symbol "Apple Color Emoji")
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
(set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)

(provide 'editor)
;;; editor.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/erlang.el
;;; erlang --- configuration for erlang

;;; Commentary:

;;; Code:

;; (setq-default erlang-root-dir "/usr/local/bin")


;; (add-hook 'erlang-mode-hook (lambda () (electric-indent-local-mode -1)))

;; (add-hook 'erlang-mode-hook 'erlang-setup
;;           (defun erlang-setup ()
;;             'auto-complete-mode 1
;;             (setq-default erlang-electric-semicolon-insert-blank-lines 1)
;;             (setq-default erlang-argument-indent 4)))

;;; erlang.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/eshell.el
;;; eshell --- configuration for eshell-mode

;;; Commentary:

;;; Code:


(add-hook 'eshell-mode-hook
          (defun eshelshell-mode-setup ()
            (remove-hook 'eshell-output-filter-functions
                         'eshell-postoutput-scroll-to-bottom)
            (company-mode -1))
          )

;;; eshell.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/go.el
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
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/golden-ratio.el
;;; golden-ratio --- configuration for golden-ratio-mode

;;; Commentary:

;;; Code:

(use-package golden-ratio
  :defer
  :config
  (setq golden-ratio-adjust 0.65)
  )

;;; golden-ratio.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/graphql.el
;;; graphql --- configuration for graphql-mode

;;; Commentary:

;;; Code:

(use-package graphql-mode
  :ensure t
  :defer
  )

(provide 'graphql)
;;; graphql.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/helm.el
;;; helm --- configuration for navigating in emacs.

;;; Commentary:

;;; Code:

;; Config from http://tuhdo.github.io/helm-intro.html
;; I have some personaltweaks here.
(use-package helm
  :ensure t
  :defer t
  :functions helm-autoresize-mode
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)

         ("C-c SPC" . helm-all-mark-rings)
         ("C-x b" . helm-mini)

         ("C-x C-f" . helm-find-files)
         ("C-c m" . helm-command-prefix)

         :map helm-command-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("g" . helm-grep-do-git-grep)

         :map helm-read-file-map
         ("<backspace>" . dwim-helm-find-files-up-one-level-maybe)
         ("DEL" . dwim-helm-find-files-up-one-level-maybe)
         ("<return>" . helm-execute-persistent-action)
         ("RET" . helm-execute-persistent-action)

         :map helm-find-files-map
         ("<backspace>" . dwim-helm-find-files-up-one-level-maybe)
         ("DEL" . dwim-helm-find-files-up-one-level-maybe)
         ("<return>" . helm-execute-persistent-action)
         ("RET" . helm-execute-persistent-action)
         :map helm-map
         ("<return>" . helm-maybe-exit-minibuffer)
         ("RET" . helm-maybe-exit-minibuffer))

  :config
  (require 'helm-config)
  (global-unset-key (kbd "C-x c"))
  (setq helm-split-window-inside-p t
        helm-ff-file-name-history-use-recentf t

        helm-ff-skip-boring-files t

        helm-scroll-amount 8
        helm-autoresize-max-height 25
        helm-autoresize-min-height 1)

  (helm-autoresize-mode t)

  (setq helm-locate-fuzzy-match t
        helm-M-x-fuzzy-match t
        helm-lisp-fuzzy-completion t
        helm-apropos-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        ;; helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t)

  ;; Make helm-find-files behave like ido-find-file
  ;; https://github.com/hatschipuh/ido2helm#file-navigation
  (defun dwim-helm-find-files-up-one-level-maybe ()
    (interactive)
    (if (looking-back "/" 1)
        (call-interactively 'helm-find-files-up-one-level)
      (backward-delete-char 1)))

  (defun dwim-helm-find-files-navigate-forward (orig-fun &rest args)
    "Adjust how helm-execute-persistent actions behaves, depending on context"
    (if (file-directory-p (helm-get-selection))
        (apply orig-fun args)
      (helm-maybe-exit-minibuffer)))

  (advice-add 'helm-execute-persistent-action
              :around #'dwim-helm-find-files-navigate-forward)

  ;; (semantic-mode 1)

  (helm-mode 1))

;; helm-flycheck
(use-package helm-flycheck
  :ensure t
  :defer t
  :bind ("C-c f" . helm-flycheck)
  :config
  (global-flycheck-mode t))

;; helm-swoop
;; (use-package helm-swoop
;;   :ensure t
;;   :bind ("C-s" . helm-swoop)
;;   :config
;;   (setq helm-swoop-split-with-multiple-windows t
;;         helm-swoop-use-fuzzy-match t)
;;   )

(use-package ag
  :ensure t
  :defer t)
(use-package helm-ag
  :ensure t
  :defer t)

(provide 'helm)
;;; helm.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/ledger.el
;;; ledger --- configuration for ledger-mode.

;;; Commentary:

;;; Code:

;; (autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
;; (add-to-list 'load-path
;;              (expand-file-name "/path/to/ledger/source/lisp/"))
;; (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(use-package ledger-mode
  :ensure t
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode)))

;;; ledger.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/lsp.el
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

;; (use-package lsp-mode
;;   :ensure t
;;   :commands (lsp lsp-deferred)
;;   :hook (go-mode . lsp-deferred)
;;   :init
;;   (setq lsp-keymap-prefix "s-g")
;;   ;; :bind (("s-g" . lsp-keymap-prefix))
;;   :config
;;   ;; (setq lsp-gopls-staticcheck t)
;;   ;; (setq lsp-eldoc-render-all t)
;;   ;; (setq lsp-gopls-complete-unimported t)
;;   (setq lsp-enable-file-watchers nil)
;;   ;; (setq lsp-enable-snippet nil)
;;   (setq gc-cons-threshold 100000000)
;;   (setq read-process-output-max (* 1024 1024)) ;; 1mb
;;   (setq lsp-idle-delay 1)
;;   (setq lsp-log-io nil) ; if set to true can cause a performance hit
;;   )


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
               ([remap xref-find-references]  . lsp-ui-peek-find-references)
               ("s-g n" . lsp-ui-find-next-reference)
               ("s-g p" . lsp-ui-find-prev-reference))))


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
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/magit.el
;;; magit ---- configuratio for magit

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :defer t
  :bind (("C-c i" . magit-status))
  :config
  (setq magit-diff-refine-hunk t)
  ;; Highlight whitespace changes in diffs
  (setq smerge-refine-ignore-whitespace nil)
  )

;;; magit.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/markdown.el
;;; markdown --- configuration for markdown

;;; Commentary:

;;; Code:

(defun markdown-mode-setup ()
  "Enable configurations for markdown mode."
  (set-fill-column 80))

(add-hook 'markdown-mode-hook 'markdown-mode-setup)

(provide 'markdown)
;;; markdown.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/misc.el
;;; misc --- configuration too tiny to deserve its own file. Kitchen sink.

;;; Commentary:

;;; Code:

(use-package restart-emacs
  :ensure t
  :defer t)

(use-package ssh-config-mode
  :ensure t
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package journalctl-mode
  :ensure t
  :defer t)

(setq-default js-indent-level 2)

(use-package abbrev
  :diminish abbrev-mode
  :defer t
  :config
  ;; stop asking whether to save newly added abbrev when quitting emacs
  (setq save-abbrevs nil)
  (setq-default abbrev-mode t)

  (define-abbrev-table 'global-abbrev-table
    '(
      ;; math/unicode symbols
      ("8N" "ℕ")
      ("8R" "ℝ")
      ("8Sig" "Σ")
      ("8bot" "⟂")
      ("8gam" "Γ")
      ("8in" "∈")
      ("8inf" "∞")
      ("8inr" "₹")
      ("8lam" "λ")
      ("8lar" "←")
      ("8luv" "❤️ ")
      ("8meh" "¯\\_(ツ)_/¯")
      ("8nin" "∉")
      ("8no" ":x:")
      ("8ok" "✓")
      ("8rar" "→")
      ("8rs" "₹")
      ("8sig" "σ")
      ("8smly" "☺️")
      ("8star" "★")
      ("8t" "#+TITLE:")
      ("8tau" "τ")
      ("8sec" "🚨")

      ;; email
      ("8me" "indradhanush.gupta@gmail.com")
      ("8i" "Indradhanush Gupta")

      ;; normal english words
      ("8alt" "alternative")
      ("8char" "character")
      ("8def" "definition")
      ("8bg" "background")
      ("8kb" "keyboard")
      ("8ex" "example")
      ("8env" "environment")
      ("8var" "variable")
      ("8cp" "computer")

      ;; Common words and phrases used in day to day programming
      ("8hw" "Hello, World!")
      ("8emacs" "/home/dhanush/.emacs.d/")
      ("8godev" "/home/dhanush/go/src/github.com/")

      ;; Go
      ("ife" "if err != nil {
    return err
}")
      ("ifne" "if err != nil {
    return nil, err
}")

      ;; Co-authored-by

      ("8alan" "Co-authored-by: flying-robot <71571391+flying-robot@users.noreply.github.com>")
      ("8asdine" "Co-authored-by: Asdine El Hrychy <asdine.elhrychy@gmail.com>")
      ("8joe" "Co-authored-by: ᴜɴᴋɴᴡᴏɴ <joe@sourcegraph.com>")
      ("8ryan" "Co-authored-by: Ryan Slade <ryanslade@gmail.com>")
      ("8tomas" "Co-authored-by: Tomás Senart <tomas@sourcegraph.com>")

      ;; ("8alan" "Co-authored-by: ")
      ;; ("8asdine" "Co-authored-by: Asdine El Hrychy <asdine.elhrychy@gmail.com>")
      ;; ("8joe" "Co-authored-by: ᴜɴᴋɴᴡᴏɴ <joe@sourcegraph.com>")
      ;; ("8ryan" "Co-authored-by: Ryan Slade <ryanslade@gmail.com>")
      ;; ("8tomas" "Co-authored-by: Tomás Senart <tomas@sourcegraph.com>")
      )))

(provide 'misc)
;;; misc.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/modeline.el
;;; modeline --- configuration for modeline customizations

;;; Commentary:

;;; Code:


;; Custom mode-line settings. Just some of my own tweaks added to
;; content form http://emacs-fu.blogspot.in/2011/08/customizing-mode-line.html
;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize " %b " 'face 'font-lock-keyword-face
        'help-echo (buffer-file-name)))

    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
      (propertize "%02l" 'face 'font-lock-type-face) ","
      (propertize "%02c" 'face 'font-lock-type-face)
    ") "

    '(which-function-mode ("" which-func-format "--"))

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
    "/"
    (propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))
    "] "


    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))
    "] "

    '(vc-mode vc-mode)
    ;; I would have liked to display currently active workgroup but this remains the same across all frames. :(
    ;; " "
    ;; (wg-echo-current-workgroup)
    ;; (wg-mode-line-string)
    ;; add uptime
    " "
    ;; '(:eval (propertize (emacs-uptime "Uptime:%d days")
    ;;          'face 'font-lock-preprocessor-face
    ;;          ))

    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))


(provide 'modeline)
;;; modeline.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/navigation.el
;;; navigation --- configuration for navigating in emacs.

;;; Commentary:

;;; Code:

;; Key bindings for window navigation.
(global-set-key (kbd "s-p") `windmove-up)
(global-set-key (kbd "s-n") `windmove-down)
(global-set-key (kbd "s-f") `windmove-right)
(global-set-key (kbd "s-b") `windmove-left)

;; This makes sense because s-' is bound to next-multiframe-window
(global-set-key (kbd "s-;") `previous-multiframe-window)

;; Buffer navigation.
(global-set-key (kbd "C-c n") 'next-buffer)
(global-set-key (kbd "C-c p") 'previous-buffer)
;; Toggle between two recent buffers. 
;; https://emacs.stackexchange.com/a/62504/10245
(global-set-key (kbd "C-c t") 'mode-line-other-buffer)

(global-set-key (kbd "s-u") 'revert-buffer)

;; Keyboard shortcuts to move buffers
;; https://www.emacswiki.org/emacs/buffer-move.el
(global-set-key (kbd "C-c C-c <left>") 'buf-move-left)
(global-set-key (kbd "C-c C-c <right>") 'buf-move-right)
(global-set-key (kbd "C-c C-c <up>") 'buf-move-up)
(global-set-key (kbd "C-c C-c <down>") 'buf-move-down)

(global-set-key (kbd "C-c C-c b") 'buf-move-left)
(global-set-key (kbd "C-c C-c f") 'buf-move-right)
(global-set-key (kbd "C-c C-c n") 'buf-move-up)
(global-set-key (kbd "C-c C-c p") 'buf-move-down)

;; Custom key-bindings for switching between frames to match OSX
;; shortcut of switching between windows of the same application.
(global-set-key (kbd "M-`") 'ns-next-frame)
(global-set-key (kbd "M-~") 'ns-prev-frame)

;; show-paren-mode customizations
(setq show-paren-style 'mixed)
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Smartparens
(use-package smartparens
  :ensure t
  :defer t
  :config
  (global-set-key (kbd "M-s-f") 'sp-forward-sexp)
  (global-set-key (kbd "M-s-b") 'sp-backward-sexp))

(global-set-key (kbd "M-s-a") 'beginning-of-defun)
(global-set-key (kbd "M-s-e") 'end-of-defun)

(global-subword-mode 1)

;; Yafolding
(use-package yafolding
  :ensure t
  :defer t
  :config
  (global-set-key (kbd "C-c h") 'yafolding-hide-element)
  (global-set-key (kbd "C-c s") 'yafolding-show-element)
  (global-set-key (kbd "C-c M-h") 'yafolding-hide-all)
  (global-set-key (kbd "C-c M-s") 'yafolding-show-all))

;; hs-minor-mode
;; (setq hs-minor-mode-map
;;       (let ((map (make-sparse-keymap)))
;;         ;; These bindings roughly imitate those used by Outline mode.
;;         ;; (define-key map (kbd "C-c h C-h") 'hs-hide-block)
;;         ;; (define-key map (kbd "C-c h C-s") 'hs-show-block)
;;         ;; (define-key map (kbd "C-c h M-h") 'hs-hide-all)
;;         ;; (define-key map (kbd "C-c h M-s") 'hs-show-all)
;;         ;; (define-key map (kbd "C-c h C-l") 'hs-hide-level)
;;         (define-key map (kbd "<C-return>") 'hs-toggle-hiding)
;;         ;; (define-key map [(shift mouse-2)] 'hs-mouse-toggle-hiding)
;;         map))


;; (global-set-key (kbd "<C-return>") 'nil)
;; (add-hook 'prog-mode-hook
;;           (local-set-key (kbd "C-\t") 'hs-toggle-hiding))

(add-hook 'hs-minor-mode-hook (lambda ()
  ;; (define-key hs-minor-mode-map (kbd "C-c @ C-c") nil) ;; Unmap complicated shortcut
  (define-key hs-minor-mode-map (kbd "<C-return>") 'hs-toggle-hiding))) ;; Map to Ctrl-Return for easy access

(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Multiple Line Edit mode.
(require 'multiple-line-edit)

;; Key bindings for multiple-line-edit mode.
(global-set-key (kbd "C-c e") 'mulled/edit-trailing-edges)
(global-set-key (kbd "C-c a") 'mulled/edit-leading-edges)

(use-package multiple-cursors
  :ensure t
  :defer t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

(use-package find-file-in-repository
  :ensure t
  :defer t
  :bind ("C-x f" . find-file-in-repository))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package ivy-hydra
  :ensure t
  :defer t)

;; (use-package counsel
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq-default ivy-calling "c")
;;   :bind ("C-c g" . counsel-git-grep))

(use-package helm-rg
  :ensure t
  :defer t
  ;; :bind ("C-c g" . helm-rg)
  )

(use-package rotate
  :ensure t
  :defer t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(use-package deadgrep
  :ensure t
  :defer t
  :bind ("C-c g" . deadgrep)
  )

(use-package fzf
  :ensure t
  :defer t)

;; (use-package centaur-tabs
;;   :ensure t
;;   :defer t
;;   :config

;;   (setq centaur-tabs-style "alternate")

;;   (setq centaur-tabs-set-icons t)
;;   (setq centaur-tabs-gray-out-icons 'buffer)

;;   ;; (setq centaur-tabs-plain-icons t)
;;   (setq centaur-tabs-set-bar 'left)
;;   (setq centaur-tabs-set-bar 'over)
;;   (setq centaur-tabs-set-modified-marker t)
;;   (setq centaur-tabs-modified-marker "*")

;;   ;; (setq centaur-tabs--buffer-show-groups t)
  
;;   (setq centaur-tabs-cycle-scope 'groups)

;;   (centaur-tabs-headline-match)
;;   (centaur-tabs-enable-buffer-reordering)

;;   (setq centaur-tabs-adjust-buffer-order 'left)

;;   (centaur-tabs-mode t)

;;   :bind
;;   ("C-c p" . centaur-tabs-backward-tab)
;;   ("C-c n" . centaur-tabs-forward-tab)
;;   ("C-<prior>" . centaur-tabs-backward-group)
;;   ("C-<next>" . centaur-tabs-forward-group)
;;   )

(provide 'navigation)
;;; navigation.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/osx.el
;;; osx --- OSX specific configurations.

;;; Commentary:

;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :defines mac-option-key-is-meta mac-command-key-is-meta mac-command-modifier mac-option-modifier
  :functions exec-path-from-shell-copy-env
  :defer t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "PATH")

    ;; Bugfix for Kill a line on OSX; Comment out on Linux.
    (setq save-interprogram-paste-before-kill nil)

    ;; Remap command to behave as Meta and Option as Super.
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'super)))

(provide 'osx)
;;; osx.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/python.el
;;; python --- configuration for python

;;; Commentary:

;;; Code:

;; (use-package python-mode
;;   :ensure t
;;   :defer t
;;   :config
;;   (require 'python-mode))

;; (use-package virtualenv
;;   :ensure t
;;   :defer t)

;; (use-package jedi
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)
;;   ;; (jedi:install-server)

;;   ;; redefine jedi's C-. (jedi:goto-definition)
;;   ;; to remember position, and set C-, to jump back
;;   (add-hook 'python-mode-hook
;;             '(lambda ()
;;                (local-set-key (kbd "C-.") 'jedi:goto-definition)
;;                (local-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker)
;;                ;; (local-set-key (kbd "C-c d") 'jedi:show-doc)
;;                (local-set-key (kbd "C-<tab>") 'jedi:complete)))
;;   )

;; (use-package virtualenvwrapper
;;   :ensure t
;;   :defer t
;;   :defines eshell-prompt-function project-venv-name
;;   :config
;;   (venv-initialize-interactive-shells)
;;   (venv-initialize-eshell)
;;   (setq venv-location "~/.venv/")
;;   (setq eshell-prompt-function
;;         (lambda ()
;;           (concat venv-current-name " $ ")))

;;   (add-hook 'python-mode-hook
;;             (lambda () (hack-local-variables)
;;               (venv-workon project-venv-name)))
;;   )


;; (set-register ?i "import ipdb; ipdb.set_trace()")


;; (use-package pip-requirements
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup)
;; )
;; (provide 'python)
;;; python.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/rust.el
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
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/startup.el
;;; startup --- configuration for emacs startup

;;; Commentary:

;;; Code:

;; (server-start)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Ensure that windows like magit-status split vertically instead of horizontally
(setq split-height-threshold nil)

(provide 'startup)
;;; startup.el ends here
;; ############################################################################


;; ############################################################################
;; Config file: ~/.emacs.d/config/terraform.el
;;; terraform --- configuration for terraform-mode


;;; Commentary:

;;; Code:

;; (use-package terraform-mode
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'terraform-mode-hook 'terraform-format-on-save-mode)
;;   (add-hook 'terraform-mode-hook
;;             (lambda () (local-set-key (kbd "C-M-\\") 'terraform-format-buffer)))
;;   (local-set-key (kbd "<C-return>") 'hs-toggle-hiding))

;;; terraform.el ends here
;; ############################################################################


;; ~/.emacs.d/config.el ends here
