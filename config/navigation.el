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
(global-set-key (kbd "C-c C-c p") 'buf-move-up)
(global-set-key (kbd "C-c C-c n") 'buf-move-down)

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
