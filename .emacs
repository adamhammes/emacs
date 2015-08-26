; Add additional package sources
(require 'package)
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

; Designate F8 as toggling the directory display
(global-set-key [f8] 'neotree-toggle)

; Ensure that neotree-mode keybindings don't conflict with evil-mode
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
		
; AucTex setup
(setq TeX-parse-self t)		; Enable parse on load
(setq TeX-auto-save t)		; Enable parse on save

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
