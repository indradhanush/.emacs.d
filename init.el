;;; emacs --- My emacs configuration

;;; Commentary:

;;; Code:
(package-initialize)
(server-start)
(echo-bell-mode nil)
;; (ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq next-line-add-newlines t)
(setq-default c-basic-offset 4)
;; (global-linum-mode t)
(setq column-number-mode t)
(blink-cursor-mode 0)
(savehist-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path' "/Users/dhanush/.emacs.d/lisp")
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(setq-default indent-tabs-mode nil)

(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

(load-directory "~/.emacs.d/config")

;; ;; Play sounds on OSX
;; ;; https://github.com/leoliu/play-sound-osx
;; (unless (and (fboundp 'play-sound-internal)
;;              (subrp (symbol-function 'play-sound-internal)))
;;   (require 'play-sound))

;; ;; Code from tali713 on #emacs to play sounds on C-g
;; (defvar apple-alert-directory "/System/Library/Sounds/" "System alerts")
;; (defvar apple-alerts nil "alist of alert sounds")

;; (setq apple-alerts
;;       (mapcar (lambda (s)
;;                 `(,(intern (format ":%s"
;;                                    (downcase (first (split-string s "\\.")))))
;;                   . ,(concat apple-alert-directory s)))
;;               (directory-files apple-alert-directory
;; 			       nil directory-files-no-dot-files-regexp)))

;; (setf ring-bell-function (lambda () (play-sound (list 'sound ':file (assoc-default :pop apple-alerts)))))
;; (echo-bell-mode t)


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
			 ("melpa" . "https://melpa.org/packages/")))


;; MELPA Configuration
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(package-initialize)

;;auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/dhanush/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-disable-faces nil)

;; go-mode
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(require 'go-mode-load)
;; (require 'go-flymake)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("272e45b301d3a8ffaad475191f9a406361e70b1fb60acb42354184cf290e04f5" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "86e74c4c42677b593d1fab0a548606e7ef740433529b40232774fbb6bc22c048" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d6348b760e6610995d228a907cf6e2cf31987dd336f5348b13107a025bbcaace" "f220c05492910a305f5d26414ad82bf25a321c35aa05b1565be12f253579dec6" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "61d1a82d5eaafffbdd3cab1ac843da873304d1f05f66ab5a981f833a3aec3fc0" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(echo-bell-background "gray16")
 '(echo-bell-delay 0)
 '(echo-bell-string "")
 '(fci-rule-color "gray20")
 '(flycheck-flake8-maximum-line-length 120)
 '(global-flycheck-mode t)
 '(grep-find-ignored-directories
   (quote
    ("venv" "migrations" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}")))
 '(helm-ack-base-command "ack")
 '(helm-ack-thing-at-point (quote symbol))
 '(helm-ag-base-command "ag")
 '(helm-ag-fuzzy-match t)
 '(helm-ag-insert-at-point (quote symbol))
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn$" "\\.hg$" "\\.git$" "\\.bzr$" "CVS$" "_darcs$" "_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$" "\\#*.*\\#$")))
 '(helm-ff-skip-boring-files t)
 '(helm-findutils-skip-boring-files t)
 '(helm-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(magit-set-upstream-on-push (quote dontask))
 '(magit-use-overlays nil)
 '(org-agenda-files
   (quote
    ("~/org/organizer.org" "~/org/work.org" "~/org/home.org")))
 '(org-startup-indented t)
 '(org-tags-column 130)
 '(package-selected-packages
   (quote
    (jedi-direx helm-aws helm-ag-r helm-ag highlight-symbol paren-face yas-jit yaml-mode yafolding web-mode waher-theme w3 vlf virtualenvwrapper typing twittering-mode twitter terraform-mode syslog-mode symon swoop swiper-helm sticky ssh-tunnels ssh-config-mode sr-speedbar sql-indent spotify splitjoin smartparens slime-theme scratches rw-ispell rtags restclient-helm restart-emacs request relative-buffers rect-mark railscasts-theme pyvirtualenv python-pylint python-mode pymacs pylint pyimpsort pyimport pyfmt pyflakes pydoc pycoverage py-autopep8 pretty-lambdada powerline pip-requirements php-mode persp-projectile paredit org nlinum nginx-mode names multiple-cursors modeline-posn markdown-mode+ magit lorem-ipsum keyfreq ipython imenu+ idomenu ido-ubiquitous ido-hacks ido-complete-space-or-hyphen ido-at-point idle-highlight-mode icicles httpcode highlight hideshow-org helm-swoop helm-spotify helm-smex helm-pydoc helm-projectile helm-project-persist helm-gtags helm-go-package helm-fuzzy-find helm-flymake helm-flycheck helm-ack hackernews gtags grunt grr grep-o-matic grep-a-lot gradle-mode grab-mac-link govet gotest gorepl-mode gore-mode golint golden-ratio go-stacktracer go-snippets go-scratch go-projectile go-play go-dlv go-direx go-autocomplete frame-fns foreman-mode flymake-python-pyflakes flymake-jslint flymake-go flycheck-pyflakes flx fixme-mode find-file-in-repository fill-column-indicator fic-mode exec-path-from-shell emoji-cheat-sheet-plus elpy echo-bell dockerfile-mode django-manage darktooth-theme darkroom csv-mode csharp-mode counsel color-theme clojure-mode chess caps-lock avy autopair atom-one-dark-theme ascii-art-to-unicode ampc ag)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values
   (quote
    ((project-venv-name . "soledad")
     (project-venv-name . "u1db_zmqtp")
     (project-venv-name . "imojo")
     (test-case-name . flumotion\.test\.test_component)
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(show-paren-mode t)
 '(show-paren-ring-bell-on-mismatch t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(terraform-indent-level 4)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-swoop-target-line-block-face ((t (:background "olive drab" :foreground "#222222"))))
 '(helm-swoop-target-line-face ((t (:background "steel blue" :foreground "#222222"))))
 '(helm-swoop-target-word-face ((t (:background "gray38" :foreground "#222222"))))
 '(hl-line ((t (:background "gray15"))))
 '(magit-diff-add ((t (:foreground "#008b00"))))
 '(mode-line ((t (:background "#504945" :foreground "#A89984" :box nil))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#1D2021" :foreground "#EBDBB2" :box nil :weight light))))
 '(org-date ((t (:foreground "#008b8b" :underline t))))
 '(which-func ((t (:foreground "sienna3")))))


;; Color-theme darktooth
;; This must always come after custom-set-variables so that emacs
;; doesnt keep asking if variables are safe to apply everytime we
;; launch it.
;; See: http://emacs.stackexchange.com/questions/10246/emacs-always-ask-to-trust-colour-theme-at-startup?newreg=dadffa256ee5497cb715b10e6778d859
(load-theme 'darktooth)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq show-paren-style 'expression) ; highlight entire expression
(setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression
(show-paren-mode 1)

;; Multi Scratch mode
(require 'multi-scratch)

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


;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; helm-mode configs
;; This config must always appear before the part where I am setting
;; the key binding for comment-or-uncomment-region to C-x c, because
;; that is the default for helm-mode.
;;
;; Config from http://tuhdo.github.io/helm-intro.html
;; I have some personaltweaks here.
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-c m") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source   nil ; do not move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-autoresize-mode t)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

;; (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(global-set-key (kbd "M-x") 'helm-M-x)

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x b") 'helm-mini)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(when (executable-find "ack")
  (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f"))

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(setq helm-locate-fuzzy-match t)

(global-set-key (kbd "C-c m o") 'helm-occur)

(setq helm-apropos-fuzzy-match t)

(setq helm-lisp-fuzzy-completion t)

(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)

(global-set-key (kbd "C-c f") 'helm-flycheck)

;; Make helm-find-files behave like ido-find-file
;; https://github.com/hatschipuh/ido2helm#file-navigation
(defun dwim-helm-find-files-up-one-level-maybe ()
  (interactive)
  (if (looking-back "/" 1)
      (call-interactively 'helm-find-files-up-one-level)
    (delete-backward-char 1)))

(define-key helm-read-file-map (kbd "<backsqpace>") 'dwim-helm-find-files-up-one-level-maybe)
(define-key helm-read-file-map (kbd "DEL") 'dwim-helm-find-files-up-one-level-maybe)
(define-key helm-find-files-map (kbd "<backspace>") 'dwim-helm-find-files-up-one-level-maybe)
(define-key helm-find-files-map (kbd "DEL") 'dwim-helm-find-files-up-one-level-maybe)

(defun dwim-helm-find-files-navigate-forward (orig-fun &rest args)
  "Adjust how helm-execute-persistent actions behaves, depending on context"
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
    (helm-maybe-exit-minibuffer)))

(define-key helm-map (kbd "<return>") 'helm-maybe-exit-minibuffer)
(define-key helm-map (kbd "RET") 'helm-maybe-exit-minibuffer)
(define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "<return>") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "RET") 'helm-execute-persistent-action)

(advice-add 'helm-execute-persistent-action :around #'dwim-helm-find-files-navigate-forward)

(helm-mode 1)

;; helm-swoop configuration
(require 'helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;; disable pre-input
(setq helm-swoop-pre-input-function
      (lambda () ""))

;; match only for symbol
;; (setq helm-swoop-pre-input-function
;;       (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol))))

;; If there is no symbol at the cursor, use the last used words instead.
;; (setq helm-swoop-pre-input-function
;;       (lambda ()
;;         (let (($pre-input (thing-at-point 'symbol)))
;;           (if (eq (length $pre-input) 0)
;;               helm-swoop-pattern ;; this variable keeps the last used words
;;             $pre-input))))

(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)

;; (global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-s") 'swiper)

(global-set-key (kbd "C-x g") 'counsel-git-grep)

;; ivy mode
;; (ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq magit-completing-read-function 'ivy-completing-read)

;; perspective mode for project management
(require 'perspective)
(persp-mode)
(require 'persp-projectile)

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
(setq venv-location "~/.venv/")
;; (setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format)) ;; Display venv name in mode-line.
(setq eshell-prompt-function
    (lambda ()
      (concat venv-current-name " $ ")))

(add-hook 'python-mode-hook (lambda ()
                              (hack-local-variables)
                              (venv-workon project-venv-name)))

;; autopep8 on save
(require 'py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=120"))

;; Flymake for Python.
;; Needs Pyflakes - http://pypi.python.org/pypi/pyflakes
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (add-hook 'python-mode-hook 'flymake-mode)

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

;;; Indentation for python

;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      'no-indent
    nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

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
    '(vc-mode vc-mode)

    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))

;; Some tweaking for large files that kovrik shared with me on #emacs
;; 100 mb
(setq gc-cons-threshold (* 100 1024 1024))
;; Allow font-lock-mode to do background parsing
(setq jit-lock-stealth-time 1
      jit-lock-chunk-size 1000
      jit-lock-defer-time 0.05)

;; magit keybindings
(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g c") 'magit-checkout)
(global-set-key (kbd "C-c g f") 'magit-fetch)
(global-set-key (kbd "C-c g b") 'magit-branch-manager)
(global-set-key (kbd "C-c g p") 'magit-push)
(global-set-key (kbd "C-c g m") 'magit-merge)
(global-set-key (kbd "C-c g l") 'magit-log)

;; remember-mode
(require 'remember)
;; (setq org-remember-templates
;;    '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/organizer.org")
;;      ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n  %a" "~/organizer.org")))
;; ;; (setq remember-annotation-functions '(org-remember-annotation))
;; ;; (setq remember-handler-functions '(org-remember-handler))
;; (eval-after-load 'remember
;;   '(add-hook 'remember-mode-hook 'org-remember-apply-template))
(global-set-key (kbd "C-c r") 'remember)

(setq fixme-mode 1)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(add-to-list 'auto-mode-alist
`(,(rx "requirements.in") . pip-requirements-mode))

(provide 'init)
;;; init.el ends here
