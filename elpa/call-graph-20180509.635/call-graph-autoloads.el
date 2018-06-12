;;; call-graph-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "call-graph" "call-graph.el" (23326 26647 0
;;;;;;  0))
;;; Generated autoloads from call-graph.el

(autoload 'call-graph "call-graph" "\
Generate `call-graph' for FUNC / func-at-point / func-in-active-rigion.
With prefix argument, discard cached data and re-generate reference data.

\(fn &optional FUNC)" t nil)

(autoload 'call-graph-mode "call-graph" "\
Major mode for viewing function's `call graph'.
\\{call-graph-mode-map}

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; call-graph-autoloads.el ends here
