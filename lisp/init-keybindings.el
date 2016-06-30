(global-set-key (kbd "<f2>")
				(lambda() (interactive) (find-file "~/.emacs.d/init.el")))

;; prev 5 next 5
(global-set-key (kbd "C-M-p")
				(lambda() (interactive)
				  (previous-line 5)))

(global-set-key (kbd "C-M-n")
				(lambda() (interactive)
				  (next-line 5)))

;; help
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; avy
(global-set-key (kbd "C-'") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "M-g w") 'avy-goto-word-or-subword-1)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; multi cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; company
(define-key company-mode-map (kbd "C-:") 'company-complete)

;; helm settings
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffer-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "C-M-?") 'helm-dabbrev)

;; helm-ag
(let ((map helm-command-map))
  (define-key map (kbd "M-s g") 'helm-ag)
  (define-key map (kbd "M-s u") 'helm-ag-pop-stack))
(global-set-key (kbd "M-s a g") 'helm-ag)
(global-set-key (kbd "M-s a u") 'helm-ag-pop-stack)

;; helm-gtags
(require 'helm-gtags)
(let ((map helm-gtags-mode-map))
  (define-key map (kbd "M-.") 'helm-gtags-dwim)
  (define-key map (kbd "C-M-.") 'helm-gtags-select)
  (define-key map (kbd "M-,") 'helm-gtags-find-symbol)
  (define-key map (kbd "M-*") 'helm-gtags-pop-stack)
  (define-key map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key map (kbd "C-M-<") 'helm-gtags-previous-history)
  (define-key map (kbd "C-M->") 'helm-gtags-next-history))
(let ((map helm-command-map))
  (define-key map (kbd "g t") 'helm-gtags-find-tag)
  (define-key map (kbd "g r") 'helm-gtags-find-rtag)
  (define-key map (kbd "g s") 'helm-gtags-find-symbol)
  (define-key map (kbd "g u") 'helm-gtags-pop-stack)
  (define-key map (kbd "g f") 'helm-gtags-find-files)
  (define-key map (kbd "g l") 'helm-gtags-show-stack)
  (define-key map (kbd "g c") 'helm-gtags-create-tags)
  (define-key map (kbd "g I") 'helm-gtags-update-tags)
  (define-key map (kbd "g S") 'helm-gtags-select))

;; helm-company
(define-key company-active-map (kbd "C-:") 'helm-company)

;; imenu anywhere
(require 'imenu-anywhere)
(let ((map helm-command-map))
  (define-key map (kbd "I") 'helm-imenu-anywhere))

;; iedit
(require 'iedit)
(global-set-key (kbd "M-s e") 'iedit-mode)

;; better default region buffer
(global-set-key (kbd "C-M-\\") 'ostnm/indent-region-or-buffer)

;; org mode

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)


(provide 'init-keybindings)
