(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Config ;;

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(defun my/add-pkg (pkg)
  "Installs a Package"
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

(my/add-pkg 'eglot)
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)






