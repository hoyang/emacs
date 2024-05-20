;;(require 'emms-setup)
;;(require 'emms-player-mplayer)
;;(require 'emms-lyrics)
;;(emms-standard)
;;(emms-default-players)
;;(define-emms-simple-player mplayer '(file url)
;;  (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
;;                ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
;;                ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls";))
;;  "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")

;; set w3m home page
(setq w3m-home-page "https://developer.heyang.pro/")

;; display image default
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

;; use cookies
(setq w3m-use-cookies t)

;; set w3m argument，use cookie and frame
(setq w3m-command-arguments '("-cookie" "-F"))

;; use w3m as default web browser
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-view-this-url-new-session-in-background t)

;; display icon default
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)

(defun w3m-copy-current-anchor-as-kill ()
  "Copy the link (as a string) under the point to the kill ring"
  (interactive)
  (let ((link (w3m-anchor)))
    (if (not link)
        (message "The point is not over an anchor.")
      (kill-new link)
      (message "Copied \"%s\" to kill-ring." link))))

;; C-c C-p open url in new session
(setq w3m-view-this-url-new-session-in-background t)

(require 'socks)
(setq socks-override-functions 1)
(setq socks-noproxy '("localhost"))
(setq socks-server (list "Socks5 server" "127.0.0.1" 7070 5))
