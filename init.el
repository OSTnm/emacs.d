;; package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; setting for MacOSX
(if (string-equal "darwin" (symbol-name system-type))
    (let ((path (getenv "PATH")) (part "/opt/local/bin:/opt/local/sbin:/usr/local/bin"))
      (or (string-match part path) (setenv "PATH" (concat part path)))))

;; set lisp load path
(add-to-list 'load-path "~/.emacs.d/lisp")

;; setup elim
;;(add-to-list 'load-path "~/elisp/elim")
;;(autoload 'garak "garak" nil t)

;; set env PATH
(setenv "PATH" (concat "~/.emacs.d/bin:" (getenv "PATH")))

;; set exec path
(setq exec-path (split-string (getenv "PATH") ":"))

;; set env TMPDIR
(unless (getenv "TMPDIR")
  (setenv "TMPDIR" "/tmp/emacs-$USER" t))
(setq temporary-file-directory (getenv "TMPDIR"))
(call-process "mkdir" nil nil nil "-p" temporary-file-directory)

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load-file custom-file)
