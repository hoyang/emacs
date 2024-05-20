;; customize
(setq inhibit-startup-message t)         ; disable startup message
(setq column-number-mode t)              ; display line, column number
(setq kill-ring-max 200)                 ; set more big number to kill-ring
(setq default-fill-column 60)            ; set fill column to 60
(setq x-select-enable-clipboard t)       ; enable clipboard with another applications
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(setq-default indent-tabs-mode t)        ; use tab key to do indent

;; add newline in file ends automatically
(setq require-final-newline t)
;; keep cursor at line end when move
(setq track-eol t)

(setq default-directory "~/")

;; automatically set safe values and ignore the others.
(setq enable-local-variables :safe)

;; emacs behavior
;; turn off auto backup
(setq auto-save-mode nil)
;; dont create #filename# temp file
(setq auto-save-default nil)

;; set backup policy
(setq make-backup-files t)               ; turn on file backup feature
(setq vc-make-backup-files t)            ; turn on file backup feature when use version control
(setq version-control t)                 ; using version control, backup multiple times
(setq kept-old-versions 2)               ; backup original file twice, eg before the first time to edit and before second time to edit
(setq kept-new-versions 6)               ; backup newest file six times.
(setq delete-old-versions t)             ; delete other backup file
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))) ; save backup files into .emacs.d/backups
(setq backup-by-copying t)               ; method to backup file: copy direct

(setq backup-enable-predicate 'ecm-backup-enable-predicate) ; set backup condition

;; history
(savehist-mode 1)
(setq savehist-file "~/.emacs.d/savehist")
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; org-mode
(setq org-todo-keywords
      '((sequence "未完成" "待反馈" "待检验" "|" "已完成" "已委派")))

;; execute external program in Bash with alias enabled
(setq shell-file-name "bash")
(setq shell-command-switch "-c")

(setq-default tab-width 4)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*") ;; Chinese sentence end
(setq sentence-end-double-space nil)

; default editing mode
(setq default-major-mode 'text-mode)

; show match paren
(show-paren-mode t)

; dont jump to match paren
(setq show-paren-style 'parentheses)

; tell emacs where to read abbrev definitions from
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

(mouse-avoidance-mode 'animate)                         ; mouse auto avoidance
(setq frame-title-format "%b")                          ; format titlebar
(setq frame-title-format
      '((:eval (funcall (lambda () (if buffer-file-name
                                       buffer-file-name
                                     (buffer-name)))))))

;; enable disabled built-in function
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil) ; active downcase-region function.

;; auto-indent code when copy-paste.
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice, command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(emacs-lisp-mode lisp-mode clojure-mode scheme-mode haskell-mode ruby-mode rspec-mode web-mode php-mode c-mode c++-mode objc-mode latex-mode js-mode plain-tex-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

(setq speedbar-indentation-width 2)
(setq speedbar-use-images nil)
(setq speedbar-show-unknown-files t)
;;(setq sr-speedbar-right-side nil)
;;(sr-speedbar-open)

(setq read-file-name-completion-ignore-case t)
;;(setq pcomplete-ignore-case t)

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

(setq sql-mysql-options '("--prompt=MySQL> ")) ; show prompt with mariadb client
