;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 (setq doom-font (font-spec :family "VictorMono Nerd Font" :size 12)
       doom-variable-pitch-font (font-spec :family "ETBembo" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/usr/Dropbox/org/")

(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'writeroom-mode)
(defun use-ox-tufte ()
  (use-package "ox-tufte"))
(add-hook 'org-mode-hook 'use-ox-tufte)

;; Style sections semantically. Also, play nice with Tufte CSS.
(setq org-html-html5-fancy t)
(setq org-html-container-element "section")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Deft
(setq deft-directory "~/usr/Dropbox/org/")
(setq deft-default-extension "org")
(setq deft-use-filename-as-title nil)
(setq deft-recursive t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

        (custom-theme-set-faces
                'user
                '(org-block ((t (:inherit fixed-pitch))))
                '(org-code ((t (:inherit (shadow fixed-pitch)))))
                '(org-document-info ((t (:foreground "dark orange"))))
                '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
                '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
                '(org-link ((t (:foreground "royal blue" :underline t))))
                '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
                '(org-property-value ((t (:inherit fixed-pitch))) t)
                '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
                '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
                '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
                '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
                `(org-level-8 ((t (,@headline ,@variable-tuple))))
                `(org-level-7 ((t (,@headline ,@variable-tuple))))
                `(org-level-6 ((t (,@headline ,@variable-tuple))))
                `(org-level-5 ((t (,@headline ,@variable-tuple))))
                `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))
