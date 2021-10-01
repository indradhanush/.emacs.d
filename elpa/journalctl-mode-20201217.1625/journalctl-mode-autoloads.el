;;; journalctl-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "journalctl-mode" "journalctl-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from journalctl-mode.el

(autoload 'journalctl-boot "journalctl-mode" "\
Select and show boot-log.

If BOOT is provided it is the number of the boot-log to be shown.

\(fn &optional BOOT)" t nil)

(autoload 'journalctl-unit "journalctl-mode" "\
Select and show journal for UNIT.

\(fn &optional UNIT)" t nil)

(autoload 'journalctl-user-unit "journalctl-mode" "\
Select and show journal for the user-unit UNIT.

\(fn &optional UNIT)" t nil)

(autoload 'journalctl-mode "journalctl-mode" "\
Major mode for viewing journalctl output

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "journalctl-mode" '("journalctl")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; journalctl-mode-autoloads.el ends here
