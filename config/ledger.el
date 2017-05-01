;;; ledger --- configuration for ledger-mode.

;;; Commentary:

;;; Code:

;; (autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
;; (add-to-list 'load-path
;;              (expand-file-name "/path/to/ledger/source/lisp/"))
;; (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(use-package ledger-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode)))

;;; ledger.el ends here
