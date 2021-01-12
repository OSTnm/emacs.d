;; load theme
(require 'monokai-theme)
(load-theme 'monokai t)

;; window-numbering
(require 'window-numbering)
(window-numbering-mode t)

;; show parent mode
(show-paren-mode t)

;; smart parent
(require 'smartparens)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "`" nil :actions nil)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; yasnippet
(yas-global-mode t)

;; hugry delete mode
(global-hungry-delete-mode t)

;; magit
(require 'magit)

;; company
(global-company-mode t)
(setq company-show-numbers t)
(setq company-auto-complete 'company-explicit-action-p)

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

;; auto load init file
(global-auto-revert-mode t)

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

;; column enforce mode
(require 'column-enforce-mode)
(add-hook 'c-mode-hook 'column-enforce-mode)

;; rainbow-delimiters-mode
(require 'rainbow-delimiters)
(add-hook 'c-mode-hook 'rainbow-delimiters-mode)
(add-hook 'java-mode-hook 'rainbow-delimiters-mode)

(defun ostnm/rainbow-identifiers-predefined-choose-face (hash)
  "Use HASH to choose one of the `rainbow-identifiers-identifier-N' faces."
  (intern-soft "rainbow-identifiers-identifier-9"))
;; (setq rainbow-identifiers-predefined-choose-face ostnm/rainbow-identifiers-predefined-choose-face)

;; goto-line-preview
(require 'goto-line-preview)
(global-set-key [remap goto-line] 'goto-line-preview)

;; move-text
(require 'move-text)
(move-text-default-bindings)

;; org-download
(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

;; lsp mode
(add-hook 'c-mode-hook 'lsp)
(add-hook 'cpp-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1 ;; clangd is fast
      ;; be more ide-ish
      lsp-headerline-breadcrumb-enable t)

;; lsp mode
(use-package
  lsp-mode
  :ensure t
  :defer t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :init ;;
  ;; (setq lsp-auto-configure nil)
  (setq lsp-prefer-capf t)
  (setq lsp-enable-snippet t)
  (setq lsp-enable-completion-at-point t)
  (setq lsp-keymap-prefix "C-c s")
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'c-mode-hook #'lsp)
  (setq lsp-keep-workspace-alive t)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-enable-semantic-highlighting nil)
  (setq lsp-enable-symbol-highlighting nil)
  :bind (:map lsp-mode-map
              ([remap xref-find-definitions] . lsp-find-definition)
              ([remap xref-find-references] . lsp-find-references)
              ("C-S-<down-mouse-1>" . xref-pop-marker-stack)
              ("C-S-<mouse-1>" . ignore)
              ("C-s l .:" . lsp-find-definition)
              ("C-s l ," . xref-pop-marker-stack)
              ("C-s l ?" . lsp-find-references)
              ("C-s l d" . lsp-find-declaration)
              ("C-s l i" . lsp-find-implementation)
              ("C-s l t" . lsp-find-type-definition)
              ("C-s l g" . lsp-find-definition)
              ("C-s l r" . lsp-find-references)
              ("C-s l h" . lsp-describe-thing-at-point))
  )

(use-package
  lsp-ui
  :ensure t
  :after lsp-mode
  :commands lsp-ui-mode
  :custom (lsp-ui-doc-position (quote bottom))
  ;; (lsp-ui-doc-use-webkit t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-border "orange")
  :hook (lsp-mode . lsp-ui-mode))

;; Auto complete
(use-package
  company
  :ensure t
  :defer t
  :hook (prog-mode . company-mode)
  :init ;; Don't convert to downcase.
  (setq-default company-dabbrev-downcase nil)
  :bind (("C-<tab>" . company-complete-common)
         ;;
         :map company-active-map        ;
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("C-s" . company-filter-candidates)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<return>" . company-complete-selection) ; 终端下无效
         ("RET" . company-complete-selection)      ; 终端下生效
         ;; :map company-filter-map                   ;
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<return>" . company-complete-selection) ; 终端下无效
         ("RET" . company-complete-selection)      ; 终端下生效
         :map company-search-map                   ;
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("<tab>" . company-complete-selection)
         ("TAB" . company-complete-selection)
         ("<return>" . company-complete-selection) ; 终端下无效
         ("RET" . company-complete-selection)      ; 终端下生效
         )
  :custom                               ;
  (company-minimum-prefix-length 1)
  :config                               ;
  (setq company-backends '((company-capf :with company-yasnippet)
                           (company-dabbrev-code company-keywords company-files)
                           (company-dabbrev)))
  (setq company-frontends '(company-pseudo-tooltip-frontend company-echo-metadata-frontend)))

(use-package
  yasnippet
  :ensure t
  :defer t
  :hook (company-mode . yas-minor-mode)
  :config                               ;
  (yas-reload-all))
(use-package
  yasnippet-snippets
  :ensure t
  :config (yas-reload-all))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1 ;; clangd is fast
      ;; be more ide-ish
      lsp-headerline-breadcrumb-enable t)

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

(defun ostnm/bing-dict-ee (word)
  "Get english explaination of word. "
  (interactive "sWord:\n")
  (insert (shell-command-to-string (concat "LC_CTYPE=UTF-8 translate.py " word))))

;; This is an Emacs package that creates graphviz directed graphs from
;; the headings of an org file
;; mind map
(require 'ox)
(require 'ox-org)

;; dashboard
(require 'dashboard)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(provide 'init-packages)
