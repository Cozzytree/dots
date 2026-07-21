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
;; (setq doom-font (font-spec :family "Iosevka KG Terminal" :size 17 :weight 'semi-bold :width 'expanded)
;; (setq doom-font (font-spec :family "Iosevka KG Terminal" :size 18)
(setq doom-font (font-spec :family "Hack" :size 17)
      doom-symbol-font (font-spec :family "jetBrainsMono Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "Adwaita Sans" :size 18))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(add-to-list 'custom-theme-load-path (expand-file-name "themes" doom-user-dir))
;; (setq doom-theme 'doom-subtle-dark)
(setq doom-theme 'doom-gruvbox-simple)

(add-to-list 'exec-path (expand-file-name "~/.local/share/mise/shims/"))
(setenv "PATH" (concat (expand-file-name "~/.local/share/mise/shims:") (getenv "PATH")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 1)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


(setq-default tab-width 2
              indent-tabs-mode nil)

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
(use-package! drag-stuff
  :config
  (drag-stuff-global-mode 1)

  (map!
   :n "M-<up>"    #'drag-stuff-up
   :n "M-<down>"  #'drag-stuff-down
   :v "M-<up>"    #'drag-stuff-up
   :v "M-<down>"  #'drag-stuff-down
   :i "M-<up>"    #'drag-stuff-up
   :i "M-<down>"  #'drag-stuff-down))

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

(add-hook 'typescript-ts-mode-hook
          (lambda ()
            (setq-local tab-width 2)
            (setq-local typescript-ts-mode-indent-offset 2)
            (setq-local indent-tabs-mode nil)))

(after! treesit
  (setq treesit-language-source-alist
        '((bash "https://github.com/tree-sitter/tree-sitter-bash")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml"))))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-ts-mode))

(setq-default line-spacing 0)
;; Enable breadcrumbs only for programming modes to save performance elsewhere
;; Customizing it to only show the function/type (imenu) and hide the project path
(defun my/setup-breadcrumb ()
  (require 'breadcrumb)
  (setq header-line-format '(:eval (breadcrumb-imenu-crumbs))))
(add-hook 'prog-mode-hook #'my/setup-breadcrumb)

;; (after! whitespace
;;   (setq whitespace-style '(face spaces tabs space-mark tab-mark trailing))
;;   (custom-set-faces!
;;     '(whitespace-space :foreground "#252525" :background unspecified)
;;     '(whitespace-tab :foreground "#252525" :background unspecified)
;;     '(whitespace-trailing :background "#ff5050")))

;; (whitespace-mode -1)

(after! eglot
  ;; 1. Automatically turn on inlay hints when a server attaches
  ;; (add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode)

  ;; 2. Clear out legacy node-js wrappers from Eglot's hardcoded fallback list
  (setq eglot-server-programs
        (assoc-delete-all '(typescript-mode typescript-ts-mode tsx-ts-mode js-mode js-ts-mode)
                          eglot-server-programs))

  ;; 3. Force Eglot to communicate natively with TypeScript 7
  (add-to-list 'eglot-server-programs
               '((typescript-mode typescript-ts-mode tsx-ts-mode js-mode js-ts-mode)
                 "tsc" "--lsp" "-stdio"
                 :initializationOptions
                 (:preferences
                  (:includeInlayParameterNameHints "all"
                   :includeInlayVariableTypeHints nil
                   :includeInlayFunctionLikeReturnTypeHints nil
                   :includeInlayPropertyDeclarationTypeHints nil
                   :includeInlayEnumMemberValueHints nil))))

  (setq-default eglot-workspace-configuration
                '(:typescript
                  (:inlayHints
                   (:includeInlayParameterNameHints "all"
                    :includeInlayVariableTypeHints nil
                    :includeInlayFunctionLikeReturnTypeHints nil
                    :includeInlayPropertyDeclarationTypeHints nil
                    :includeInlayEnumMemberValueHints nil))
                  :gopls
                  (:hints
                   (:assignVariableTypes t
                    :compositeLiteralFields t
                    :compositeLiteralTypes t
                    :constantValues t
                    :functionTypeParameters t
                    :parameterNames t
                    :rangeVariableTypes t))))

  ;; Disable logging for better performance
  (setq eglot-events-buffer-size 0)

  ;; Shut down the server when last managed buffer is killed
  (setq eglot-autoshutdown t)

  ;; Increase read size for faster JSON parsing
  (setq read-process-output-max (* 1024 1024)) ;; 1MB for faster LSP IPC
  
  ;; Don't block the UI to sync edits with the LSP server
  (setq eglot-sync-connect 0))

;; Prevent constant UI freezing from documentation lookups
(setq eldoc-idle-delay 0.5)
(setq eldoc-echo-area-use-multiline-p nil)

(use-package! indent-bars
  :hook ((prog-mode . indent-bars-mode))
  :config
  (setq
   indent-bars-color '(highlight :face-bg t :blend 0.08)
   indent-bars-pattern "." ; A solid dot creates a continuous, gapless line
   indent-bars-width-frac 0.1
   indent-bars-pad-frac 0.1
   indent-bars-zigzag nil
   indent-bars-color-by-depth nil
   indent-bars-highlight-current-depth '(:blend 0.9)
   indent-bars-display-on-blank-lines t))

(use-package! savehist
  :init
  (savehist-mode 1))

(after! corfu
  ;; Enable corfu only in programming modes
  ;; (add-hook 'prog-mode-hook #'corfu-mode)
  (add-hook 'prog-mode-hook
            (lambda ()
              (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
              (add-to-list 'completion-at-point-functions #'cape-file t)
              (add-to-list 'completion-at-point-functions #'cape-keyword t)))
  
  (add-hook 'corfu-mode-hook #'corfu-history-mode)
  ;; Add dabbrev (text completion from open buffers) to the global completion list
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)

  ;; Popup info
  (add-hook 'corfu-mode-hook #'corfu-popupinfo-mode)

  (corfu-popupinfo-mode 1)
  (setq corfu-popupinfo-delay 0.1)
  (setq corfu-popupinfo-max-width 70
        corfu-popupinfo-max-height 17)

  (setq corfu-auto t                 ;; Enable auto completion
        corfu-auto-delay 0.05        ;; Slight delay to prevent typing micro-stutters
        corfu-auto-prefix 1          ;; Pop up after typing just 1 character
        corfu-scroll-margin 2        ;; Scroll margin at the top/bottom of the menu
        corfu-count 14               ;; Show more items in the popup (default is 10)
        corfu-preview-current nil    ;; Disable previewing the current item inline (cleaner)
        corfu-bar-width 0.2          ;; Make the scrollbar thinner
        corfu-margin 3               ;; Add a bit of horizontal padding to the popup
        )
  (corfu-history-mode 1))

;; (pixel-scroll-precision-mode 1)
;; Make scrolling slightly faster/more natural
;; (setq pixel-scroll-precision-interpolate-page t)


;; Add padding to the edges of Emacs
(add-to-list 'default-frame-alist '(internal-border-width . 0))
(custom-set-faces! '(internal-border :background "#060500"))

;; Minimal window dividers
(setq window-divider-default-places 'right-only
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(window-divider-mode 1)

;; Defer syntax highlighting while scrolling
;; Defer syntax highlighting slightly to make typing incredibly smooth (Zed-like)
(setq jit-lock-defer-time 0.05)
(setq jit-lock-stealth-time 1)

(global-so-long-mode 1)

(after! doom-modeline
  (setq doom-modeline-enable-word-count nil
        doom-modeline-buffer-encoding nil
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-height 30)) ;; Make it slightly taller for a premium feel

;; Disable global word wrap (expensive in code buffers). Doom enables it in text-modes automatically.
;; (+global-word-wrap-mode 1)

(after! vterm
  (setq vterm-shell "/bin/bash"))

;; 
;; Dumb Jump explicit configuration
;; 
(use-package! dumb-jump
  :config
  ;; Use ripgrep for faster searching
  (setq dumb-jump-force-searcher 'rg)
  (setq dumb-jump-aggressive nil)
  :bind (("M-g j" . dumb-jump-go)
         ("M-g o" . dumb-jump-go-other-window)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)))
