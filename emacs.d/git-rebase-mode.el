(defun git-rebase-move-up ()
  "Move a line up"
  (interactive)
  (kill-whole-line)
  (forward-line -1)
  (yank)
  (forward-line -1))

(defun git-rebase-move-down ()
  "Move a line up"
  (interactive)
  (kill-whole-line)
  (forward-line 1)
  (yank)
  (forward-line -1))

(defun git-rebase-change (msg)
  "do something to a changeset line"
  (interactive)
  (beginning-of-line)
  (while (not (looking-at "\\s-")) (delete-char 1))
  (insert msg)
  (beginning-of-line))

(defun git-rebase-pick ()
  "pick a changeset"
  (interactive)
  (git-rebase-change "pick"))

(defun git-rebase-reword ()
  "reword a changeset"
  (interactive)
  (git-rebase-change "reword"))

(defun git-rebase-edit ()
  "edit a changeset"
  (interactive)
  (git-rebase-change "edit"))

(defun git-rebase-squash ()
  "squash a changeset"
  (interactive)
  (git-rebase-change "squash"))

(defun git-rebase-fixup ()
  "fixup a changeset"
  (interactive)
  (git-rebase-change "fixup"))

(defun git-rebase-delete ()
  "delete a changeset"
  (interactive)
  (git-rebase-change "#"))

(defvar git-rebase-font-lock-keywords
  '(("#.*" 0 font-lock-comment-face)
	("^\\(pick\\|reword\\|edit\\|squash\\|fixup\\)\\b" 0 font-lock-type-face)
	("\\b[0-9a-f]\\{7,10\\}" 0 font-lock-variable-name-face)))

(defvar git-rebase-font-lock-defaults
  '(git-rebase-font-lock-keywords t))

(define-derived-mode git-rebase-mode fundamental-mode "git-rebase"
  "git rebase mode"
  ;; key bindings
  (define-key git-rebase-mode-map "j" 'git-rebase-move-down)
  (define-key git-rebase-mode-map "k" 'git-rebase-move-up)
  (define-key git-rebase-mode-map "p" 'git-rebase-pick)
  (define-key git-rebase-mode-map "r" 'git-rebase-reword)
  (define-key git-rebase-mode-map "e" 'git-rebase-edit)
  (define-key git-rebase-mode-map "s" 'git-rebase-squash)
  (define-key git-rebase-mode-map "f" 'git-rebase-fixup)
  (define-key git-rebase-mode-map "x" 'git-rebase-delete)
  ;; fonts
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults git-rebase-font-lock-defaults))

(provide 'git-rebase-mode)
