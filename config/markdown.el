;;; markdown --- configuration for markdown

;;; Commentary:

;;; Code:

(defun markdown-mode-setup ()
  "Enable configurations for markdown mode."
  (set-fill-column 80))

(add-hook 'markdown-mode-hook 'markdown-mode-setup)

(provide 'markdown)
;;; markdown.el ends here
