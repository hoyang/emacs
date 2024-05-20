(defun mylog (msg)
  (interactive "f")
  "logging message with datetime"
  (message (concat (format-time-string "[%H:%M:%S] ") msg)))

(defun load-user-config (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file "~/.emacs.d/etc"))
  (mylog (concat "load: " (expand-file-name file "~/.emacs.d/etc"))))

(require 'server)
(unless (server-running-p)
  (server-start))

(mapc #'load-user-config
	  '("environment.el"
	    "packages.el"
		"customize.el"
		"appearance.el"
		"preferences.el"
		"development.el"
		"key-binding.el"
		"extra.el"
		"hotfix.el"
		"workspace.el"
		"test.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-gtags-prefix-key "\24")
 '(helm-gtags-suggested-key-mapping t)
 '(markdown-command "/usr/local/bin/markdown")
 '(package-selected-packages
   '(yasnippet-snippets yaml-mode web-mode typescript-mode treepy tide swift-mode solidity-flycheck shut-up rust-mode restclient php-mode monokai-theme magit-popup magit lua-mode lsp-ui kotlin-mode helm-projectile helm-lsp helm-gtags helm-company go-mode gdscript-mode find-file-in-project erlang epc elpy dockerfile-mode dap-mode cquery company-statistics company-solidity company-quickhelp company-box cmake-mode cmake-ide))
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
