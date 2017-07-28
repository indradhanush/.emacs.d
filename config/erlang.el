;;; erlang --- configuration for erlang

;;; Commentary:

;;; Code:

(setq-default erlang-root-dir "/usr/local/bin")

(add-hook 'erlang-mode-hook 'erlang-setup
          (defun erlang-setup ()
            'auto-complete-mode 1
            ))

;;; erlang.el ends here
