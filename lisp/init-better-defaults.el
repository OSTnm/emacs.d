(setq ring-bell-function 'ignore)

;; show linum
(global-linum-mode 1)

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

;; better indent region
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-current-buffer
	(if (region-active-p)
		(progn (indent-region (region-beginning) (region-end))
			   (message "indent region edit by ostnm"))
	  (progn (indent-buffer)
			 (message "indent buffer edit by ostnm")))))

(provide 'init-better-defaults)
