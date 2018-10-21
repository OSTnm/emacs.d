;; package
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

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

(require 'cflow-mode)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load-file custom-file)
(put 'downcase-region 'disabled nil)
