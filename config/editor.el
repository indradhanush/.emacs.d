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
(scroll-bar-mode -1)

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

(set-face-attribute 'default nil :height 90)
;; (set-face-attribute 'default nil :width 'normal)
;; (set-face-attribute 'default nil :weight 'normal)

(defun pairing-mode ()
  "Customize editor look and feel to make it easy for the person on the other side of the network."
  (interactive)
  (set-face-attribute 'default (selected-frame) :height 120)
  (linum-mode))

(defun unpairing-mode ()
  "Customize editor look and feel to make it easy for the person on the other side of the network."
  (interactive)
  (set-face-attribute 'default nil :height 95)
  (global-linum-mode 0))

(defun standalone-mode ()
  "Customize editor look and feel when working only on the laptop."
  (interactive)
  (set-face-attribute 'default nil :height 90))

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
