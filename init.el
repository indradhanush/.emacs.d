;; General settings
(server-start)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq next-line-add-newlines t)
(setq-default c-basic-offset 4)
(global-linum-mode t)
(setq column-number-mode t)
(blink-cursor-mode 0)
(savehist-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path' "/Users/dhanush/.emacs.d/lisp")
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Bind M-x to smex
(global-set-key (kbd "M-x") 'smex)

;; Bugfix for Kill a line on OSX; Comment out on Linux.
(setq save-interprogram-paste-before-kill nil)

;; Remapping Command to behave as Meta and Option as Super.
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'super
      )

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("ELPA" . "http://tromey.com/elpa/")
                         ("SC"  . "http://joseito.republika.pl/sunrise-commander/")))

;; MELPA Configuration
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;;auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/dhanush/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-disable-faces nil)

;; go-mode

(require 'go-mode-load)
(require 'go-flymake)
;; (load "$GOPATH/src/github.com/dougm/goflymake/go-flycheck.el")
(require 'go-flycheck)
(require 'go-autocomplete)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-k") 'godoc)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-.") 'godef-jump)))

;; golint
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; Hide Scroll Bar
(scroll-bar-mode -1)

;; Hide Tool Bar
(tool-bar-mode -1)

;; Hide Menu Bar
(menu-bar-mode -1)

;; HideShow Mode
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Folding Mode
;; (global-semantic-folding-mode t)

;; Show Speedbar
;; (speedbar 1)

;; Backspace settings
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Color-theme darktooth
(load-theme 'darktooth)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes (quote ("a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "86e74c4c42677b593d1fab0a548606e7ef740433529b40232774fbb6bc22c048" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d6348b760e6610995d228a907cf6e2cf31987dd336f5348b13107a025bbcaace" "f220c05492910a305f5d26414ad82bf25a321c35aa05b1565be12f253579dec6" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "61d1a82d5eaafffbdd3cab1ac843da873304d1f05f66ab5a981f833a3aec3fc0" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(grep-find-ignored-directories (quote ("venv" "migrations" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors (--map (solarized-color-blend it "#fdf6e3" 0.25) (quote ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(hl-bg-colors (quote ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors (quote ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values (quote ((project-venv-name . "soledad") (project-venv-name . "u1db_zmqtp") (project-venv-name . "imojo") (test-case-name . flumotion\.test\.test_component) (whitespace-line-column . 80) (lexical-binding . t))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#c85d17") (60 . "#be730b") (80 . "#b58900") (100 . "#a58e00") (120 . "#9d9100") (140 . "#959300") (160 . "#8d9600") (180 . "#859900") (200 . "#669b32") (220 . "#579d4c") (240 . "#489e65") (260 . "#399f7e") (280 . "#2aa198") (300 . "#2898af") (320 . "#2793ba") (340 . "#268fc6") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Multi Scratch mode
(require 'multi-scratch)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#504945" :foreground "#A89984" :box nil))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#1D2021" :foreground "#EBDBB2" :box nil :weight light))))
 '(which-func ((t (:foreground "sienna3")))))

;; Desktop Mode
;; (desktop-save-mode 1)

;; Rename both file and buffer
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; Key binding for rename-file-and-buffer
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)

;; Key bindings for window navigation.
(global-set-key (kbd "s-p") `windmove-up)
(global-set-key (kbd "s-n") `windmove-down)
(global-set-key (kbd "s-f") `windmove-right)
(global-set-key (kbd "s-b") `windmove-left)
;; This makes sense because s-' is bound to next-multiframe-window
(global-set-key (kbd "s-;") `previous-multiframe-window)

;; Multiple Line Edit mode.
(require 'multiple-line-edit)

;; Key bindings for multiple-line-edit mode.
(global-set-key (kbd "C-c e") 'mulled/edit-trailing-edges)
(global-set-key (kbd "C-c a") 'mulled/edit-leading-edges)

;; ws-trim-mode - Auto remove trailing-whitespace with version-contol
;; in mind. :)
(require 'ws-trim)
(global-ws-trim-mode 1)

;; Protobuf-mode
(require 'protobuf-mode)

;; Increment number by 1
(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0123456789")
      (or (looking-at "[0123456789]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

;; Keybinding for increment-number-at-point
(global-set-key (kbd "C-c +") 'increment-number-at-point)


(defun decrement-number-at-point ()
      (interactive)
      (skip-chars-backward "0123456789")
      (or (looking-at "[0123456789]+")
          (error "No number at point"))
      (replace-match (number-to-string (1- (string-to-number (match-string 0)) ))))

(global-set-key (kbd "C-c -") 'decrement-number-at-point)

;; Highlight 80+
;; (require 'highlight-80+)

;; Fill Column Indicator
(require 'fill-column-indicator)
(setq fci-rule-color "gray15")
;; (setq fci-rule-column 100)
(setq fci-rule-column 120)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; Find file in project root
(require 'find-file-in-project)
(global-set-key (kbd "C-c M-f") 'find-file-in-project)

;; Ansi colors for shell-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(global-auto-revert-mode 1)
(global-hl-line-mode)
(set-face-background hl-line-face "gray15")
(set-cursor-color "#ffffff")

;; Python Configuration

;; Virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "/venv/")
;; (setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format)) ;; Display venv name in mode-line.
(setq eshell-prompt-function
    (lambda ()
      (concat venv-current-name " $ ")))

(add-hook 'python-mode-hook (lambda ()
                              (hack-local-variables)
                              (venv-workon project-venv-name)))

;; Flymake for Python.
;; Needs Pyflakes - http://pypi.python.org/pypi/pyflakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'python-mode-hook 'flymake-mode)

;; jedi config
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; redefine jedi's C-. (jedi:goto-definition)
;; to remember position, and set C-, to jump back
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'jedi:goto-definition)
             (local-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)
             (local-set-key (kbd "C-<tab>") 'jedi:complete)))

;; Buffer navigation.
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)

;; Disable auto-wrap in html mode
(defun custom-html-mode-hook ()
  (auto-fill-mode -1))

(add-hook 'html-mode-hook 'custom-html-mode-hook)

;; Custom key-bindings for switching between frames to match MacOSX
;; shortut of switching between windows of the same application.
(global-set-key (kbd "M-`") 'ns-next-frame)
(global-set-key (kbd "M-~") 'ns-prev-frame)

(put 'set-goal-column 'disabled nil)

;; Initialize register
(set-register ?i "import ipdb; ipdb.set_trace()")

;; recentf-mode
(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)
(put 'scroll-left 'disabled nil)

;; disable color-theme across frames
(set-variable 'color-theme-is-global nil)

(global-set-key (kbd "C-x c") 'comment-or-uncomment-region)
(global-set-key (kbd "M-s-a") 'beginning-of-defun)
(global-set-key (kbd "M-s-e") 'end-of-defun)

;; multiple-cursors-mode
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; smartparens
(require 'smartparens)
(global-set-key (kbd "M-s-f") 'sp-forward-sexp)
(global-set-key (kbd "M-s-b") 'sp-backward-sexp)

(global-set-key (kbd "C-x f") 'find-file-in-repository)

;; yafolding-mode
(yafolding-mode 1)
(global-set-key (kbd "C-c h") 'yafolding-hide-element)
(global-set-key (kbd "C-c s") 'yafolding-show-element)
(global-set-key (kbd "C-c M-h") 'yafolding-hide-all)
(global-set-key (kbd "C-c M-s") 'yafolding-show-all)

;; Custom mode-line settings. Just some of my own tweaks added to
;; content form http://emacs-fu.blogspot.in/2011/08/customizing-mode-line.html
;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize " %b " 'face 'font-lock-keyword-face
        'help-echo (buffer-file-name)))

    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
      (propertize "%02l" 'face 'font-lock-type-face) ","
      (propertize "%02c" 'face 'font-lock-type-face)
    ") "

    '(which-function-mode ("" which-func-format "--"))

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
    "/"
    (propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))
    "] "


    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))
    "] "

    ;; add the time, with the date and the emacs uptime in the tooltip
    '(:eval (propertize (format-time-string "%a %d-%b,%Y %H:%M")
              'help-echo
              (concat (format-time-string "%c; ")
                      (emacs-uptime "Uptime:%hh"))))
    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))
