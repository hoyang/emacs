(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8)
(set-language-environment "UTF-8")
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")


(unless (boundp 'directory-sep-char) (setq directory-sep-char ?/))
(setq directory-sep-string (char-to-string directory-sep-char))


(defun add-load-path-list (dir)
  (interactive "f")
  "add-to-list load-path all top level folder in dir"

  (dolist (f (directory-files dir))
    (let ((name (concat dir "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (mylog (concat "add-to-list: " name))
		(setq my-lisp-dir (concat name directory-sep-string "lisp"))
		(if (file-accessible-directory-p my-lisp-dir)
			(add-to-list 'load-path my-lisp-dir))
        (add-to-list 'load-path name)))))


;; Environment variable
(setenv "LD_LIBRARY_PATH" (concat "/usr/local/lib" ";" (getenv "LD_LIBRARY_PATH")))
;; My own lib path
(setenv "LD_LIBRARY_PATH" (concat "~/lib" ";" (getenv "LD_LIBRARY_PATH")))


(setq exec-path (append '("~/bin") exec-path))
(setq exec-path (append '("/usr/local/bin") exec-path))


(when (eq window-system 'w32)
  (setq erlang-root-dir "C:/Tools/SDK/erl-24.2")
  (setq exec-path (cons "C:/Tools/SDK/erl-24.2/bin" exec-path)))
