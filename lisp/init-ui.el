;; close tool bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; close menu bar
;; (menu-bar-mode -1)

;; set font
(set-frame-font "Inconsolata")

;; close splash screen
(setq inhibit-splash-screen 1)

;; set font
;; (font-lock-add-keywords
;;  'c-mode
;;  '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)))

(defface ostnm/c-funcall-name-face '((t (:foreground "#A6E22E" :bold t )))
  "Face used to highlight funcall")

(font-lock-add-keywords
 'c-mode
 '(("\\(?:\\.\\|->\\)\\(\\_<\\(?:\\w\\|\\s_\\)+\\_>\\)[ 	\n]*(" 1 'ostnm/c-funcall-name-face)))

(font-lock-add-keywords
 'c-mode
 '(("\\(\\_<\\(\\w\\|\\s_\\)+\\_>\\)[ 	\n]*(" 1 'ostnm/c-funcall-name-face)))

(font-lock-add-keywords
 'c-mode
 '((c-font-lock-declarations 0 'font-lock-doc-face)))

(provide 'init-ui)
