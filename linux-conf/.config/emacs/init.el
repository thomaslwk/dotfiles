;;-------------
;; (DESIGN)
;;-------------
(setq inhibit-startup-message t) ;Disable startup message 
(scroll-bar-mode -1)  ;Disable scrollbar
(tool-bar-mode -1)    ;Disable toolbar
(tooltip-mode -1)     ;Disable tooltip
(set-fringe-mode 10)  ;Set width for left and right edges
(menu-bar-mode -1)    ;Disable menu bar
;; Font 
(set-face-attribute 'default nil :font "Fira Code" :height 150)
;; Set ESC to quit 
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

;; Set theme and icons 
(use-package vscode-dark-plus-theme
  :config
  (load-theme 'vscode-dark-plus t))
(use-package all-the-icons)

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
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start search with ^

;; Minimalist modeline theme 
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 5)))

;; Rainbow delimiter
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

; Which-key (command suggestion prompt)
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

;; Helpful (Better built-in help tool)
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-funciton #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; General Package
;; Define keybinds with general, using Ctrl space for
;; special key. 
(use-package general
  :config 
  (general-create-definer thomasl/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (thomasl/leader-keys
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

;; EviL
;; Setting up Vim keybinds with Evil 
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; Use visual line notions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Hydra
;; Transient keybind for scale text
(use-package hydra)
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))
; lead
(thomasl/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text")) 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-rich-mode t)
 '(package-selected-packages
   '(hydra evil-collection evil general vscode-dark-plus-theme helpful ivy-rich which-key rainbow-delimiters use-package monokai-theme doom-modeline counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




