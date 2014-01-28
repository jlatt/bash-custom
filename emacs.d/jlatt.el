(if window-system
    (server-start)
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(add-to-list 'custom-theme-load-path "~/.bash/emacs.d/themes")
(load-theme 'jlatt t)

(add-to-list 'exec-path "/usr/local/bin")

;; package repos
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; reasonable defaults
(setq-default debug-on-error nil
              backup-directory-alist `((".*" . ,temporary-file-directory))
              auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
              column-number-mode t
              global-hl-line-mode 1
              indicate-buffer-boundaries 'right
              indicate-empty-lines nil
              inhibit-splash-screen t
              initial-scratch-message nil
              magic-mode-alist ()
              mouse-wheel-scroll-amount '(1 ((shift) . 1))
              ring-bell-function 'ignore
              show-paren-delay 0
              frame-title-format "%f"
              cursor-type 'bar
              size-indication-mode t
              tab-width 4
              indent-tabs-mode nil
              fill-column 80
              visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(set-cursor-color 'yellow)
(prefer-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p) ; 'y' or 'n' instead of 'yes' or 'no' for questions
(global-auto-revert-mode) ; Revert unchanged files every 5 seconds.
(require 'midnight) ; Clean up unused buffers.
(if (boundp 'global-visual-line-mode) (global-visual-line-mode))

;; tramp
(require 'tramp)
(add-to-list 'tramp-remote-path "~/usr/bin")

;; unique buffer names
(require 'uniquify)

;; whitespace
;;(load "editorconfig")

;; ido
(require 'ido)
(setq-default ido-enable-flex-matching t)
(ido-mode t)

(require 'ag)
(setq ag-highlight-search t)
(global-set-key (kbd "<f5>") 'ag-project)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)

;;
;; editing modes
;;

(defun add-autoload (mode)
  "Add a simple autoload statement."
  (autoload mode (symbol-name mode) (symbol-name mode) t))

;; yaml
(add-autoload 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))

;; git
(require 'git-rebase-mode)
(add-to-list 'auto-mode-alist '("git-rebase-todo\\'" . git-rebase-mode))

(require 'git-commit)
(add-to-list 'auto-mode-alist '("\\PULLREQ_EDITMSG\\'" . git-commit-mode))

;; javascript
(setq font-lock-quasiconstant-face '(:foreground "MediumPurple2"))
(font-lock-add-keywords 'js-mode '(("constructor" . font-lock-quasiconstant-face)
                                    ("prototype" . font-lock-quasiconstant-face)
                                    ("callee" . font-lock-quasiconstant-face)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.erb\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.cjm\\'" . js-mode))

(defun jshint-current-file ()
  (interactive)
  (shell-command (format "jshint %s" (shell-quote-argument (buffer-file-name)))))

;; coffeescript
(add-autoload 'coffee-mode)

;; mustache
(add-autoload 'mustache-mode)
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . mustache-mode))

;; org
(setq org-directory "~/Dropbox/org"
      org-agenda-files '("~/Dropbox/org")
      org-log-done 'time
      org-todo-keywords '((sequence "TODO" "|" "DONE"))
      org-alphabetical-lists t
      org-todo-keyword-faces '(("TODO" . (:foreground "red"))
                               ("DONE" . (:foreground "green")))
      org-agenda-span 14
      org-default-notes-file (concat org-directory "/work.org"))
(global-set-key "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; html
(add-to-list 'auto-mode-alist '("\\.dtl\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . html-mode))

;; python
(add-hook 'python-mode-hook (lambda ()
                              (setq tab-width 4)
                              (setq python-indent 4)))

;; ruby
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

;; haml
(autoload 'haml-mode "haml-mode" "haml" t)
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

;; sass
(add-autoload 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

;; markdown
(add-autoload 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; go
(add-to-list 'load-path "/usr/local/opt/go/libexec/misc/emacs")
(require 'go-mode-load) ;; runs autoload statements
(add-hook 'go-mode-hook (lambda ()
                          (add-hook 'before-save-hook #'gofmt-before-save)))

;; general programming config
(dolist (mode '(c-mode
                css-mode
                c++-mode
                emacs-lisp-mode
                go-mode
                haml-mode
                html-mode
                js-mode
                ruby-mode
                scss-mode
                sh-mode))
  (font-lock-add-keywords mode '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\|NB\\|NOTE\\)\\>" 1 font-lock-warning-face prepend))))
(dolist (mode-hook '(c-mode-hook
                     css-mode-hook
                     c++-mode-hook
                     emacs-lisp-mode-hook
                     go-mode-hook
                     haml-mode-hook
                     html-mode-hook
                     js-mode-hook
                     ruby-mode-hook
                     scss-mode-hook
                     sh-mode-hook))
  (add-hook mode-hook (lambda ()
                        (show-paren-mode 1)
                        (add-hook 'before-save-hook 'delete-trailing-whitespace))))

(provide 'jlatt)
