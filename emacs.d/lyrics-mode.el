;; lyrics
(define-generic-mode lyrics-mode nil
                     '("chorus" "verse" "bridge" "part" "repeat" "coda")
                     '(("\\(#[^\n]*\\)$" 1 font-lock-comment-face t)
                       ("\\bverse \\([a-zA-Z0-9]+\\)" 1 font-lock-variable-name-face)
                       ("\\bpart \\([a-zA-Z0-9]+\\)" 1 font-lock-variable-name-face)
                       ("\\(:\\)" 1 font-lock-constant-face))
                     '("\\.lyrics\\.txt$")
                     nil
                     "Major mode for editing lyrics")
