;;; magit ---- configuratio for magit

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t

  :bind (("C-c i" . magit-status))
  :config
  (setq magit-diff-refine-hunk t)
  )

;;; magit.el ends here
