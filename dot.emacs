(add-to-list 'load-path "~/.emacs.d/lisp")
(progn (cd "~/.emacs.d") (normal-top-level-add-subdirs-to-load-path))

(when (>= emacs-major-version 24)
   (require 'package)

   (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
   (package-initialize)

   (when (not package-archive-contents)
   (package-refresh-contents))

   (defvar my-packages '(
                       autopair
                       yasnippet
                       auto-complete
                       fuzzy
		       flymake-cursor
		       grizzl
		       python-mode
		       material-theme
		       elpy
                       )
   "A list of packages to ensure are installed at launch.")

   (dolist (p my-packages)
     (when (not (package-installed-p p))
       (package-install p)))
   ;; end of when ( > = emacs-major-version 24)
   )


;; editor customization:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes t)
 '(display-time-mode t)
 '(fci-rule-color "#eee8d5")
 '(haskell-font-lock-symbols nil)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indent turn-on-haskell-indentation)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nil nil t)
 '(package-selected-packages
   (quote
    (elpy yasnippet python-mode projectile material-theme grizzl fuzzy flymake-cursor autopair auto-complete)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :slant normal :weight normal :height 96 :width normal)))))


;; other custom settings:
;;; (load-theme 'material t)
(global-linum-mode 1)
(display-time)
(global-set-key [f4] 'goto-line)


;; autopair and yas in all modes
(autopair-global-mode)
(yas-global-mode 1)

;; autocomplete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-dictionary-files (list (concat user-emacs-directory ".dict")))

(ac-config-default)
(setq ac-ignore-case nil)

;; Set up python-mode
(elpy-enable)

;; jslint flymake integration:
;;(require 'flymake-jslint)
;;(add-hook 'js-mode-hook 'flymake-jslint-load)
;;(setq flymake-jslint-command "~/.emacs.d/jslint.bat")


;; and flymake-coursor on top of it:

(require 'flymake-cursor)

 (when (eq system-type 'windows-nt)
   (setq-default comint-process-echoes 'on))

(setq line-number-mode t)


(require 'tramp)
(setq tramp-auto-save-directory "/tmp")


(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
(setq projectile-completion-system 'grizzl)

(setq column-number-mode t)
(menu-bar-mode)

; color schema?
;; (require 'monokai-theme)
;;(require 'deeper-blue-theme)
;; move between windows:
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window
