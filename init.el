(global-linum-mode t)
(global-set-key  (kbd "C-c C-g")  'goto-line)
;(global-set-key [mouse-1] 'dired-find-file)

					;(define-key dired-mode-map [mouse-1] 'dired-find-file)


(setq default-buffer-file-coding-system 'utf-8)
; package mange 
(when (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/")
	       t)
  
    (package-initialize)
    
)
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
					
;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))
;
;(let ((path (shell-command-to-string ". ~/.bashrc; echo -n $PATH")))
;  (setenv "PATH" path)
;  (setq exec-path 
;        (append
;         (split-string-and-unquote path ":")
;         exec-path)))
					;

(setq shell-file-name "bash")
(setq shell-command-switch "-ic")




; neo tree 
(when (require 'neotree)
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;;(global-set-key [f8] 'neotree-toggle)
  (setq neo-window-width 45)
  (setq neo-window-fixed-size nil)
  (setq neo-vc-integration  '(face char))
  (setq neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
)

;;;; neo tree auto resize  
;(add-hook 'neo-change-root-hook
;          (lambda () (neo-buffer--with-resizable-window
;                 (let ((fit-window-to-buffer-horizontally t))
;                   (fit-window-to-buffer)))))


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

(require 'yasnippet)


; golang
;(with-eval-after-load 'go-mode
;   (require 'go-autocomplete))

(require 'auto-complete-config)
(require 'go-autocomplete)
(ac-config-default)


(add-hook
 'go-mode-hook
 '(lambda ()
    ;; gocode
    (auto-complete-mode 1)
    (setq ac-sources '(ac-source-go))
    ;; Imenu & Speedbar
    (setq imenu-generic-expression
	  '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
	    ("func" "^func *\\(.*\\) {" 1)))
    (imenu-add-to-menubar "Index")
    ;; Outline mode
    (make-local-variable 'outline-regexp)
    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
    (outline-minor-mode 1)
    (local-set-key "\M-a" 'outline-previous-visible-heading)
    (local-set-key "\M-e" 'outline-next-visible-heading)
    ;; Menu bar
    (require 'easymenu)
    (defconst go-hooked-menu
      '("Go tools"
	["Go run buffer" go t]
	["Go reformat buffer" go-fmt-buffer t]
	["Go check buffer" go-fix-buffer t]))
    (easy-menu-define
      go-added-menu
      (current-local-map)
      "Go tools"
      go-hooked-menu)
    ;; Other
    (setq show-trailing-whitespace t)
					; Use goimports instead of go-fmt
    (setq gofmt-command "goimports")


					; Call Gofmt before saving                                                    
    (add-hook 'before-save-hook 'gofmt-before-save)

    (if (not (string-match "go" compile-command))
	(set (make-local-variable 'compile-command)
	     "go build -v "))

					; Godef jump key binding                                                      
    (local-set-key (kbd "M-.") 'godef-jump)
    (local-set-key (kbd "M-*") 'pop-tag-mark)
    (setq go-test-args "-v")
    (define-key go-mode-map (kbd "C-x f") 'go-test-current-file)
    (define-key go-mode-map (kbd "C-x t") 'go-test-current-test)
    (define-key go-mode-map (kbd "C-x p") 'go-test-current-project)
    (define-key go-mode-map (kbd "C-x b") 'go-test-current-benchmark)
    (define-key go-mode-map (kbd "C-x x") 'go-run)
    (define-key go-mode-map (kbd "C-c c") 'compile)
    ))

(require 'go-eldoc)
    (add-hook 'go-mode-hook 'go-eldoc-setup)



; mouse click superd

;(require 'mouse)
(xterm-mouse-mode t)
;(defun track-mouse (e)) 
;(setq mouse-sel-mode t)


; auto save 


(setq backup-by-copying nil)
(setq make-backup-files nil)


; git

(require 'git)
;(git-init)

; python IDE

;; elpy 
;;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20170226.1638")
;(require 'yasnippet)
;(require 'yasnippet)
;(elpy-enable)

(when (require 'elpy nil t )
  ;;(elpy-rpc-backend "jedi")
  (delete 'elpy-module-yasnippet elpy-modules)
  (setq elpy-rpc-backend "jedi")
  (add-hook 'python-mode-hook 'yapf-mode)
  (elpy-enable)
  (pyvenv-activate "~/env/python_dj")
  (elpy-use-ipython)
  )


(put 'upcase-region 'disabled nil)


(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-use-git-grep 1)
(global-set-key [f5] 'projectile-find-file)


(require 'projectile-speedbar)

(setq projectitle-speedbar-open-current-buffer-in-tree nil)
(setq sr-speedbar-right-side t)
					;(speedbar-frame-mode)
(speedbar-add-supported-extension ".go")
(speedbar-add-supported-extension ".py")
					;(global-set-key [f6] 'speedbar-toggle)
					;(global-set-key [f6] 'sr-speedbar-toggle)
(global-set-key [f9] 'projectile-speedbar-toggle)


; 平滑滚动
;defun smooth-scroll (increment)
;  (scroll-up increment) (sit-for 0.05)
;  (scroll-up increment) (sit-for 0.02)
;  (scroll-up increment) (sit-for 0.02)
;  (scroll-up increment) (sit-for 0.05)
;  (scroll-up increment) (sit-for 0.06)
;  (scroll-up increment))
;
;(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
;(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))



; template 


(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/tpl/")
(setq auto-insert-query nil) 
(setq auto-insert-alist
      (append '(
            (python-mode . "tpl.py")
	    (go-mode . "tpl.go")
            )
           auto-insert-alist))




; undo-tree 撤销树 
(when (require 'undo-tree)
  (global-undo-tree-mode)
  ;do some thing
  )


; powerline
(when (require 'powerline)
  (powerline-vim-theme)
)


; shell 
;(setq shell-file-name "/bin/bash") 
(global-set-key [f6] 'shell)
(global-set-key [f7] 'term)
(put 'set-goal-column 'disabled nil)


; scala 

(require 'protocols)
(require 'ensime)
(setq ensime-startup-snapshot-notification nil)
(setq ensime-startup-notification nil)

(require 'scala-mode)
(require 'sbt-mode)
(setq ensime-sbt-command "/opt/sbt/bin/sbt"
	sbt:program-name "/opt/sbt/bin/sbt")


; Run GUI Only 
(when  (display-graphic-p)
  (require 'all-the-icons)
  (insert (all-the-icons-icon-for-file "foo.js"))
  (all-the-icons-octicon "file-binary")  ;; GitHub Octicon for Binary File
  (all-the-icons-faicon  "cogs")         ;; FontAwesome icon for cogs
  (all-the-icons-wicon   "tornado")      ;; Weather Icon for tornado
;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

  (propertize (all-the-icons-octicon "package")
    	                'face `(:family ,(all-the-icons-octicon-family) :height 1.2)
			'display '(raise -1.1))

	
;(load-theme 'zenburn t) 
)
;(define-key dired-mode-map [mouse-1] 'dired-find-file)
(if (display-graphic-p)
    (load-theme 'zenburn t)
  (load-theme 'zenburn t)  ;termail 下的主题
  (scroll-bar-mode -1) ;termail下用来启动windows 尺寸缩放
 
  ) 




;;自动格式化代码
(dolist (command '(yank yank-pop))
(eval
`(defadvice ,command (after indent-region activate)
(and (not current-prefix-arg)
(member major-mode
'(emacs-lisp-mode
lisp-mode
clojure-mode
scheme-mode
haskell-mode
ruby-mode
rspec-mode
python-mode
c-mode
c++-mode
objc-mode
latex-mode
js-mode
plain-tex-mode))
(let ((mark-even-if-inactive transient-mark-mode))
(indent-region (region-beginning) (region-end) nil))))))




(require 'markdown-mode)
(require 'pandoc-mode)
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
;(pandoc--format-list-options 'mainfont "Noto Sans CJK TC")
;(setq markdown-command "pandoc -f markdown  -t latex --latex-engine=xelatex -V mainfont=\"Noto Sans CJK TC\"")
(require 'w3m)
(setq w3m-default-display-inline-images t)
;重定向C-c C-c m 为w3m 预览
(define-key markdown-mode-map (kbd "\C-c c")
  (lambda ()
    (interactive)
    (setq html-file-name (concat (file-name-sans-extension (buffer-file-name)) ".html"))
    (markdown-export html-file-name)
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-find-file html-file-name)))



(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-forward)
(global-set-key [(meta k)] 'tabbar-backward)
					; close default tabs，and move all files into one group
(setq tabbar-buffer-list-function
      (lambda ()
        (remove-if
	 (lambda(buffer)
	   (find (aref (buffer-name buffer) 0) " *"))
	 (buffer-list))))
(setq tabbar-buffer-groups-function
      (lambda()(list "All")))
(set-face-attribute 'tabbar-button nil)

;;set tabbar's backgroud color
;(set-face-attribute 'tabbar-default nil
;                    :background "gray"
;                    :foreground "gray30")
;(set-face-attribute 'tabbar-selected nil
;                    :inherit 'tabbar-default
;                    :background "gray"
;                    :box '(:line-width 3 :color "DarkGoldenrod") )
;(set-face-attribute 'tabbar-unselected nil
;                    :inherit 'tabbar-default
;                    :box '(:line-width 3 :color "gray"))
;
;; USEFUL: set tabbar's separator gap
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("947fc3e94f48cff9fc74288e5546042aa69037da7c0a98f9e794897fb50428d0" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "57f30407272152fad863e0bd96e89ba8ad28de372f9c27a0011e2d5691bfac5f" default)))
 '(tabbar-separator (quote (1.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
