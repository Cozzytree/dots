;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Maple Mono NF" :size 16 :weight 'medium)
;; (setq doom-font (font-spec :family "NotoMono Nerd Font Mono" :size 16 :weight 'medium)
     doom-variable-pitch-font (font-spec :family "Adwaita Sans" :size 18))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-subtle-dark)
(add-hook 'doom-load-theme-hook
          (lambda ()
            (mapc (lambda (face)
                    (set-face-attribute face nil :slant 'normal))
                  (face-list))))

;; (add-to-list 'default-frame-alist '(alpha-background . 85))
;; (add-to-list 'default-frame-alist '(alpha . 85))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)
;; (add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Zed-style: mark next/previous occurrence of the selection or word at point.
;; Edit all occurrences at once with c/C, finish with <escape> or C-g.
(map! :nvi "C-S-<down>" #'evil-multiedit-match-and-next
      :nvi "C-S-<up>"   #'evil-multiedit-match-and-prev
      :nvi "C-S-l"      #'evil-multiedit-match-all)

;; Add cursors above/below at the same column (Zed-style)
(map! :nvi "M-S-<down>" #'evil-mc-make-cursor-move-next-line
      :nvi "M-S-<up>"   #'evil-mc-make-cursor-move-prev-line)

;; Terminal: enable mouse + load mwheel, which isn't preloaded for tty
;; sessions (leaves <wheel-up>/<wheel-down> unbound otherwise).
(add-hook 'tty-setup-hook
          (defun +cozzy/init-tty-mwheel-h ()
            (require 'mwheel)
            (mouse-wheel-mode +1)))

;; M-Up/M-Down to move the current line (or all lines in an active region)
(use-package! drag-stuff
  :defer t
  :init
  (map! :nvi "M-<up>"   #'drag-stuff-up
        :nvi "M-<down>" #'drag-stuff-down))

(after! eglot
  (add-to-list 'eglot-server-programs
               '((typescript-mode typescript-ts-mode tsx-ts-mode js-mode js-ts-mode)
                 "tsc" "--lsp" "-stdio"))
  (setq-default eglot-workspace-configuration
                '((:gopls . ((hints . ((assignVariableTypes . t)
                                       (compositeLiteralFields . t)
                                       (compositeLiteralTypes . t)
                                       (constantValues . t)
                                       (functionTypeParameters . t)
                                       (parameterNames . t)
                                       (rangeVariableTypes . t))))))))

(defface my-breadcrumb-face
  '((t :height 0.8 :inherit header-line))
  "Face for breadcrumb header line.")

(defun my/setup-breadcrumb ()
  (require 'breadcrumb)
  (setq header-line-format
        '(:eval (breadcrumb-imenu-crumbs))))
(add-hook 'prog-mode-hook #'my/setup-breadcrumb)

(defun my/setup-typescript ()
  (setq-local typescript-ts-mode-indent-offset 2)
  (setq-local typescript-mode-indent-offset 2))

(add-hook 'typescript-ts-mode-hook #'my/setup-typescript)
(add-hook 'typescript-mode-hook #'my/setup-typescript)
(add-hook 'tsx-ts-mode-hook #'my/setup-typescript)

(add-hook 'typescript-mode-hook
          (lambda ()
            (setq-local tab-width 2)
            (setq-local typescript-indent-level 2)
            (setq-local indent-tabs-mode nil)))

(dolist (hook '(typescript-ts-mode-hook tsx-ts-mode-hook))
  (add-hook hook
            (lambda ()
              (setq-local tab-width 2)
              (setq-local typescript-ts-mode-indent-offset 2)
              (setq-local indent-tabs-mode nil))))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-ts-mode))

(after! orderless
  (setq completion-ignore-case nil))

(after! corfu
  (setq corfu-auto t
        corfu-auto-delay 0.0
        corfu-auto-prefix 1
        corfu-preview-current t)
  (add-hook 'prog-mode-hook
            (lambda ()
              (add-hook 'completion-at-point-functions
                        #'cape-dabbrev
                        nil t))))

;; Increase memory limit to 100MB before GC triggers (default is 800KB)
(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 3 1024 1024)) ; 3MB buffer for fast LSP/process

;; Disable expensive bidi (bidirectional text) processing
(setq-default bidi-display-reordering 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Optimize redraws & scrolling
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 101)

;; Disable font-lock (syntax highlighting) overhead on large files
(setq font-lock-maximum-decoration 2)

;; Disable font-lock (syntax highlighting) overhead on large files
(setq font-lock-maximum-decoration 2)

;; Optimize TTY rendering specifically
(add-hook 'tty-setup-hook
  (lambda ()
    ;; Disable menu bar completely in terminal
    (menu-bar-mode -1)
    ;; Prevent terminal mouse reporting if you rely strictly on keyboard (saves input delay)
    ;; (xterm-mouse-mode -1)
    ))

(setq history-length 100)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 50)

(custom-set-faces!
  '(mode-line :box nil)
  '(mode-line-inactive :box nil))

;; (use-package! highlight-indent-guides
;;   :defer t
;;   :custom
;;   (highlight-indent-guides-method 'column)
;;   ;; (highlight-indent-guides-method 'character)
;;   ;; (highlight-indent-guides-method 'fill)
;;   (highlight-indent-guides-character ?\u2502) ;; |
;;   (highlight-indent-guides-responsive 'top)
;;   (highlight-indent-guides-auto-enabled nil)
;;   :config
;;   (custom-set-faces!
;;     '(highlight-indent-guides-character-face :foreground "#040402")
;;     '(highlight-indent-guides-top-character-face :foreground "#3b8eea")
;;     '(highlight-indent-guides-top-odd-face  :background "#3b8eea")
;;     '(highlight-indent-guides-top-even-face :background "#3b8eea")))

(add-hook 'prog-mode-hook (lambda ()
                            (setq-default line-spacing 1)
                            ;; (highlight-indent-guides-mode)
                            ))

(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)

(xterm-mouse-mode 1)

;; Pin the echo area (strip below the mode-line) to a fixed single line so
;; multi-line LSP/eldoc updates can't resize it and cause flicker.
(setq resize-mini-windows t
      max-mini-window-height 2)
(setq tooltip-resize-echo-area nil)

;; Keep eldoc (LSP type/signature info) on one line so it truncates instead
;; of overflowing a fixed-height echo area.
(setq eldoc-echo-area-use-multiline-p nil)
;;; config.el ends here
