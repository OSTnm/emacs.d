;; load theme
(require 'monokai-theme)
(load-theme 'monokai t)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode t)

;; show parent mode
(show-paren-mode t)

;; ivy mode
;;(ivy-mode t)

;; avy mode
(require 'avy)
(avy-setup-default)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; yasnippet
(yas-global-mode t)

;; projectile
(projectile-global-mode)

;; hugry delete mode
(global-hungry-delete-mode t)

;; magit
(require 'magit)

;; company
(global-company-mode t)
(setq company-show-numbers t)

;; flycheck
(require 'flycheck)
(global-flycheck-mode)

;; helm mode
(require 'helm-config)
(helm-mode t)

;; helm-gtags
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(setq helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t)

;; helm ls git
(require 'helm-ls-git)

;; imenu anywhere
(require 'imenu-anywhere)

;; irony
(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; company irony
(require 'company-irony)

;; company irony c headers
(require 'company-irony-c-headers)
(add-hook 'irony-mode-hook
		  (lambda ()
			(set (make-local-variable 'company-backend)
				 '((company-irony-c-headers company-irony)))))

;; flycheck irony
(require 'flycheck-irony)
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)

;; irony eldoc
(require 'irony-eldoc)
(add-hook 'irony-mode-hook 'irony-eldoc)

;; cscope
(require 'xcscope)
(cscope-setup)
(add-hook 'asm-mode-hook (function cscope-minor-mode))
(setq cscope-option-do-not-update-database t)

;; anaconda
(require 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

;; company anaconda
(require 'company-anaconda)
(add-hook 'anaconda-mode-hook
		  (lambda ()
			(set (make-local-variable 'company-anaconda)
				 '(company-anaconda))))

;; pyenv mode
(require 'pyenv-mode)
(add-hook 'python-mode-hook 'pyenv-mode)

;; auto load init file
(global-auto-revert-mode t)

;; popwin
(require 'popwin)
(popwin-mode 1)

;; exec path from shell
(exec-path-from-shell-initialize)


(provide 'init-packages)
