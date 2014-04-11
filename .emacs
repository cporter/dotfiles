(if (eq system-type 'darwin)
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'meta)
      (set-default-font "Droid Sans Mono")))

(global-font-lock-mode t)
(setq transient-mark-mode t)
(setq require-final-newline t)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key "\M-g" 'beginning-of-buffer)
(global-set-key "\M-G" 'end-of-buffer)
(global-set-key "\C-p" 'goto-line)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rr 'replace-regexp)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'magit 'color-theme 'color-theme-solarized 'markdown-mode) 

;; activate installed packages
(package-initialize)

(load-theme 'solarized-dark t)

(load-file
 (concat (file-name-directory (file-truename load-file-name))
         "google-c-style.el"))
(add-hook 'c-mode-common-hook 'google-set-c-style)
