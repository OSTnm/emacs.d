(require 'org)

(with-eval-after-load 'org 
  (setq org-src-font-lock-fontify-block t)
  (setq org-agenda-files '("~/.emacs.d"))
  (setq org-capture-templates
		'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "schedule")
		   "* TODO [#B] %?\n  %i\n"
		   :empty-lines 1))))

(provide 'init-org)
