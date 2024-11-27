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
      '(ansible
		bash-completion
		clang-format
		cmake-ide
		cmake-mode
		company-box
		company-quickhelp
		company-solidity
		company-statistics
		cquery
		csharp-mode
		dap-mode
		dockerfile-mode
		elpy
		epc
		erlang
		find-file-in-project
		gdscript-mode
		go-mode
		helm-company
		helm-gtags
		helm-lsp
		helm-projectile
		kotlin-mode
		lsp-ui
		lua-mode
		magit
		magit-popup
		meson-mode
		monokai-theme
		nginx-mode
		php-mode
		popup
		restclient
		rust-mode
		shut-up
		solidity-flycheck
		swift-mode
		tide
		toml
		treepy
		typescript-mode
		vue-mode
		web-mode
		yaml-mode
		yasnippet-snippets))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

