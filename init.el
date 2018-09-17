(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
;(package-initialize)
;;(setq toggle-truncate-lines -1)
;;(add-to-list 'load-path "~/.emacs.d/elpa")
(set-default 'truncate-lines 0)
(setq scroll-conservatively 101)
(setq mouse-wheel-scroll-amount '(1)) 
(setq mouse-wheel-progressive-speed nil)

;;\(setq toggle-truncate-lines nil)
;;(add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines nil)))

(setq make-backup-files nil)
(global-linum-mode 1)
;;(add-to-list 'load-path "~/.emacs.d/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)
(global-unset-key (kbd "C-z"))


(add-hook 'after-init-hook 'global-company-mode)

(windmove-default-keybindings)
(winner-mode t)

(defun pyvenv-autoload ()
  (require 'projectile)
  (let* ((pdir (projectile-project-root)) (pfile (concat pdir ".venv")))
    (if (file-exists-p pfile) 
        (pyvenv-workon (with-temp-buffer
                           (insert-file-contents pfile)
                           (nth 0 (split-string (buffer-string))))))))



;; 支持全文检索
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key [f5] 'grep-find)
(global-set-key (kbd "C-c C-c f") 'grep-find)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)



;; dash search 

;;(autoload 'dash-at-point "dash-at-point"
;;            "Search the word at point with Dash." t nil)
;;(global-set-key (kbd "C-c d") 'dash-at-point)

;;(add-to-list 'dash-at-point-mode-alist '(go-mode . "go"))



;; color 

(load-theme 'solarized-dark t)
;;(load-theme 'tango t)
;;
(require 'use-package)
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-subtree-line-prefix " .")
  (cond
   ((eq system-type 'darwin)
    (if (display-graphic-p)
        (setq dired-sidebar-theme 'icons)
      (setq dired-sidebar-theme 'nerd))
    (setq dired-sidebar-face '(:family "Helvetica" :height 140)))
   ((eq system-type 'windows-nt)
    (setq dired-sidebar-theme 'nerd)
    (setq dired-sidebar-face '(:family "Lucida Sans Unicode" :height 110)))
   (:default
    (setq dired-sidebar-theme 'nerd)
    (setq dired-sidebar-face '(:family "Arial" :height 140))))

  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t)

  (use-package all-the-icons-dired
    ;; M-x all-the-icons-install-fonts
    :ensure t
    :commands (all-the-icons-dired-mode)))

(use-package ibuffer-sidebar
  :ensure nil
  :commands (ibuffer-sidebar-toggle-sidebar)
  :config
  (setq ibuffer-sidebar-use-custom-font t)
  (setq ibuffer-sidebar-face `(:family "Helvetica" :height 140)))


(setq ibuffer-saved-filter-groups
      '(("Default"
         ("Hidden"  (name . "^ "))
         ("Helm"  (or (name . "^\\*helm\\|^\\*ac-mode-")))
         ("Woman"  (name . "^\\*WoMan.*\\*$"))
         ("Compile"  (name . "^*.*compil[ea].*$"))
         ("Gtalk"  (or (name . "^\\*.*jabber") (name . "*fsm-debug*")))
         ("ERC"  (mode . erc-mode))
         ("Custom"  (mode . Custom-mode))
         ("Shell"  (mode . shell-mode))
         ("Mail" (or (mode . mew-summary-mode) (mode . mew-draft-mode)(mode . mew-message-mode)))
         ("VC"  (or (name . "*magit-") (name . "^\\*vc")(mode . diff-mode) (mode . vc-dir-mode)))
         ("Magit "  (name . "*magit:"))
         ("Emacs"  (name . "^\\*.*$"))
         ("Dired"  (mode . dired-mode))
         ("Go"  (mode . go-mode))
         ("Python"  (mode . python-mode))
         ("EL"  (mode . emacs-lisp-mode))
         )))

(setq neo-window-fixed-size nil)
(global-set-key [f4] 'toggle-truncate-lines)
(global-set-key [f7] (lambda () (interactive )(multi-term)))
(global-set-key [f8] (lambda () (interactive) (neotree-toggle) ))
;(global-set-key [f8] (lambda () (interactive) (neotree)))
(global-set-key [f9] (lambda () (interactive) (ibuffer)))



(defun toggle-window-dedicated ()

"Toggle whether the current active window is dedicated or not"

(interactive)

(message 

 (if (let (window (get-buffer-window (current-buffer)))

       (set-window-dedicated-p window 

        (not (window-dedicated-p window))))

    "Window '%s' is dedicated"

    "Window '%s' is normal")

 (current-buffer)))

(global-set-key [f6] 'toggle-window-dedicated)





(setq company-tooltip-align-annotations t)
(defun my-python-mode-hook()
  (setq jedi:use-shortcuts t)
 
  (elpy-mode)
  (setq elpy-rpc-backend "jedi")
  (jedi:setup)
  (add-to-list 'company-backends 'company-jedi)
  (add-hook 'elpy-mode-hook 'yapf-mode)
  (add-hook 'elpy-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'elpy-format-code nil t)))
  (local-set-key (kbd "C-c c") 'elpy-test-run)
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)
;;; golang
;;golang
(defun my-golang-mode-hook ()
  (go-eldoc-setup)
  (set (make-local-variable 'company-backends)
       '(company-go))
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command) "go build -i -v "))

  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (setq go-test-args "-v")
  (define-key go-mode-map (kbd "C-x f") 'go-test-current-file)
  (define-key go-mode-map (kbd "C-x t") 'go-test-current-test)
  (define-key go-mode-map (kbd "C-x p") 'go-test-current-project)
  (define-key go-mode-map (kbd "C-x b") 'go-test-current-benchmark)
  (define-key go-mode-map (kbd "C-x x") 'go-run)
  (define-key go-mode-map (kbd "C-c c") 'compile)
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save nil t))

(add-hook 'go-mode-hook 'my-golang-mode-hook)


;;code/mygo/src/adexchange/dsp/rtb/source/buyerdsp/

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping t


;; Tabbar settings
(tabbar-mode 1)
(defun tabbar-buffer-tab-label (tab) 
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  
  (let ((label 
	 (if tabbar--buffer-show-groups 
	     (format "[%s]  " (tabbar-tab-tabset tab)) 
	   (format "@%s " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag 
	label
      (tabbar-shorten label (max 1 (/ (window-width) 
				      (length (tabbar-view (tabbar-current-tabset)))))))))

(set-face-attribute
 'tabbar-default nil
 :box '(:line-width 2 :color "gray20" :style nil)
 :height 1.2)

(global-set-key [(meta k)] 'tabbar-forward)
(global-set-key [(meta j)] 'tabbar-backward)
(defun my-tabbar-buffer-groups () 
  (list 
   (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs") 
	 ((eq major-mode 'dired-mode) "emacs") 
	 (t "user")
	 )))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
					;(setq tabbar-buffer-groups-function
					;      (lambda ()
					;	(list "All")))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d986619578e8a8dabb846e91c54090b82d937672f54ffa0ef247c0428813d602" "57f95012730e3a03ebddb7f2925861ade87f53d5bbb255398357731a7b1ac0e0" default))
 '(package-hidden-regexps '("\\`color-theme"))
 '(package-selected-packages
   '(dash-at-point windresize ## eyebrowse subatomic-theme solarized-theme atom-one-dark-theme multi-term tabbar-ruler ztree ibuffer-projectile ibuffer-sidebar all-the-icons-dired use-package dired-sidebar yaml-mode magit gotest company-ansible company-anaconda xclip color-theme go-eldoc tabbar yasnippet-classic-snippets yasnippet-snippets company-jedi yapfify pyenv-mode-auto pyenv-mode sr-speedbar neotree helm-projectile helm-dash elpy company-lua company-go)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
