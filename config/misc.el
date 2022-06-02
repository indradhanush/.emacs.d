;;; misc --- configuration too tiny to deserve its own file. Kitchen sink.

;;; Commentary:

;;; Code:

(use-package restart-emacs
  :ensure t
  :defer t)

(use-package ssh-config-mode
  :ensure t
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :defer t)

(use-package journalctl-mode
  :ensure t
  :defer t)

(setq-default js-indent-level 2)

(use-package abbrev
  :diminish abbrev-mode
  :defer t
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
      ("8luv" "❤️ ")
      ("8meh" "¯\\_(ツ)_/¯")
      ("8nin" "∉")
      ("8no" ":x:")
      ("8ok" "✓")
      ("8rar" "→")
      ("8rs" "₹")
      ("8sig" "σ")
      ("8smly" "☺️")
      ("8star" "★")
      ("8t" "#+TITLE:")
      ("8tau" "τ")
      ("8sec" "🚨")

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
      ("8emacs" "/home/dhanush/.emacs.d/")
      ("8godev" "/home/dhanush/go/src/github.com/")

      ;; Go
      ("ife" "if err != nil {
    return err
}")
      ("ifne" "if err != nil {
    return nil, err
}")

      ;; Co-authored-by

      ("8alan" "Co-authored-by: flying-robot <71571391+flying-robot@users.noreply.github.com>")
      ("8asdine" "Co-authored-by: Asdine El Hrychy <asdine.elhrychy@gmail.com>")
      ("8joe" "Co-authored-by: ᴜɴᴋɴᴡᴏɴ <joe@sourcegraph.com>")
      ("8ryan" "Co-authored-by: Ryan Slade <ryanslade@gmail.com>")
      ("8tomas" "Co-authored-by: Tomás Senart <tomas@sourcegraph.com>")

      ;; ("8alan" "Co-authored-by: ")
      ;; ("8asdine" "Co-authored-by: Asdine El Hrychy <asdine.elhrychy@gmail.com>")
      ;; ("8joe" "Co-authored-by: ᴜɴᴋɴᴡᴏɴ <joe@sourcegraph.com>")
      ;; ("8ryan" "Co-authored-by: Ryan Slade <ryanslade@gmail.com>")
      ;; ("8tomas" "Co-authored-by: Tomás Senart <tomas@sourcegraph.com>")
      )))

(provide 'misc)
;;; misc.el ends here
