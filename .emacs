(add-to-list 'load-path "~/.emacs.d/lisp")
(progn (cd "~/.emacs.d") (normal-top-level-add-subdirs-to-load-path))

; manage packages
(load "~/.emacs.d/startup/packages.lisp")

; ------------------------------------------
; startup options
(load "~/.emacs.d/startup/global.el")

; --------------------------------------------
; modify env
(setenv "PATH" (concat "/Users/mkowalik/bin:/usr/local/bin:" (getenv "PATH")))
(exec-path-from-shell-initialize)
(setq mac-command-modifier 'super)


; --------------------------------------------
;; editor customization:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("37ba833442e0c5155a46df21446cadbe623440ccb6bbd61382eb869a2b9e9bf9" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#323342" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#323342" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (go-autocomplete exec-path-from-shell auto-package-update yaml-mode terraform-mode darkokai-theme ## elpy yasnippet python-mode projectile material-theme fuzzy flymake-cursor autopair auto-complete)))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(safe-local-variable-values
   (quote
    ((whitespace-line-column . 80)
     (lexical-binding . t))))
 '(weechat-color-list
   (unspecified "#242728" "#323342" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))

; --------------------------------------------
; set font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :slant normal :weight normal :height 110 :width normal)))))


;; other custom settings:
(global-set-key [f4] 'goto-line)


; --------------------------------------------
;; autocomplete
(load "~/.emacs.d/startup/autoconfig.el")

;; Set up python-mode
;; (elpy-enable)

;; -------------------------------------------
;; programming languages
(load "~/.emacs.d/startup/languages.el")


;; and flymake-coursor on top of it:
(require 'flymake-cursor)

 (when (eq system-type 'windows-nt)
   (setq-default comint-process-echoes 'on))


(require 'tramp)
(setq tramp-auto-save-directory "/tmp")


; --------------------------------------------
; projectile and ivy (fuzzy completion)
(ivy-mode 1)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
(setq projectile-completion-system 'ivy)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)


; color theme
(load-theme 'darkokai t)
;;(load-theme 'material-light t)


; move between windows:
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window
