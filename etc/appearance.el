;; looks and feel
(when (eq window-system 'nil)
  (message "It's terminal"))

(when (eq window-system 'x)
  (message "It's X11")
  (add-to-list 'default-frame-alist '(font . "Sarasa Fixed SC-12")))

(when (eq window-system 'ns)
  ;;(if window-system (toggle-frame-maximized)) ; macOS will remember latest window state, don't need toggle.
  (message "It's macOS")
  (add-to-list 'default-frame-alist '(font . "Menlo-12")))

(when (eq window-system 'w32)
  (message "It's Windows")
  (add-hook 'after-init-hook 'toggle-frame-maximized)
  (add-to-list 'default-frame-alist '(font . "Sarasa Fixed SC-12")))

(when (not (eq window-system 'nil))
  (scroll-bar-mode 0)
  (tool-bar-mode 0))

;; keep it for status monitor.
(menu-bar-mode 0)
(blink-cursor-mode 0)
(setq visible-bell 0)

;;"Noto Sans Mono CJK SC Regular"
;;"Menlo Regular"
;;"Sarasa Mono SC"

;; color theme settings
(require 'monokai-theme)
(load-theme 'monokai t)
;;(require 'dracula-theme)
;;(load-theme 'dracula t)
;;(require 'zenburn-theme)
;;(load-theme 'zenburn t)

(add-to-list 'default-frame-alist '(cursor-color . "magenta"))

(global-hl-line-mode 1)
(set-face-background hl-line-face "gray13")
;;(set-face-attribute hl-line-face nil :underline t)

(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#4B4B4B")
(set-face-background 'highlight-indentation-current-column-face "#4B4B4B")
