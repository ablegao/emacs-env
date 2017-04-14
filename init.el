(global-linum-mode t)
(setq default-buffer-file-coding-system 'utf-8-unix)
; package mange 
(when (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/")
	       t)
  
    (package-initialize)
    
)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(require 'yasnippet)


; golang
;(with-eval-after-load 'go-mode
;   (require 'go-autocomplete))

(require 'auto-complete-config)
(require 'go-autocomplete)
(ac-config-default)


(defun my-go-mode-hook ()
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
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)


(defun auto-complete-for-go ()
(auto-complete-mode 1))

(add-hook 'go-mode-hook 'auto-complete-for-go)


 (require 'go-eldoc)
    (add-hook 'go-mode-hook 'go-eldoc-setup)



; neo tree 

(setq neo-smart-open t)
(when (require 'neotree)
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle)
  ;(setq neo-window-width 45)
  (setq neo-window-fixed-size nil)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
)

;;;; neo tree auto resize  
;(add-hook 'neo-change-root-hook
;          (lambda () (neo-buffer--with-resizable-window
;                 (let ((fit-window-to-buffer-horizontally t))
;                   (fit-window-to-buffer)))))


; mouse click superd

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e)) 
(setq mouse-sel-mode t)


; auto save 


(setq backup-by-copying nil)
(setq make-backup-files nil)


; git

(require 'git)
;(git-init)

; speedbar



;(speedbar-frame-mode)
;(speedbar-add-supported-extension ".go")
;(speedbar-add-supported-extension ".py")
;(global-set-key [f5] 'speedbar)


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
  (elpy-use-ipython)
  (pyvenv-activate "~/env/python_dj")
  )


(put 'upcase-region 'disabled nil)




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
(setq shell-file-name "/bin/bash") 
(global-set-key [f9] 'shell)
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
(when (display-graphic-p)
 
 ;all the icon
 (require 'all-the-icons)
   (insert (all-the-icons-icon-for-file "foo.js"))
   (all-the-icons-octicon "file-binary")  ;; GitHub Octicon for Binary File
   (all-the-icons-faicon  "cogs")         ;; FontAwesome icon for cogs
   (all-the-icons-wicon   "tornado")      ;; Weather Icon for tornado
 ;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
 
 (propertize (all-the-icons-octicon "package")
    	                'face `(:family ,(all-the-icons-octicon-family) :height 1.2)
    			            'display '(raise -1.1))
)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(global-set-key [f5] 'projectile-find-file)



;; load theme

(load-theme 'less t)
;;(load-theme 'solarized t)
