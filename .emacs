
 
(setq exec-path (cons "~/bin" exec-path))

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
(global-set-key "\C-f" 'clang-format-region)
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

(ensure-package-installed 'magit
                          'color-theme
                          'color-theme-solarized
                          'markdown-mode
                          'yaml-mode
                          'clang-format
                          'd-mode) 

(defvar clang-format-binary "clang-format-3.5")
 
;; activate installed packages
(package-initialize)

(load-theme 'solarized-dark t)

(setq ispell-program-name "/usr/local/bin/aspell")

(setq-default c-default-style "stroustrup"
              tab-stop 4
              tab-width 4
              innamespace 0
              c-basic-offset 4)
(c-set-offset 'innamespace 0)

;; Set up Conduce C++ style
; style I want to use in c++ mode
(c-add-style "conduce-cxx" 
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4)            ; indent by four spaces
               (tab-stop . 4)
               (tab-width . 4)
	       (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
				   (brace-list-open . 0)
                   (innamespace . 0)))))

(defun conduce-c++-mode-hook ()
  (c-set-style "conduce-cxx")        ; use my-style defined above
  (auto-fill-mode))

(add-hook 'c++-mode-hook 'conduce-c++-mode-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pro\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.protein\\'" . yaml-mode))

(global-set-key [C-f] 'clang-format-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((c-default-style . "linux") (tab-stop . 8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
