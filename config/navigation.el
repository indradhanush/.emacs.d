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
  :config
  (global-set-key (kbd "M-s-f") 'sp-forward-sexp)
  (global-set-key (kbd "M-s-b") 'sp-backward-sexp))

;; Yafolding
(use-package yafolding
  :ensure t
  :config
  (global-set-key (kbd "C-c h") 'yafolding-hide-element)
  (global-set-key (kbd "C-c s") 'yafolding-show-element)
  (global-set-key (kbd "C-c M-h") 'yafolding-hide-all)
  (global-set-key (kbd "C-c M-s") 'yafolding-show-all))

;; Multiple Line Edit mode.
(require 'multiple-line-edit)

;; Key bindings for multiple-line-edit mode.
(global-set-key (kbd "C-c e") 'mulled/edit-trailing-edges)
(global-set-key (kbd "C-c a") 'mulled/edit-leading-edges)

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

(use-package find-file-in-repository
  :ensure t
  :bind ("C-x f" . find-file-in-repository))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package counsel
  :ensure t
  :bind ("C-c g" . counsel-git-grep))

(provide 'navigation)
;;; navigation.el ends here
