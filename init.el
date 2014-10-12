;; General settings
(server-start)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq next-line-add-newlines t)
(setq-default c-basic-offset 4)
(global-linum-mode t)
(setq column-number-mode t)
(add-to-list 'load-path' "/Users/dhanush/.emacs.d")

;; Bugfix for Kill a line on OSX; Comment out on Linux.
(setq save-interprogram-paste-before-kill nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; MELPA Configuration
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/dhanush/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-disable-faces nil)

;; go-mode
(require 'go-mode-load)
(require 'go-flymake)
(require 'go-autocomplete)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-k") 'godoc)))

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; Hide Scroll Bar
(scroll-bar-mode -1)

;; Hide Tool Bar
(tool-bar-mode -1)

;; Hide Menu Bar
(menu-bar-mode -1)

;; HideShow Mode
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Folding Mode
;; (global-semantic-folding-mode t)

;; Show Speedbar
;; (speedbar 1)

;; Backspace settings
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)


;; Color Theme Dark Laptop
;;(require 'color-theme)
;;(setq color-theme-is-global t)
;;(color-theme-initialize)
;; (color-theme-dark-laptop)

;; Color Theme Twilight
(load-file "~/.emacs.d/themes/color-theme-twilight.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("f220c05492910a305f5d26414ad82bf25a321c35aa05b1565be12f253579dec6" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "61d1a82d5eaafffbdd3cab1ac843da873304d1f05f66ab5a981f833a3aec3fc0" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(safe-local-variable-values (quote ((test-case-name . flumotion\.test\.test_component) (whitespace-line-column . 80) (lexical-binding . t)))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Multi Scratch mode
(require 'multi-scratch)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Desktop Mode
;; (desktop-save-mode 1)

;; Rename both file and buffer
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
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

;; Key binding for rename-file-and-buffer
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

;; Key bindings for window navigation.
(global-set-key (kbd "s-p") `windmove-up)
(global-set-key (kbd "s-n") `windmove-down)
(global-set-key (kbd "s-f") `windmove-right)
(global-set-key (kbd "s-b") `windmove-left)

;; Multiple Line Edit mode.
(require 'multiple-line-edit)

;; Key bindings for multiple-line-edit mode.
(global-set-key (kbd "C-c e") 'mulled/edit-trailing-edges)
(global-set-key (kbd "C-c a") 'mulled/edit-leading-edges)

;; ws-trim-mode - Auto remove trailing-whitespace with version-contol
;; in mind. :)
(require 'ws-trim)
(global-ws-trim-mode 1)

;; Protobuf-mode
(require 'protobuf-mode)

;; Increment number by 1
(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0123456789")
      (or (looking-at "[0123456789]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

;; Keybinding for increment-number-at-point
(global-set-key (kbd "C-c +") 'increment-number-at-point)


(defun decrement-number-at-point ()
      (interactive)
      (skip-chars-backward "0123456789")
      (or (looking-at "[0123456789]+")
          (error "No number at point"))
      (replace-match (number-to-string (1- (string-to-number (match-string 0)) ))))

(global-set-key (kbd "C-c -") 'decrement-number-at-point)

;; Highlight 80+
;; (require 'highlight-80+)

;; Fill Column Indicator
(require 'fill-column-indicator)
(setq fci-rule-color "gray15")
(setq fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; Find file in project root
(require 'find-file-in-project)
(global-set-key (kbd "C-c M-f") 'find-file-in-project)

;; Ansi colors for shell-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
