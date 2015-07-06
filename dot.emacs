(add-to-list 'load-path "~/.emacs.d/lisp")
(progn (cd "~/.emacs.d") (normal-top-level-add-subdirs-to-load-path))

(when (>= emacs-major-version 24)
   (require 'package)

   (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
   ;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
   (package-initialize)

   (when (not package-archive-contents)
   (package-refresh-contents))

   (defvar my-packages '(
                       autopair
                       yasnippet
                       ;;auto-complete
                       fuzzy
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
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes t)
 '(display-time-mode t)
 '(fci-rule-color "#eee8d5")
 '(haskell-font-lock-symbols nil)
 '(haskell-mode-hook (quote (turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indent turn-on-haskell-indentation)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nil nil t)
 '(safe-local-variable-values (quote ((haskell-process-use-ghci . t) (haskell-indent-spaces . 4) (whitespace-line-column . 80) (lexical-binding . t))))
 '(syslog-debug-face (quote ((t :background unspecified :foreground "#2aa198" :weight bold))))
 '(syslog-error-face (quote ((t :background unspecified :foreground "#dc322f" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#859900"))))
 '(syslog-info-face (quote ((t :background unspecified :foreground "#268bd2" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#b58900"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#d33682"))))
 '(syslog-warn-face (quote ((t :background unspecified :foreground "#cb4b16" :weight bold))))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#b58900") (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200") (160 . "#8E9500") (180 . "#859900") (200 . "#729A1E") (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79") (280 . "#2aa198") (300 . "#299BA6") (320 . "#2896B5") (340 . "#2790C3") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))


;; other custom settings:
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
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; Set up python-mode
;;(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.1/")
;;(add-to-list 'load-path py-install-directory)

;; this will show method signatures while typing
;; (setq py-set-complete-keymap-p t)
;; (setq py-shell-name "python")  
;; (require 'python-mode)
;; activate the virtualenv where Pymacs is located
;;(virtualenv-workon "default/")
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; pyflakes flymake integration
;; http://stackoverflow.com/a/1257306/347942
;;(when (load "flymake" t)
;;  (defun flymake-pyflakes-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list "pycheckers" (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pyflakes-init)))
;;(add-hook 'python-mode-hook 'flymake-mode)

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

;;; ruby
(require 'rspec-mode)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(add-to-list 'load-path "~/.emacs.d/enhanced-ruby-mode") ; must be added after any path containing old ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)
(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
;;(add-hook 'robe-mode-hook 'robe-ac-setup)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
;; MK (add-hook 'after-init-hook 'inf-ruby-switch-setup)

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
