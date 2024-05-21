(require 'package)

;; elpa mirror
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "https://mirrors.ustc.edu.cn/elpa/org/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; activate all the packages
(package-initialize)

(setq package-list
      '(yasnippet-snippets yaml-mode web-mode vue-mode typescript-mode treepy tide swift-mode solidity-flycheck shut-up rust-mode restclient php-mode monokai-theme meson-mode magit-popup magit lua-mode lsp-ui kotlin-mode helm-projectile helm-lsp helm-gtags helm-company go-mode gdscript-mode find-file-in-project erlang epc elpy dockerfile-mode dap-mode cquery company-statistics company-solidity company-quickhelp company-box cmake-mode cmake-ide clang-format bash-completion ansible))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

