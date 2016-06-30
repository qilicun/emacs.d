;;(set-foreground-color "white")
;;(set-background-color "black")
;;(load "/private/miliu/.emacs.d/site-lisp/linum/linum.el")
(global-linum-mode 1)
;;(set linum-format "%d| ")
(display-time)
(fset 'yes-or-no-p 'y-or-n-p)
;;matlab-mode
  (add-to-list 'load-path "~/.emacs.d/site-lisp/matlab-emacs")
  (load-library "matlab-load")

  ;; Enable CEDET feature support for MATLAB code. (Optional)
  ;; (matlab-cedet-setup)
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
 (setq matlab-indent-function t)
 (setq matlab-shell-command "matlab")
(add-to-list 'load-path "~/.emacs.d/site-lisp/yaml-mode")
(load-library "yaml-mode")
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; No tabs in files!
(setq-default indent-tabs-mode nil)

;;(setq indent-tabs-mode 4)
;;(setq tab-width 4)

;; Use c++-mode for .h files
(setq auto-mode-alist (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

;; Use font-lock-mode when in most modes
;;(global-font-lock-mode t)
(transient-mark-mode 1)
(setq show-paren-style 'parentheses)
(setq x-stretch-cursor t)
;; Use 4 spaces for indentation
(add-hook 'c++-mode-hook
          (lambda ()
            (setq c-basic-offset 4)))
(add-hook 'c-mode-hook
          (lambda ()
            (setq c-basic-offset 4)))



;;
;; Automatic copyright header generation for C++ files
;;
(add-hook 'c++-mode-hook
          (lambda ()
            (set 'headername (upcase (concat "OPM_"
                                     (substring
                                      (file-name-nondirectory buffer-file-name)
                                      0
                                      (string-match
                                       "\\.hp*$"
                                       (file-name-nondirectory buffer-file-name)))
                                     "_HEADER_INCLUDED")))

            (local-set-key  "\C-c\C-c" 'compile)
            (cond ((not (file-exists-p (buffer-file-name)))
                   (insert-string
                    (concat
"/*
  Copyright " (format-time-string "%Y") " <Insert your organization or name here>.

  This file is part of the Open Porous Media project (OPM).

  OPM is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  OPM is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with OPM.  If not, see <http://www.gnu.org/licenses/>.
*/\n\n"))

                   (cond ((string-match
                           "\\.hp*$"
                           (file-name-nondirectory buffer-file-name))
                          (insert-string
                           (concat "#ifndef " headername "\n"
                                   "#define " headername "\n\n"
                                   "#endif // " headername "\n"
                                   ))))))
))

;;(load "/private/miliu/.emacs.d/elpa/color-theme-20080305.34/themes/monokai-theme.el")
;;(monokai-theme)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
