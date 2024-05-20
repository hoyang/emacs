;; key binding
(global-set-key (kbd "C-x c") 'copy-region-as-kill)            ; Copy selected text to  kill-ring
(global-set-key (kbd "C-x v") 'yank)                           ; Paste selected text from kill-ring
(global-set-key (kbd "C-x x") 'kill-region)                    ; Cut selected text to kill-ring
(global-set-key (kbd "C-x g") 'goto-line)                      ; Jump to line
;;(global-set-key [(f4)] 'sr-speedbar-toggle)                    ; Display speed-bar
(global-unset-key (kbd "C-SPC"))                               ; unset Ctrl+Space, input method swich need this.
;;(require 'ibus)
;;(add-hook 'after-init-hook 'ibus-mode-on)
;;(setq ibus-cursor-color '("red" "blue" "limegreen"))
;;(global-set-key (kbd "C-SPC") 'ibus-toggle)

(global-set-key (kbd "RET") 'newline-and-indent)               ; auto indent.

(global-set-key (kbd "C-c l") 'hide-lines)                     ; Press C-c l hide lines
(global-set-key (kbd "C-c L") 'show-all-invisible)             ; Press C-c L display all invisible lines

(global-set-key [home] 'smart-beginning-of-line)
(global-set-key "\C-a" 'smart-beginning-of-line)

;; tabbar switch
(global-set-key [(meta left)] 'tabbar-backward);;切换前一个tab
(global-set-key [(meta right)] 'tabbar-forward);;切换下一个tab

;; company
(define-key company-active-map [tab] 'company-select-next-if-tooltip-visible-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'company-select-next-if-tooltip-visible-or-complete-selection)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)
(define-key company-active-map (kbd "S-TAB") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

(with-eval-after-load 'company
  (define-key company-mode-map (kbd "C-:") 'helm-company)
  (define-key company-active-map (kbd "C-:") 'helm-company))

(global-set-key "%" 'match-paren); 按 % 跳转到匹配的括号

;; delete current buffer and file.
(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

(global-set-key [(control ?\.)] 'ska-point-to-register) ; press C-. set mark
(global-set-key [(control ?\,)] 'ska-jump-to-register)  ; press C-, jump back to mark

(define-key global-map (kbd "C-c a") 'em-go-to-char)

(global-set-key [(control x) (control r)] 'find-file-root)

(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

(custom-set-variables
 '(helm-gtags-prefix-key "\C-t")
 '(helm-gtags-suggested-key-mapping t))
;;Key 	Command
;;Prefix h 	helm-gtags-display-browser
;;Prefix C-] 	helm-gtags-find-tag-from-here
;;Prefix C-t 	helm-gtags-pop-stack
;;Prefix P 	helm-gtags-find-files
;;Prefix f 	helm-gtags-parse-file
;;Prefix g 	helm-gtags-find-pattern
;;Prefix s 	helm-gtags-find-symbol
;;Prefix r 	helm-gtags-find-rtag
;;Prefix t 	helm-gtags-find-tag
;;Prefix d 	helm-gtags-find-tag
;;M-* 	helm-gtags-pop-stack
;;M-. 	helm-gtags-find-tag
;;C-x 4 . 	helm-gtags-find-tag-other-window

;; macOS
;; command -> meta, alt -> alt
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

;; pretty-print json
(global-set-key (kbd "C-c C-f") 'beautify-json)
;; my-simple-dictionary
(global-set-key (kbd "C-x t") 'my-simple-dictionary)
