;;; themes/doom-subtle-dark-theme.el -*- lexical-binding: t; -*-

(require 'doom-themes)

(defgroup doom-subtle-dark-theme nil
  "Options for doom-subtle-dark-theme."
  :group 'doom-themes)

(def-doom-theme doom-subtle-dark
    "A minimalist dark theme relying on font weights and subtle foreground variations."

  ;; Base palette
  ((bg         '("#050502" nil       nil            ))
   (bg-alt     '("#121212" nil       nil            ))
   (base0      '("#121212" "black"   "black"        ))
   (base1      '("#050502" "#1e1e1e" "brightblack"  ))
   (base2      '("#1c1c1c" "#2e2e2e" "brightblack"  ))
   (base3      '("#333333" "#262626" "brightblack"  ))
   (base4      '("#444444" "#3f3f3f" "brightblack"  ))
   (base5      '("#555555" "#525252" "brightblack"  ))
   (base6      '("#777777" "#6b6b6b" "brightblack"  ))
   (base7      '("#999999" "#979797" "brightblack"  ))
   (base8      '("#ffffff" "#dfdfdf" "white"        ))
   (fg         '("#cccccc" "#bfbfbf" "brightwhite"  )) ;; Base foreground
   (fg-alt     '("#999999" "#999999" "white"        )) ;; Slight down

   (fg-light   '("#e5e5e5" "#ffffff" "white"        )) ;; Slight up
   (fg-dark    '("#999999" "#999999" "white"        )) ;; Slight down
   
   ;; Keep green for strings as requested
   (strings    '("#9acf6a" "#99bb66" "green"        )) 

   (grey       base4)
   (red        '("#ff5050" "#ff6655" "red"          ))
   (orange     '("#dfef20" "#dd8844" "brightred"    ))
   (green      '("#9ece6a" "#99bb66" "green"        ))
   (teal       '("#2ac3de" "#44b9b1" "brightgreen"  ))
   (yellow     '("#f5e642" "#ecbe7b" "yellow"       ))
   (blue       '("#b2e9ff" "#51afef" "brightblue"   ))
   (dark-blue  '("#0db9d7" "#2257A0" "blue"         ))
   (magenta    '("#bb9af7" "#c678dd" "brightmagenta"))
   (violet     '("#a9b1d5" "#a9a1e1" "magenta"      ))
   (cyan       '("#b4f9f8" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#2ac3de" "#5699AF" "cyan"         ))

   ;; Map logical faces to the subtle palette
   (functions      blue)
   (keywords       violet)
   (methods        blue)
   (type           fg-alt)
   (variables      fg)
   (constants      fg-light)
   (comments       "#ff50ef")
   (doc-comments   base5)
   (operators      fg)
   (numbers        fg)

   ;; Other UI colors can remain dark/subtle
   (highlight      base2)
   (vertical-bar   base2)
   (selection      base2)
   (builtin        fg-light)
   (region         base2)
   (error          red)
   (warning        yellow)
   (success        strings)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red)
   )

  ;; Custom faces using weights for differentiation
  (
   (font-lock-function-name-face :foreground functions :weight 'bold)
   (font-lock-keyword-face :foreground keywords :weight 'bold)
   (font-lock-type-face :foreground type :weight 'semi-bold)
   (font-lock-variable-name-face :foreground variables)
   (font-lock-constant-face :foreground constants :weight 'semi-bold)
   (font-lock-string-face :foreground strings)
   (font-lock-comment-face :foreground comments :slant 'italic)

   (cursor :background "#f5e642")

   (lazy-highlight :background base2 :foreground fg)
   ;; UI elements
   (line-number :foreground "#202020" :background bg)
   (line-number-current-line :foreground fg-light :background bg :weight 'bold)
   (hl-line :background bg-alt)
   (solaire-default-face :background bg)
   (solaire-hl-line-face :background bg-alt)
   (vterm-color-default :background bg :foreground fg)
   (mode-line :background bg :foreground fg :box '(:line-width 1 :color "#333333" :style nil))
   (mode-line-inactive :background bg :foreground base5 :box '(:line-width 1 :color "#1c1c1c" :style nil))
   (header-line :background bg :foreground fg-alt :underline '(:color "#333333"))

   ;; Doom modeline specific colors to prevent blending
   (doom-modeline-buffer-file :foreground fg-light :weight 'bold)
   (doom-modeline-buffer-path :foreground base6 :weight 'bold)
   (doom-modeline-buffer-modified :foreground orange :weight 'bold)
   (doom-modeline-buffer-project-root :foreground blue :weight 'bold)
   (doom-modeline-bar :background blue)

   (corfu-default :background bg-alt)
   (corfu-current :background base2)
   (company-tooltip :background bg-alt)
   (company-tooltip-selection :background base2)
   (tooltip :background bg-alt)
   (markdown-code-face :background base0)
   (markdown-inline-code-face :background base0)
   (markdown-pre-face :background base0)
   (eldoc-box-body :background bg)
   (eldoc-box-border :background base2)

   ;; Better minibuffer & completion visibility
   (minibuffer-prompt :foreground blue :weight 'bold)
   (vertico-current :background base3 :foreground fg-light :weight 'bold)
   (ivy-current-match :background base3 :foreground fg-light :weight 'bold)
   (completions-common-part :foreground fg :weight 'bold)
   (completions-first-difference :foreground cyan :weight 'bold)
   ))

;;; doom-subtle-dark-theme.el ends here
