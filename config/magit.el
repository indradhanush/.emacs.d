;;; magit ---- configuratio for magit

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :defer t
  :bind (
         ("C-c i" . magit-status)
         ("C-c b" . magit-blame)
         )
  :config
  (setq magit-diff-refine-hunk t)
  ;; Highlight whitespace changes in diffs
  (setq smerge-refine-ignore-whitespace nil)
  )

;;; magit.el ends here
