(when (>= emacs-major-version 24)
   (require 'package)

   ;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
   (package-initialize)

   (when (not package-archive-contents)
   (package-refresh-contents))

   (defvar my-packages '(
                       autopair
                       yasnippet
                       auto-complete
                       fuzzy
		       flymake-cursor
		       ivy
		       python-mode
		       material-theme
		       elpy
		       projectile
		       terraform-mode
		       org
		       ; golang
		       go-mode
		       exec-path-from-shell
		       go-autocomplete
		       flymake-go
		       neotree
                       )
   "A list of packages to ensure are installed at launch.")

   (dolist (p my-packages)
     (when (not (package-installed-p p))
       (package-install p)))
)
