;;; misc --- configuration too tiny to deserve its own file. Kitchen sink.

;;; Commentary:

;;; Code:

(use-package restart-emacs
  :ensure t)

(use-package ssh-config-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package terraform-mode
  :ensure t
  :config
  (setq-default terraform-indent-level 4))

(setq-default js-indent-level 2)

(use-package abbrev
 :diminish abbrev-mode

 :config
 ;; stop asking whether to save newly added abbrev when quitting emacs
 (setq save-abbrevs nil)
 (setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table
   '(
     ;; math/unicode symbols
     ("8N" "ℕ")
     ("8R" "ℝ")
     ("8Sig" "Σ")
     ("8bot" "⟂")
     ("8gam" "Γ")
     ("8in" "∈")
     ("8inf" "∞")
     ("8inr" "₹")
     ("8lam" "λ")
     ("8lar" "←")
     ("8luv" ":hearts:")
     ("8meh" "¯\\_(ツ)_/¯")
     ("8nin" "∉")
     ("8no" ":x:")
     ("8ok" "✓")
     ("8rar" "→")
     ("8rs" "₹")
     ("8sig" "σ")
     ("8smly" ":relaxed:")
     ("8star" "★")
     ("8t" "#+TITLE:")
     ("8tau" "τ")

     ;; email
     ("8me" "indradhanush.gupta@gmail.com")
     ("8i" "Indradhanush Gupta")

     ;; normal english words
     ("8alt" "alternative")
     ("8char" "character")
     ("8def" "definition")
     ("8bg" "background")
     ("8kb" "keyboard")
     ("8ex" "example")
     ("8env" "environment")
     ("8var" "variable")
     ("8cp" "computer")

     ;; Common words and phrases used in day to day programming
     ("8hw" "Hello, World!")
     ("8emacs" "/Users/dhanush/.emacs.d/")
     ("8mojo" "/Users/dhanush/instamojo/")
     ("8godev" "/Users/dhanush/golang/src/github.com/"))))

(provide 'misc)
;;; misc.el ends here
