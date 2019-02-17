;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

;; ;; Straight
;; (setq straight-use-package-by-default t)
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; ;; use-package
;; (straight-use-package 'use-package)
;; (setq straight-use-package-by-default t)

;; ;; install a recent org mode version and prevent loading of deafault see also:
;; ;; https://github.com/raxod502/straight.el#installing-org-with-straightel
;; (require 'subr-x)
;; (straight-use-package 'git)

;; (defun org-git-version ()
;;   "The Git version of org-mode.
;; Inserted by installing org-mode or when a release is made."
;;   (require 'git)
;;   (let ((git-repo (expand-file-name
;;                    "straight/repos/org/" user-emacs-directory)))
;;     (string-trim
;;      (git-run "describe"
;;               "--match=release\*"
;;               "--abbrev=6"
;;               "HEAD"))))

;; (defun org-release ()
;;   "The release version of org-mode.
;; Inserted by installing org-mode or when a release is made."
;;   (require 'git)
;;   (let ((git-repo (expand-file-name
;;                    "straight/repos/org/" user-emacs-directory)))
;;     (string-trim
;;      (string-remove-prefix
;;       "release_"
;;       (git-run "describe"
;;                "--match=release\*"
;;                "--abbrev=0"
;;                "HEAD")))))

;; (provide 'org-version)

;; (straight-use-package 'org) ; or org-plus-contrib if desired

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)
;;; Only for package search...
(setq package-archives '(("ELPA"  . "https://tromey.com/elpa/")
			 ("gnu"   . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/" )))

(setq gnutls-verify-error t
      tls-checktrust t)

(unless package--initialized (package-initialize t))

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; I'm not writing every time :ensure t
(setq use-package-always-ensure t)

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;;; Automaticly generated from emacs, also set theme and font
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(fancy-battery-mode t)
 '(guru-global-mode t)
 '(package-selected-packages
   '(dockerfile-mode nginx-mode guru-mode gitlab-ci-mode-flycheck gitlab-ci-mode try yaml-mode helm-ag restclient cargo lsp-mode rust-mode zzz-to-char yasnippet-snippets which-key wgrep use-package tide switch-window sudo-edit spacemacs-theme spaceline slime-company rjsx-mode rainbow-mode rainbow-delimiters pretty-mode prettier-js org-bullets mark-multiple magit linum-relative json-mode js2-refactor hungry-delete htmlize helm-swoop helm-projectile helm-ls-git helm-descbinds golden-ratio fancy-battery expand-region diminish dashboard company-shell company-jedi beacon add-node-modules-path)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Hack")))))
