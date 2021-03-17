;;; eshell --- configuration for eshell-mode

;;; Commentary:

;;; Code:


(add-hook 'eshell-mode-hook
          (defun eshelshell-mode-setup ()
            (remove-hook 'eshell-output-filter-functions
                         'eshell-postoutput-scroll-to-bottom)
            (company-mode -1))
          )

;;; eshell.el ends here
