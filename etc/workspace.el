;; Emacs Session and Desktop support
;(require 'session); load session extension
;(add-hook 'after-init-hook 'session-initialize); after emacs initialized begin session extension initialize

(require 'desktop)
(setq desktop-enable t)

(setq-default desktop-load-locked-desktop t)

(setq desktop-restore-frames t)
(setq desktop-restore-in-current-display t)
(setq desktop-restore-forces-onscreen nil)

;; save desktop before quit
(desktop-save-mode 1)
;; read desktop
(desktop-read)
