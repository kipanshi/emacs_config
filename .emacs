;; Repositories
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

;; Indents
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)

;; Column-number-mode
(column-number-mode)

;; Support for forward-word and backward-word in Cyrillic
(global-set-key (kbd "а") 'forward-word)
(global-set-key (kbd "и") 'backward-word)
(global-set-key (kbd "м") 'scroll-down)
(global-set-key (kbd "ц") 'copy-region-as-kill)
(global-set-key (kbd "в") 'kill-word)

;; Ido mode
(require 'ido)
(ido-mode t)

;; Colors in terminal emulator
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Jedi autocomplete
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(setq flycheck-highlighting-mode 'lines)

;; `(flycheck-error-face
;;   ((((class color)) (:foreground "#FF6E64" :background "#FF6E64" :weight bold :underline t))))
;; `(flycheck-warning-face
;;   ((((class color)) (:foreground "#DEB542" :background "#7B6000" :weight bold :underline t))))


;; Autopair
(require 'autopair)
(autopair-global-mode)
