;;; counsel-gtags-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (counsel-gtags-mode counsel-gtags-dwim counsel-gtags-update-tags
;;;;;;  counsel-gtags-create-tags counsel-gtags-pop counsel-gtags-find-file
;;;;;;  counsel-gtags-find-symbol counsel-gtags-find-reference counsel-gtags-find-definition)
;;;;;;  "counsel-gtags" "counsel-gtags.el" (22717 12736 326017 955000))
;;; Generated autoloads from counsel-gtags.el

(autoload 'counsel-gtags-find-definition "counsel-gtags" "\
Find `tagname' definition.

\(fn TAGNAME)" t nil)

(autoload 'counsel-gtags-find-reference "counsel-gtags" "\
Find `tagname' references.

\(fn TAGNAME)" t nil)

(autoload 'counsel-gtags-find-symbol "counsel-gtags" "\
Find `tagname' references.

\(fn TAGNAME)" t nil)

(autoload 'counsel-gtags-find-file "counsel-gtags" "\
Find `filename' from tagged files.

\(fn FILENAME)" t nil)

(autoload 'counsel-gtags-pop "counsel-gtags" "\
Jump back to previous point.

\(fn)" t nil)

(autoload 'counsel-gtags-create-tags "counsel-gtags" "\
Create tag files tags in `rootdir'. This command is asynchronous.

\(fn ROOTDIR LABEL)" t nil)

(autoload 'counsel-gtags-update-tags "counsel-gtags" "\
Update TAG file. Update All files with `C-u' prefix.
Generate new TAG file in selected directory with `C-u C-u'

\(fn)" t nil)

(autoload 'counsel-gtags-dwim "counsel-gtags" "\
Call the counsel-gtags command by current context(Do What I Mean)
by global --from-here option.

\(fn)" t nil)

(autoload 'counsel-gtags-mode "counsel-gtags" "\
Toggle Counsel-Gtags mode on or off.
With a prefix argument ARG, enable Counsel-Gtags mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{counsel-gtags-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("counsel-gtags-pkg.el") (22717 12736 405521
;;;;;;  635000))

;;;***

(provide 'counsel-gtags-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; counsel-gtags-autoloads.el ends here
