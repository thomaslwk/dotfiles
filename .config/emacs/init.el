;;-------------
;; (DESIGN)
;;-------------
(setq inhibit-startup-message t) ;Disable startup message 
(scroll-bar-mode -1)  ;Disable scrollbar
(tool-bar-mode -1)    ;Disable toolbar
(tooltip-mode -1)     ;Disable tooltip
(set-fringe-mode 10)  ;Set width for left and right edges
(menu-bar-mode -1)    ;Disable menu bar
;; Font and theme config 
(set-face-attribute 'default nil :font "Fira Code" :height 150)
(load-theme 'tango-dark)
;; Set ESC to quit - Copy vim
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Display column number count
(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line number for different modes
;; No line in org, term or shell. 
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;-------------
;; (PACKAGES)
;;-------------
;; Initialize package sources 
(require 'package)
;; Package-archive holds all different package repo
;; to pull packages from.
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize package sys for use. 
(package-initialize)
;; Check if package contents present,
;; if not refresh content. 
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
;; Install use-package if not already installed.
;; (-p) returns true or nil, used for checking
;; if statement true or false. 
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

;; Load package with require
(require 'use-package)
;; Use-package-ensure default value = nil
;; Ensure set to t, will always download
;; all required use-package by default it
;; not already installed. 
(setq use-package-always-ensure t)

;; IVY
;; Use ivy for binding setup
;; for buffer completion. 
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
;; Ivy-rich
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))
;; Counsel
;; Bind default M-x to use counsel
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . conusel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start search with ^

;; Minimalist modeline theme 
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))
;; Rainbow delimiter
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
;; Which-key (command suggestion prompt)
;; init -> will auto run everytime, regardless
;; packages get loaded or not. Allows invoke
;; the mode directly, when which-key is loaded
;; from use-package, will auto startup.
;; config -> only runs after mode is loaded.
;; Attached as a hook to mode, when mode is gets
;; loaded will auto run config. qq
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3)) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ivy-rich which-key rainbow-delimiters use-package monokai-theme doom-modeline counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
