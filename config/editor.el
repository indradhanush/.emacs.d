;;; editor --- configuration for emacs editor.

;;; Commentary:

;;; Code:

(server-start)

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
;; (use-package darktooth-theme
;;   :ensure t
;;   :config
;;   (load-theme 'darktooth))

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t))


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
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)


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

(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)

(global-auto-revert-mode t)

(use-package fill-column-indicator
  :ensure t
  :functions turn-on-fci-mode
  :defer t
  :config
  (setq fci-rule-column 120)
  (turn-on-fci-mode))

(setq visible-bell 'nil)
(setq ring-bell-function 'ignore)

(toggle-truncate-lines 1)

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

(set-face-attribute 'default nil :height 115)
(set-face-attribute 'default nil :width 'normal)
(set-face-attribute 'default nil :weight 'normal)

(defun pairing-mode ()
  "Customize editor look and feel to make it easy for the person on the other side of the network."
  (interactive)
  (set-face-attribute 'default nil :height 200)
  (global-linum-mode))

(defun unpairing-mode ()
  "Customize editor look and feel to make it easy for the person on the other side of the network."
  (interactive)
  (set-face-attribute 'default nil :height 120)
  (global-linum-mode 0))

(provide 'editor)
;;; editor.el ends here
