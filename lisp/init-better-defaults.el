;; forbid ring
(setq ring-bell-function 'ignore)

;; show linum
(global-display-line-numbers-mode 1)

;; show column
(column-number-mode t)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; hl line mode
(global-hl-line-mode t)

;; close auto save
(setq auto-save-default nil)

;; close backup files
(setq make-backup-files nil)

;; trust all dir-local el
(setq enable-local-variables :all)

;; set the default c style
(setq c-default-style "linux")

;; set tab width
(setq-default tab-width 4)


;; dired mode
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(require 'dired-x)
(setq dired-dwim-target t)

;; better indent region
(defun ostnm/indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun ostnm/indent-region-or-buffer()
  (interactive)
  (save-current-buffer
	(if (region-active-p)
		(progn (indent-region (region-beginning) (region-end))
			   (message "indent region edit by ostnm"))
	  (progn (ostnm/indent-buffer)
			 (message "indent buffer edit by ostnm")))))

;; dos process
(defun ostnm/hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun ostnm/remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; tab settings
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(add-hook 'c-mode-hook (lambda () (setq indent-tabs-mode nil)))
(setq-default c-basic-offset 4)

;; delete trailing-whitespace mathching by regxp in certatin dir
(require 'find-lisp)
(defun ostnm/delete-trailing-whitespace (dir pattern)
  (interactive
   "DFind-name (directory): \nsFind-name (filename wildcard): ")
  (mapc (lambda(x)
          (switch-to-buffer (find-file x))
          ;; unset read-only-mode
          (setq buffer-read-only nil)
          (delete-trailing-whitespace (point-min) nil)
          (save-buffer))
        (find-lisp-find-files dir pattern)))

(provide 'init-better-defaults)
