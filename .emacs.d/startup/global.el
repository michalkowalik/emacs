;; global options

(setq inhibit-splash-screen t
      inhibit-splash-screen t
      column-number-mode t
      initial-scratch-message nil
      line-number-mode t
      make-backup-files nil
      blink-cursor-mode nil)

(tool-bar-mode -1)
(ido-mode t)
(global-linum-mode 1)
(display-time)
(autopair-global-mode)
(menu-bar-mode)
(yas-global-mode 1)


;; replace 'yes or no' with sigle stroke
(defalias 'yes-or-no-p 'y-or-n-p)


;; highlight brackets
(show-paren-mode t)

;; fix dired on macOS
(setq dired-use-ls-dired t
      insert-directory-program "/usr/local/bin/gls")
