;; less-theme.el --- A minimalistic custom theme for Emacs
;; Revision 3
;;
;; Copyright (C) 2008-2010, 2016 Jason R. Blevins <jrblevin@sdf.org>
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

(deftheme less
    "A minimalistic and mostly monochromatic color scheme inspired
by `color-theme-late-night' and the Less is More theme for vim.")

(custom-theme-set-faces
 'less

 ;; Standard font lock faces
 '(default ((t (:background "#000000" :foreground "gray70"))))
 '(bold ((t (:bold t))))
 '(italic ((t (:bold t))))
 '(underline ((t (:bold t))))
 '(variable-pitch ((t (nil))))
 '(cursor ((t (:background "yellow"))))
 '(font-lock-comment-face ((t (:bold t :foreground "dim gray"))))
 '(font-lock-comment-delimiter-face ((t (:bold t :foreground "dim gray"))))
 '(font-lock-function-name-face ((t (:foreground "gray90"))))
 '(font-lock-variable-name-face ((t (:foreground "gray90"))))
 '(font-lock-constant-face ((t (:foreground "gray90"))))
 '(font-lock-doc-string-face ((t (:foreground "gray90"))))
 '(font-lock-doc-face ((t (:foreground "gray90"))))
 '(font-lock-preprocessor-face ((t (:foreground "gray90"))))
 '(font-lock-reference-face ((t (:foreground "gray90"))))
 '(font-lock-string-face ((t (:foreground "gray90"))))
 '(font-lock-type-face ((t (:bold t :foreground "white"))))
 '(font-lock-builtin-face ((t (:bold t :foreground "white"))))
 '(font-lock-keyword-face ((t (:bold t :foreground "white"))))
 '(font-lock-warning-face ((t (:bold t :foreground "red"))))

 ;; Emacs Interface
 '(fringe ((t (:background "#111" :foreground "#444"))))
 '(header-line ((t (:background "#333" :foreground "#000"))))
 '(menu ((t (:background "#111" :foreground "#444"))))
 '(minibuffer-prompt ((t (:foreground "white"))))
 '(modeline ((t (:background "gray20" :foreground "white"))))
 '(mode-line-inactive ((t (:background "gray20" :foreground "light gray"))))
 '(region ((t (:background "light gray" :foreground "black"))))
 '(secondary-selection ((t (:background "Aquamarine" :foreground "SlateBlue"))))
 '(tool-bar ((t (:background "#111" :foreground "#777"))))
 '(tooltip ((t (:background "#333" :foreground "#777"))))
 '(widget-button-face ((t (:bold t :foreground "#888"))))
 '(widget-field-face ((t (:bold t :foreground "#999"))))

 ;; Search
 '(isearch ((t (:foreground "black" :background "red"))))
 '(isearch-lazy-highlight-face ((t (:foreground "red"))))

 ;; Parenthesis matching
 '(show-paren-match-face ((t (:foreground "black" :background "light gray"))))
 '(show-paren-mismatch-face ((t (:foreground "black" :background "red"))))

 ;; Line highlighting
 '(highlight ((t (:background "#1f1f1f" :foreground nil))))
 '(highlight-current-line-face ((t (:background "#1f1f1f" :foreground nil))))
 '(hl-line ((t (:background "#1f1f1f" :foreground nil))))

 ;; Buttons
 '(button ((t (:bold t))))
 '(custom-button-face ((t (:bold t :foreground "#999"))))

 ;; Calendar
 '(holiday-face ((t (:background "#000" :foreground "#777"))))

 ;; info, help and apropos faces
 '(info-header-node ((t (:foreground "#666"))))
 '(info-header-xref ((t (:foreground "#666"))))
 '(info-menu-5 ((t (:underline t))))
 '(info-menu-header ((t (:bold t :foreground "#666"))))
 '(info-node ((t (:bold t :foreground "#888"))))
 '(info-xref ((t (:bold t :foreground "#777"))))

 ;; gnus
 '(gnus-cite-attribution-face ((t (:foreground "#bbb"))))
 '(gnus-cite-face-1 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-2 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-3 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-4 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-5 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-6 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-7 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-8 ((t (:foreground "#aaa"))))
 '(gnus-cite-face-9 ((t (:foreground "#aaa"))))
 '(gnus-emphasis-bold ((t (:bold t))))
 '(gnus-emphasis-bold-italic ((t (:italic t :bold t))))
 '(gnus-emphasis-highlight-words ((t (:foreground "#ccc"))))
 '(gnus-emphasis-italic ((t (:italic t))))
 '(gnus-emphasis-underline ((t (:underline t))))
 '(gnus-emphasis-underline-bold ((t (:bold t :underline t))))
 '(gnus-emphasis-underline-bold-italic ((t (:italic t :bold t :underline t))))
 '(gnus-emphasis-underline-italic ((t (:italic t :underline t))))
 '(gnus-group-mail-1-empty-face ((t (:foreground "#999"))))
 '(gnus-group-mail-1-face ((t (:bold t :foreground "#999"))))
 '(gnus-group-mail-2-empty-face ((t (:foreground "#999"))))
 '(gnus-group-mail-2-face ((t (:bold t :foreground "#999"))))
 '(gnus-group-mail-3-empty-face ((t (:foreground "#888"))))
 '(gnus-group-mail-3-face ((t (:bold t :foreground "#888"))))
 '(gnus-group-mail-low-empty-face ((t (:foreground "#777"))))
 '(gnus-group-mail-low-face ((t (:bold t :foreground "#777"))))
 '(gnus-group-news-1-empty-face ((t (:foreground "#999"))))
 '(gnus-group-news-1-face ((t (:bold t :foreground "#999"))))
 '(gnus-group-news-2-empty-face ((t (:foreground "#888"))))
 '(gnus-group-news-2-face ((t (:bold t :foreground "#888"))))
 '(gnus-group-news-3-empty-face ((t (:foreground "#777"))))
 '(gnus-group-news-3-face ((t (:bold t :foreground "#777"))))
 '(gnus-group-news-4-empty-face ((t (:foreground "#666"))))
 '(gnus-group-news-4-face ((t (:bold t :foreground "#666"))))
 '(gnus-group-news-5-empty-face ((t (:foreground "#666"))))
 '(gnus-group-news-5-face ((t (:bold t :foreground "#666"))))
 '(gnus-group-news-6-empty-face ((t (:foreground "#666"))))
 '(gnus-group-news-6-face ((t (:bold t :foreground "#666"))))
 '(gnus-group-news-low-empty-face ((t (:foreground "#666"))))
 '(gnus-group-news-low-face ((t (:bold t :foreground "#666"))))
 '(gnus-header-content-face ((t (:foreground "#888"))))
 '(gnus-header-from-face ((t (:bold t :foreground "#888"))))
 '(gnus-header-name-face ((t (:bold t :foreground "#777"))))
 '(gnus-header-newsgroups-face ((t (:bold t :foreground "#777"))))
 '(gnus-header-subject-face ((t (:bold t :foreground "#999"))))
 '(gnus-signature-face ((t (:foreground "#444"))))
 '(gnus-splash-face ((t (:foreground "#ccc"))))
 '(gnus-summary-cancelled-face ((t (:background "#555" :foreground "#000"))))
 '(gnus-summary-high-ancient-face ((t (:bold t :foreground "#555"))))
 '(gnus-summary-high-read-face ((t (:bold t :foreground "#666"))))
 '(gnus-summary-high-ticked-face ((t (:bold t :foreground "#777"))))
 '(gnus-summary-high-unread-face ((t (:bold t :foreground "#888"))))
 '(gnus-summary-low-ancient-face ((t (:foreground "#444"))))
 '(gnus-summary-low-read-face ((t (:foreground "#555"))))
 '(gnus-summary-low-ticked-face ((t (:foreground "#666"))))
 '(gnus-summary-low-unread-face ((t (:foreground "#777"))))
 '(gnus-summary-normal-ancient-face ((t (:foreground "#555"))))
 '(gnus-summary-normal-read-face ((t (:foreground "#666"))))
 '(gnus-summary-normal-ticked-face ((t (:foreground "#777"))))
 '(gnus-summary-normal-unread-face ((t (:foreground "#888"))))
 '(gnus-summary-selected-face ((t (:background "#333"))))
 '(message-cited-text-face ((t (:foreground "#aaa"))))
 '(message-header-cc-face ((t (:foreground "#888"))))
 '(message-header-name-face ((t (:bold t :foreground "#777"))))
 '(message-header-newsgroups-face ((t (:bold t :foreground "#777"))))
 '(message-header-other-face ((t (:foreground "#666"))))
 '(message-header-subject-face ((t (:bold t :foreground "#999"))))
 '(message-header-to-face ((t (:bold t :foreground "#777"))))
 '(message-header-xheader-face ((t (:foreground "#666"))))
 '(message-separator-face ((t (:foreground "#999"))))

 ;; erc
 '(erc-action-face ((t (nil))))
 '(erc-bold-face ((t (:bold t))))
 '(erc-current-nick-face ((t (:bold t))))
 '(erc-default-face ((t (nil))))
 '(erc-direct-msg-face ((t (nil))))
 '(erc-error-face ((t (:bold t :foreground "IndianRed"))))
 '(erc-highlight-face ((t (:bold t :foreground "pale green"))))
 '(erc-input-face ((t (:foreground "#555"))))
 '(erc-inverse-face ((t (:background "steel blue"))))
 '(erc-keyword-face ((t (:foreground "#999" :bold t))))
 '(erc-nick-msg-face ((t (:foreground "#888"))))
 '(erc-notice-face ((t (:foreground "#444"))))
 '(erc-pal-face ((t (:foreground "#888"))))
 '(erc-prompt-face ((t (:foreground "#777" :bold t))))
 '(erc-timestamp-face ((t (:foreground "#777" :bold t))))
 '(fg:erc-color-face0 ((t (:foreground "white"))))
 '(fg:erc-color-face1 ((t (:foreground "beige"))))
 '(fg:erc-color-face2 ((t (:foreground "lemon chiffon"))))
 '(fg:erc-color-face3 ((t (:foreground "light cyan"))))
 '(fg:erc-color-face4 ((t (:foreground "powder blue"))))
 '(fg:erc-color-face5 ((t (:foreground "sky blue"))))
 '(fg:erc-color-face6 ((t (:foreground "dark sea green"))))
 '(fg:erc-color-face7 ((t (:foreground "pale green"))))
 '(fg:erc-color-face8 ((t (:foreground "medium spring green"))))
 '(fg:erc-color-face9 ((t (:foreground "khaki"))))
 '(fg:erc-color-face10 ((t (:foreground "pale goldenrod"))))
 '(fg:erc-color-face11 ((t (:foreground "light goldenrod yellow"))))
 '(fg:erc-color-face12 ((t (:foreground "light yellow"))))
 '(fg:erc-color-face13 ((t (:foreground "yellow"))))
 '(fg:erc-color-face14 ((t (:foreground "light goldenrod"))))
 '(fg:erc-color-face15 ((t (:foreground "lime green"))))
 '(bg:erc-color-face0 ((t (nil))))
 '(bg:erc-color-face1 ((t (nil))))
 '(bg:erc-color-face2 ((t (nil))))
 '(bg:erc-color-face3 ((t (nil))))
 '(bg:erc-color-face4 ((t (nil))))
 '(bg:erc-color-face5 ((t (nil))))
 '(bg:erc-color-face6 ((t (nil))))
 '(bg:erc-color-face7 ((t (nil))))
 '(bg:erc-color-face8 ((t (nil))))
 '(bg:erc-color-face9 ((t (nil))))
 '(bg:erc-color-face10 ((t (nil))))
 '(bg:erc-color-face11 ((t (nil))))
 '(bg:erc-color-face12 ((t (nil))))
 '(bg:erc-color-face13 ((t (nil))))
 '(bg:erc-color-face14 ((t (nil))))
 '(bg:erc-color-face15 ((t (nil))))
 )

(provide-theme 'less)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

;; Local Variables:
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; less-theme.el ends here
