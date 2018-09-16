;;; java-snippets-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "java-snippets" "java-snippets.el" (0 0 0 0))
;;; Generated autoloads from java-snippets.el

(autoload 'java-snippets-initialize "java-snippets" "\


\(fn)" nil nil)

(eval-after-load 'yasnippet '(java-snippets-initialize))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "java-snippets" '("java-snippets-root")))

;;;***

;;;### (autoloads nil nil ("java-snippets-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; java-snippets-autoloads.el ends here
