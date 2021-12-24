(setq exec-path (cons "~/bin" exec-path))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-font-lock-mode t)
(setq transient-mark-mode t)
(setq require-final-newline t)
(setq-default indent-tabs-mode t)
(setq inhibit-startup-message t)

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key "\M-g" 'beginning-of-buffer)
(global-set-key "\M-G" 'end-of-buffer)
(global-set-key "\C-p" 'goto-line)
(global-set-key "\C-f" 'clang-format-region)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rr 'replace-regexp)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(require 'package)
(package-initialize)
(color-theme-solarized)

(set-frame-font "Inconsolata 18" nil t)
