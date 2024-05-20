(require 'package)

;; elpa mirror
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; activate all the packages
(package-initialize)

(setq package-list
      '(company-box company-quickhelp company-solidity company-statistics find-file-in-project helm-company helm-gtags helm-lsp helm-projectile lsp-ui magit magit-popup restclient solidity-flycheck treepy yasnippet-snippets            
					cquery dap-mode epc shut-up
					monokai-theme
					elpy cmake-ide cmake-mode dockerfile-mode gdscript-mode go-mode erlang kotlin-mode php-mode rust-mode swift-mode tide typescript-mode web-mode yaml-mode lua-mode))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   '(yasnippet-snippets yaml-mode web-mode typescript-mode treepy tide swift-mode solidity-flycheck shut-up rust-mode restclient php-mode monokai-theme magit-popup magit lua-mode lsp-ui kotlin-mode helm-projectile helm-lsp helm-gtags helm-company go-mode gdscript-mode find-file-in-project erlang epc elpy dockerfile-mode dap-mode cquery company-statistics company-solidity company-quickhelp company-box cmake-mode cmake-ide)))
