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
		"workspace.el"))

