(global-set-key (kbd "<f2>") 
		(lambda() (interactive) (find-file "~/.emacs.d/init.el")))


;; prev 5 next 5
(global-set-key (kbd "C-M-p") 
		(lambda() (interactive)
		  (previous-line 5)))

(global-set-key (kbd "C-M-n") 
		(lambda() (interactive) 
		  (next-line 5)))

;; helm settings
(global-set-key (kbd "M-x") 'helm-M-x)


;; help
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(provide 'init-keybindings)
