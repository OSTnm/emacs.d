;;; math-symbols-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "math-symbols" "math-symbols.el" (0 0 0 0))
;;; Generated autoloads from math-symbols.el

(autoload 'math-symbols-input-activate "math-symbols" "\
Activating Math Input method.

\(fn NAME)" nil nil)

(register-input-method "math-symbols-bold" "math" 'math-symbols-input-activate "mBo")

(autoload 'math-symbols-bold-region "math-symbols" "\
Convert REGION to bold style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-bold-string "math-symbols" "\
Convert STRING to bold style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-italic" "math" 'math-symbols-input-activate "mIt")

(autoload 'math-symbols-italic-region "math-symbols" "\
Convert REGION to italic style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-italic-string "math-symbols" "\
Convert STRING to italic style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-bold-italic" "math" 'math-symbols-input-activate "mBoIt")

(autoload 'math-symbols-bold-italic-region "math-symbols" "\
Convert REGION to bold-italic style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-bold-italic-string "math-symbols" "\
Convert STRING to bold-italic style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-script" "math" 'math-symbols-input-activate "mSc")

(autoload 'math-symbols-script-region "math-symbols" "\
Convert REGION to script style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-script-string "math-symbols" "\
Convert STRING to script style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-bold-script" "math" 'math-symbols-input-activate "mBoSc")

(autoload 'math-symbols-bold-script-region "math-symbols" "\
Convert REGION to bold-script style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-bold-script-string "math-symbols" "\
Convert STRING to bold-script style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-fraktur" "math" 'math-symbols-input-activate "mFr")

(autoload 'math-symbols-fraktur-region "math-symbols" "\
Convert REGION to fraktur style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-fraktur-string "math-symbols" "\
Convert STRING to fraktur style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-bold-fraktur" "math" 'math-symbols-input-activate "mBoFr")

(autoload 'math-symbols-bold-fraktur-region "math-symbols" "\
Convert REGION to bold-fraktur style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-bold-fraktur-string "math-symbols" "\
Convert STRING to bold-fraktur style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-double-struck" "math" 'math-symbols-input-activate "mDoSt")

(autoload 'math-symbols-double-struck-region "math-symbols" "\
Convert REGION to double-struck style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-double-struck-string "math-symbols" "\
Convert STRING to double-struck style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-sans-serif" "math" 'math-symbols-input-activate "mSaSe")

(autoload 'math-symbols-sans-serif-region "math-symbols" "\
Convert REGION to sans-serif style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-sans-serif-string "math-symbols" "\
Convert STRING to sans-serif style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-sans-serif-bold" "math" 'math-symbols-input-activate "mSaSeBo")

(autoload 'math-symbols-sans-serif-bold-region "math-symbols" "\
Convert REGION to sans-serif-bold style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-sans-serif-bold-string "math-symbols" "\
Convert STRING to sans-serif-bold style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-sans-serif-italic" "math" 'math-symbols-input-activate "mSaSeIt")

(autoload 'math-symbols-sans-serif-italic-region "math-symbols" "\
Convert REGION to sans-serif-italic style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-sans-serif-italic-string "math-symbols" "\
Convert STRING to sans-serif-italic style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-sans-serif-bold-italic" "math" 'math-symbols-input-activate "mSaSeBoIt")

(autoload 'math-symbols-sans-serif-bold-italic-region "math-symbols" "\
Convert REGION to sans-serif-bold-italic style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-sans-serif-bold-italic-string "math-symbols" "\
Convert STRING to sans-serif-bold-italic style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-monospace" "math" 'math-symbols-input-activate "mMo")

(autoload 'math-symbols-monospace-region "math-symbols" "\
Convert REGION to monospace style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-monospace-string "math-symbols" "\
Convert STRING to monospace style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-superscript" "math" 'math-symbols-input-activate "mSu")

(autoload 'math-symbols-superscript-region "math-symbols" "\
Convert REGION to superscript style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-superscript-string "math-symbols" "\
Convert STRING to superscript style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-subscript" "math" 'math-symbols-input-activate "mSu")

(autoload 'math-symbols-subscript-region "math-symbols" "\
Convert REGION to subscript style.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-subscript-string "math-symbols" "\
Convert STRING to subscript style.

\(fn STRING)" nil nil)

(register-input-method "math-symbols-tex" "math" 'math-symbols-input-activate "mt")

(autoload 'math-symbols-from-tex-region "math-symbols" "\
Convert TeX commands in REGION to math symbols.
For example, 'Phi' will be converted to '𝛷'.

\(fn FROM TO)" t nil)

(autoload 'math-symbols-to-tex-region "math-symbols" "\
Convert math symbols to TeX command in REGION.
For example, `𝒫' will be converted to `mathcal{P}'.
Optional argument UNICODE specifies to use unicode-math package.

\(fn FROM TO &optional UNICODE)" t nil)

(autoload 'math-symbols-to-tex-unicode-region "math-symbols" "\


\(fn FROM TO)" t nil)

(autoload 'math-symbols-insert "math-symbols" "\
Interactively input math characters from symbols.

\(fn NAME)" t nil)

(autoload 'math-symbols-helm "math-symbols" "\


\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "math-symbols" '("math-symbols-")))

;;;***

;;;### (autoloads nil nil ("math-symbols-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; math-symbols-autoloads.el ends here
