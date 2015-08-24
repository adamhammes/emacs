(require 'package)
; Add additional package sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; Remember our open buffers
(desktop-save-mode 1)

; Must go before external library settings
(package-initialize)

; Turn on vim keybindings
(evil-mode 1)

; Jedi used for python autocompletion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; Flycheck + external pylint for linting
(add-hook 'after-init'hood #'global-flycheck-mode)

; Automatically pair up quotes, parentheses, etc.
(electric-pair-mode 1)
