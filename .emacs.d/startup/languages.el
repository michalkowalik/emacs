; programming languages hooks configuration for emacs

; python
(elpy-enable)

; haskell


;; jslint flymake integration:
;;(require 'flymake-jslint)
;;(add-hook 'js-mode-hook 'flymake-jslint-load)
;;(setq flymake-jslint-command "~/.emacs.d/jslint.bat")



;; go
(require 'go-mode)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(require 'go-guru)
