;; load theme
;;(require 'monokai)
(load-theme 'monokai t)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode t)

;; show parent mode
(show-paren-mode t)

;; ivy mode
;;(ivy-mode t)

;; hugry delete mode
(global-hungry-delete-mode t)

;; helm mode
(helm-mode t)

;; cscope
(cscope-minor-mode t)

;; company
(global-company-mode t)

;; auto load init file
(global-auto-revert-mode t)

;; popwin
(require 'popwin)
(popwin-mode 1)

(exec-path-from-shell-initialize)

(provide 'init-packages)
