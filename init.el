(global-linum-mode t)
(global-set-key  (kbd "C-c C-g")  'goto-line)
;;(global-set-key [mouse-1] 'dired-find-file)

;;(define-key dired-mode-map [mouse-1] 'dired-find-file)


(setq default-buffer-file-coding-system 'utf-8)
;; package mange
(when 
    (require 'package) 
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t) 
  (package-initialize))
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;;(when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))
;;
;;(let ((path (shell-command-to-string ". ~/.bashrc; echo -n $PATH")))
;;  (setenv "PATH" path)
;;  (setq exec-path
;;        (append
;;         (split-string-and-unquote path ":")
;;         exec-path)))
;;

;;(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
;;(set-variable 'shell-command-switch "-ic")


;; Enable mouse support  emacs version 24.5.1
(unless window-system 
  (require 'mouse) 
  (xterm-mouse-mode t) 
  (global-set-key [mouse-4] 
		  (lambda () 
		    (interactive) 
		    (scroll-down 1))) 
  (global-set-key [mouse-5] 
		  (lambda () 
		    (interactive) 
		    (scroll-up 1))) 
  (defun track-mouse (e)) 
  (setq mouse-sel-mode t))




;; auto save

(setq backup-by-copying nil)
(setq make-backup-files nil)


(put 'upcase-region 'disabled nil)


(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-use-git-grep 1)
(global-set-key [f5] 'projectile-find-file)


(require 'projectile-speedbar)

(setq projectitle-speedbar-open-current-buffer-in-tree nil)
(setq sr-speedbar-right-side t)
;;(speedbar-frame-mode)
(speedbar-add-supported-extension ".go")
(speedbar-add-supported-extension ".py")
;;(global-set-key [f6] 'speedbar-toggle)
;;(global-set-key [f6] 'sr-speedbar-toggle)
(global-set-key [f9] 'projectile-speedbar-toggle)



;; neo tree
(when 
    (require 'neotree)
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;(global-set-key [f8] 'neotree-toggle)
  (setq neo-window-width 45) 
  (setq neo-window-fixed-size nil) 
  (setq neo-vc-integration  '(face char)) 
  (setq neo-smart-open t) 
  (setq neo-theme 
	(if (display-graphic-p) 
	    'icons
	  'arrow)))

;;;; neo tree auto resize
;;(add-hook 'neo-change-root-hook
;;          (lambda () (neo-buffer--with-resizable-window
;;                 (let ((fit-window-to-buffer-horizontally t))
;;                   (fit-window-to-buffer)))))


(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir () 
  "Open NeoTree using the git root." 
  (interactive) 
  (let ((project-dir (projectile-project-root)) 
	(file-name (buffer-file-name))) 
    (neotree-toggle) 
    (if project-dir 
	(if (neo-global--window-exists-p) 
	    (progn 
	      (neotree-dir project-dir) 
	      (neotree-find file-name))) 
      (message "Could not find git project root."))))
(global-set-key [f8] 'neotree-project-dir)





(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-forward)
(global-set-key [(meta k)] 'tabbar-backward)



;; 主题


;; Run GUI Only
(when  (display-graphic-p) 
  (require 'all-the-icons) 
  (insert (all-the-icons-icon-for-file "foo.js")) 
  (all-the-icons-octicon "file-binary")	;; GitHub Octicon for Binary File
  (all-the-icons-faicon  "cogs")	;; FontAwesome icon for cogs
  (all-the-icons-wicon   "tornado")	;; Weather Icon for tornado
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (propertize (all-the-icons-octicon "package") 'face 
	      `(:family ,(all-the-icons-octicon-family) 
			:height 1.2)
	      'display '(raise -1.1))

  ;;(load-theme 'zenburn t)
  )
;;(define-key dired-mode-map [mouse-1] 'dired-find-file)
(if (display-graphic-p) 
    (load-theme 'zenburn t) 
  (load-theme 'zenburn t)	    ;termail 下的主题
  (scroll-bar-mode -1)		    ;termail下用来启动windows 尺寸缩放
  )



;; golang
(defun my-golang-mode-hook () 
  (go-eldoc-setup) 
  (set (make-local-variable 'company-backends) 
       '(company-go))
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports") 
  (if (not (string-match "go" compile-command)) 
      (set (make-local-variable 'compile-command) "go build -v "))

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
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook 'go-mode-hook 'my-golang-mode-hook)



;; java

;;(add-hook 'java-mode-hook 'android-mode)

(defun my-java-mode-hook ()

  ;;(setq eclim-eclipse-dirs (expand-file-name "~/eclipse/java-oxygen/eclipse/eclipse"))
  ;;(setq eclim-executable (expand-file-name "~/.p2/pool/plugins/org.eclim_2.7.2/bin/eclim"))
  ;;(setq eclimd-defualt-workspace (expand-file-name "~/MacbookLocal/java"))
  ;;(setq help-at-pt-display-when-idle t)
  ;;(setq help-at-pt-timer-delay 0.5)
  ;;(setq eclim-use-yasnippet t)
  ;;(android-mode t)
  ;;(eclim-mode t)
  ;;(setq eclim-auto-save t)
  ;;(set eclimd-autostart t)
  ;;(company-emacs-eclim-setup)
  ;;(global-eclim-mode)
  ;; meghanada-mode on
  (meghanada-mode) 
  (flycheck-mode) 
  (android-mode) 
  (gradle-mode) 
  (setq c-basic-offset 2) 
  (add-hook 'before-save-hook 'meghanada-code-beautify-before-save) 
  (setq meghanada-java-path "java") 
  (setq android-mode-avd "api23") 
  (local-set-key (kbd "C-c c") 'meghanada-run-task) 
  (local-set-key (kbd "C-c i") 'android-gradle-installDebug) 
  (local-set-key (kdb "C-c u") 'android-gradle-uninstallDebug) 
  (local-set-key (kbd "M-.") 'meghanada-jump-declaration) 
  (add-hook 'before-save-hook 'meghanada-code-beautify-before-save))
(add-hook 'java-mode-hook 'my-java-mode-hook)



;; python

(defun my-python-mode-hook() 
  (elpy-mode)
  ;; (delete 'elpy-module-yasnippet elpy-modules)
  (setq elpy-rpc-backend "jedi") 
  (setq company-auto-complete t) 
  (add-hook 'elpy-mode-hook 'yapf-mode) 
  (add-hook 'before-save-hook 'elpy-format-code))
(add-hook 'python-mode-hook 'my-python-mode-hook)




(setq w3m-default-display-inline-images t)


;; 重定向C-c C-c m 为w3m 预览
(defun markdown-private-to-w3m() 
  (interactive) 
  (setq html-file-name (concat (file-name-sans-extension (buffer-file-name)) ".html")) 
  (markdown-export html-file-name) 
  (if (one-window-p) 
      (split-window)) 
  (other-window 1) 
  (w3m-find-file html-file-name))

(add-hook 'markdown-mode-hook 
	  (lambda () 
	    (local-set-key (kbd "C-c c") 'markdown-private-to-w3m)))

;; 自动代码提示
(require 'company)
(global-company-mode t)



;; html

(defun my-html-mode-hook() 
  (add-hook 'before-save-hook 'web-beautify-html-buffer))
(add-hook 'html-mode-hook 'my-html-mode-hook)



;; listp

(defun my-lisp-mode-hook() 
  (add-hook 'before-save-hook 'elisp-format-buffer))
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
