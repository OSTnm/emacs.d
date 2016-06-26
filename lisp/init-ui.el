;; close tool bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; close splash screen
(setq inhibit-splash-screen 1)

;; set font
(font-lock-add-keywords
 'c-mode
 '(("\\<\\(\\sw+\\) ?(" l 'font-lock-function-name-face)))


(provide 'init-ui)
