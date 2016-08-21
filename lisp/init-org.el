(require 'org)

(with-eval-after-load 'org 
  (setq org-src-font-lock-fontify-block t)
  (setq org-agenda-files '("~/.emacs.d"))
  (setq org-capture-templates
		'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "schedule")
		   "* TODO [#B] %?\n  %i\n"
		   :empty-lines 1))))

(setq org-src-fontify-natively t)
(setq org-export-html-postamble nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ;; this line activates ditaa

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))
(setq org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

(defun org-summary-todo (n-done n-not-done)
  "switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states) ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(provide 'init-org)
