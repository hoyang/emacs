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


(require 'socks)
(setq socks-override-functions 1)
(setq socks-noproxy '("localhost"))
(setq socks-server (list "Socks5 server" "127.0.0.1" 7070 5))
