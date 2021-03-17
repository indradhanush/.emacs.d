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
