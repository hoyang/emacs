(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")  ;; trailing slash IMPORTANT
(setq auto-insert-query nil)
(define-auto-insert 'python-mode "python-template.py")
(define-auto-insert 'c++-mode "cpp-template.cpp")
(define-auto-insert "\\.hpp\\'" "hpp-template.hpp")
(define-auto-insert 'c-mode "c-template.c")
(define-auto-insert "\\.h\\'" "h-template.h")
(define-auto-insert "\\.php\\'" "php-template.php")

;; Company-mode
(require 'company)

;; abort and apply space when company suggests completion
(defun company-abort-and-insert-space ()
  (interactive)
  (company-abort)
  (insert " "))
(define-key company-active-map (kbd "SPC") #'company-abort-and-insert-space)

;; Don't use company in the following modes
(setq company-global-modes '(not shell-mode eaf-mode))
(setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-preview-frontend
        company-echo-metadata-frontend))

(setq company-idle-delay 0.1)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-minimum-width 10)
(setq company-show-numbers nil)
(setq company-auto-commit t)
(setq company-format-margin-function nil)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)

(setq company-files-exclusions '(".git/" ".DS_Store"))

(setq company-dabbrev-other-buffers nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
	  company-dabbrev-minimum-length 2)

(setq company-text-icons-add-background t)
(setq company-format-margin-function 'company-text-icons-margin)

;; use company-box for emacs with window-system
(when (not (eq window-system 'nil))
  (require 'company-box)
  (add-hook 'company-mode-hook 'company-box-mode))

(require 'company-statistics)
(company-statistics-mode)

(require 'company-quickhelp)
(company-quickhelp-mode)

(add-hook 'after-init-hook 'global-company-mode)

(require 'csharp-mode)
(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-mode 1))
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm?\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 4)
  (setq web-mode-comment-style 4))

;; web-mode appearance.
;;(set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")

(add-hook 'web-mode-hook 'web-mode-hook)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-part-face t)
(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-heredoc-fontification t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(require 'cmake-ide)
(cmake-ide-setup)

(setq-default
 c-default-style "k&r"
 c-basic-offset 4
 tab-width 4
 indent-tabs-mode t)

(require 'find-file-in-project)
(require 'pyvenv)
(require 'elpy)
(elpy-enable)
;; fix: Warning (flymake): Disabling backend flymake-proc-legacy-flymake because (error Can’t find a suitable init function)
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;(require 'python-mode)
;;(setq py-shell-name "/usr/local/bin/python")

(setenv "PYTHONIOENCODING" "utf-8")
(setq elpy-rpc-python-command "python3")
(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("elpy" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("flake8" . (utf-8 . utf-8)))

;; use flycheck instead of flymake
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;(require 'epc)
;;(require 'deferred)
;;(require 'jedi)

;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:setup-keys t)
;;(setq jedi:complete-on-dot t)

(require 'cl-lib)
(require 'php-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

(require 'helm)
(require 'helm-autoloads)
(setq helm-ff-newfile-prompt-p nil)

(require 'helm-gtags)
(setq helm-gtags-ignore-case t
      helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t
      helm-gtags-prefix-key "\C-cg"
      helm-gtags-suggested-key-mapping t)

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in Eshell for the same reason as above
(add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(helm-mode 1)

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
; markdown executable

(custom-set-variables
 '(markdown-command "/usr/local/bin/markdown"))

(require 'lsp-mode)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;(require 'company-lsp)
;;(push 'company-lsp company-backends)

(defun as/markdown-add-xhtml-header-and-footer (title)
  "Wrap XHTML header and footer with given TITLE around current buffer."
  (goto-char (point-min))
  (insert "<!DOCTYPE html5>\n"
          "<html>\n"
          "<head>\n<title>")
  (insert title)
  (insert "</title>\n")
  (insert "<meta charset=\"utf-8\" />\n")
  (when (> (length markdown-css-paths) 0)
    (insert (mapconcat 'markdown-stylesheet-link-string markdown-css-paths "\n")))
  (insert "\n</head>\n\n"
          "<body>\n\n")
  (goto-char (point-max))
  (insert "\n"
          "</body>\n"
          "</html>\n"))

(eval-after-load "markdown-mode"
  '(defalias 'markdown-add-xhtml-header-and-footer 'as/markdown-add-xhtml-header-and-footer))

(autoload 'gfm-mode "gfm-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(require 'swift-mode)
(add-to-list 'auto-mode-alist '("\\.swift$" . swift-mode))

(require 'dash)
(eval-after-load "dash" '(dash-enable-font-lock))

(require 'with-editor)

(require 'magit)
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/extensions/magit/Documentation/"))

(require 'flycheck)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))

(require 'popup)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . js-jsx-mode))

(require 'restclient)
(add-to-list 'auto-mode-alist '("\\.http?$" . restclient-mode))

(require 'cmake-mode)

(require 'go-mode)

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(require 'solidity-mode)
(setq solidity-comment-style 'slash)
;; or
;; (setq solidity-comment-style 'star) ;; this is the default
(setq solidity-solc-path "/usr/local/bin/solc")
(setq solidity-solium-path "/home/lefteris/.npm-global/bin/solium")

(require 'solidity-flycheck)
(setq solidity-flycheck-solc-checker-active t)

(require 'company-solidity)
(add-hook 'solidity-mode-hook
	(lambda ()
	(set (make-local-variable 'company-backends)
		(append '((company-solidity company-capf company-dabbrev-code))
			company-backends))))

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'typescript-mode)

(custom-set-variables
 '(typescript-indent-level 2))

(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq tide-format-options '(:indentSize 2 :tabSize 2 :insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'kotlin-mode)

;; erlang
(require 'erlang-start)
