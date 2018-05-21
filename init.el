(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)


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


(global-linum-mode 1)
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


(add-hook 'after-init-hook 'global-company-mode)


(defun pyvenv-autoload ()
  (require 'projectile)
  (let* ((pdir (projectile-project-root)) (pfile (concat pdir ".venv")))
    (if (file-exists-p pfile) 
        (pyvenv-workon (with-temp-buffer
                           (insert-file-contents pfile)
                           (nth 0 (split-string (buffer-string))))))))


(global-set-key [f8] (lambda () (interactive) (neotree)(pyvenv-autoload)))
;(global-set-key [f8] (lambda () (interactive) (neotree)))



(defun my-python-mode-hook()
  (elpy-mode)
  (setq elpy-rpc-backend "jedi")
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
  (add-hook 'before-save-hook 'gofmt-before-save nil t))

(add-hook 'go-mode-hook 'my-golang-mode-hook)


;; Change padding of the tabs
;; we also need to set separator to avoid overlapping t





;; Tabbar settings
(defun tabbar-buffer-tab-label (tab) 
  "Return a label for TAB.
That is, a string used to represent it on the tab bar." 
  (let ((label 
	 (if tabbar--buffer-show-groups 
	     (format "[%s]  " (tabbar-tab-tabset tab)) 
	   (format " %s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag 
	label
      (tabbar-shorten label (max 1 (/ (window-width) 
				      (length (tabbar-view (tabbar-current-tabset)))))))))
(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-forward)
(global-set-key [(meta k)] 'tabbar-backward)
(defun my-tabbar-buffer-groups () 
  (list 
   (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs") 
	 ((eq major-mode 'dired-mode) "emacs") 
	 (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
					;(setq tabbar-buffer-groups-function
					;      (lambda ()
					;	(list "All")))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-eldoc tabbar yasnippet-classic-snippets yasnippet-snippets company-jedi yapfify pyenv-mode-auto pyenv-mode sr-speedbar neotree helm-projectile helm-dash elpy company-lua company-go))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
