;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "markdown-toc" "20251210.2018"
  "A simple TOC generator for markdown file."
  '((emacs         "28.1")
    (markdown-mode "2.1")
    (dash          "2.11.0")
    (s             "1.9.0"))
  :url "http://github.com/ardumont/markdown-toc"
  :commit "29e5c0f33ed026a5f993e4211f52debd7c02b3ba"
  :revdesc "29e5c0f33ed0"
  :keywords '("markdown" "toc" "tools")
  :authors '(("Antoine R. Dumont" . "(@ardumont)"))
  :maintainers '(("Antoine R. Dumont" . "(@ardumont)")
                 ("Jen-Chieh Shen" . "jcs090218@gmail.com")))
