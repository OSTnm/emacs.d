;;; asn1-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "asn1-mode" "asn1-mode.el" (0 0 0 0))
;;; Generated autoloads from asn1-mode.el

(autoload 'asn1-mode "asn1-mode" "\
Major mode for editing ASN.1 text files in Emacs.

\\{asn1-mode-map}
Entry to this mode calls the value of `asn1-mode-hook'
if that value is non-nil.

\(fn)" t nil)

(autoload 'gdmo-mode "asn1-mode" "\
Major mode for editing GDMO text files in Emacs.

\\{asn1-mode-map}
Entry to this mode calls the value of `asn1-mode-hook'
if that value is non-nil.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.asn1$" . asn1-mode))

(add-to-list 'auto-mode-alist '("\\.gdmo$" . gdmo-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "asn1-mode" '("asn1-mode-" "gdmo-mode-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; asn1-mode-autoloads.el ends here
