;;; auto-complete ---- configuration for autocompletion using auto-complete

;;; Commentary:

;;; Code:
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)

  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

  (add-to-list 'ac-modes 'terraform-mode)

  (setq ac-use-menu-map t)
  (setq ac-menu-height 20)
  (setq ac-auto-show-menu 0.3)
  (setq ac-use-fuzzy t)
  (setq ac-disable-faces nil)
  )

(use-package ac-dabbrev
  :ensure t)

(provide 'autocomplete)
;;; autocomplete.el ends here
