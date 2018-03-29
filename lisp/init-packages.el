;; load theme
(require 'monokai-theme)
(load-theme 'monokai t)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode t)

;; show parent mode
(show-paren-mode t)
;; (defadvice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))

;; smart parent
(require 'smartparens)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "`" nil :actions nil)

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
;; (require 'xcscope)
;; (cscope-setup)
;; (add-hook 'asm-mode-hook (function cscope-minor-mode))
;; (setq cscope-option-do-not-update-database t)

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

;; web mode
(require 'web-mode)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; org-pomodoro
(require 'org-pomodoro)

;; column enforce mode
(require 'column-enforce-mode)
(add-hook 'c-mode-hook 'column-enforce-mode)

;; ecb for c
;; (require 'ecb)

;; rainbow-delimiters-mode
(require 'rainbow-delimiters)
(add-hook 'c-mode-hook 'rainbow-delimiters-mode)
(add-hook 'java-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)

;; rainbow-identifier-mode
(require 'rainbow-identifiers)
;; (add-hook 'c-mode-hook 'rainbow-identifiers-mode)

(defun ostnm/rainbow-identifiers-predefined-choose-face (hash)
  "Use HASH to choose one of the `rainbow-identifiers-identifier-N' faces."
  (intern-soft "rainbow-identifiers-identifier-9"))
;; (setq rainbow-identifiers-predefined-choose-face ostnm/rainbow-identifiers-predefined-choose-face)


;; gradle&&eclim need to be installed manually
;; eclim for java

;; noted that bydefault eclim.bin only set symlink "eclimd" inside eclipse, need to set symlink "eclim" manually

(require 'eclim)
(add-hook 'java-mode-hook 'eclim-mode)

;; gradle-mode for java
(require 'gradle-mode)
;; build.gradle for java
;; project.clj  for clojure
(add-hook 'java-mode-hook '(lambda() (gradle-mode 1)))

;; company-emacs-eclim for java
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

;; imenu list
(require 'imenu-list)
(add-hook 'c-mode-hook 'imenu-list-minor-mode)

;; cider
;; clojure - lein new foo to create new project
;; cider-jack-in to create repl server to get interactive interface
(unless (package-installed-p 'cider)
  (package-install 'cider))
(require 'cider-mode)

(defvar cmd nil nil)
(defvar cflow-buf nil nil)
(defvar cflow-buf-name nil nil)

(require 'cflow-mode)
(defun ostnm/cflow-function (function-name)
  "Get call graph of inputed function. "
  (interactive "sFunction name:\n")
  (setq cmd (format "cflow  -b --main=%s %s" function-name buffer-file-name))
  (setq cflow-buf-name (format "**cflow-%s:%s**"
                               (file-name-nondirectory buffer-file-name)
                               function-name))
  (setq cflow-buf (get-buffer-create cflow-buf-name))
  (set-buffer cflow-buf)
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert (shell-command-to-string cmd))
  (pop-to-buffer cflow-buf)
  (goto-char (point-min))
  (cflow-mode)
  )

(provide 'init-packages)
