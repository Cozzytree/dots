;;; themes/doom-simple-theme.el -*- lexical-binding: t; -*-

(require 'doom-themes)

(defgroup doom-simple-theme nil
  "Options for doom-simple-theme."
  :group 'doom-themes)

(def-doom-theme doom-simple
    "A dark theme based on the simple.json Zed theme."

  ;; name        default   256       16
  ((bg         '("#020100" nil       nil            ))
   (bg-alt     '("#0b0b0a" nil       nil            ))
   (base0      '("#0b0b0a" "black"   "black"        ))
   (base1      '("#020100" "#1e1e1e" "brightblack"  ))
   (base2      '("#161615" "#2e2e2e" "brightblack"  ))
   (base3      '("#444b4a" "#262626" "brightblack"  ))
   (base4      '("#787c99" "#3f3f3f" "brightblack"  ))
   (base5      '("#a9b1d6" "#525252" "brightblack"  ))
   (base6      '("#cbccd1" "#6b6b6b" "brightblack"  ))
   (base7      '("#d5d6db" "#979797" "brightblack"  ))
   (base8      '("#ffffff" "#dfdfdf" "white"        ))
   (fg         '("#d4daf0" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#787c99" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#ff5050" "#ff6655" "red"          ))
   (orange     '("#dfef20" "#dd8844" "brightred"    ))
   (green      '("#9ece6a" "#99bb66" "green"        ))
   (teal       '("#2ac3de" "#44b9b1" "brightgreen"  ))
   (yellow     '("#f5e642" "#ecbe7b" "yellow"       ))
   (blue       '("#b4f9f8" "#51afef" "brightblue"   ))
   (dark-blue  '("#0db9d7" "#2257A0" "blue"         ))
   (magenta    '("#bb9af7" "#c678dd" "brightmagenta"))
   (violet     '("#a9b1d5" "#a9a1e1" "magenta"      ))
   (cyan       '("#b4f9f8" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#2ac3de" "#5699AF" "cyan"         ))

   ;; face categories
   (highlight      blue)
   (vertical-bar   base2)
   (selection      base2)
   (builtin        magenta)
   (comments       base3)
   (doc-comments   base3)
   (constants      violet)
   (functions      "#cccccc")
   (keywords       "#dfef20")
   (methods        "#cccccc")
   (operators      fg)
   (type           "#7a7a7a")
   (strings        "#9acf6a")
   (variables      "#ffffff")
   (numbers        fg)
   (region         base2)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red))

  ;; custom faces
  (
   (lazy-highlight :background base2 :foreground fg)
   (line-number :foreground "#505048" :background bg)
   (line-number-current-line :foreground "#ef2fff" :background bg :weight 'semi-bold)
   (hl-line :background bg-alt)
   (solaire-default-face :background bg)
   (solaire-hl-line-face :background bg-alt)
   (vterm-color-default :background bg :foreground fg)
   (mode-line :background "#181816" :foreground "#e0e0df" :box nil)
   (mode-line-inactive :background "#0c0c0b" :foreground "#70706d" :box nil)
   (corfu-default :background "#0b0b0a")
   (corfu-current :background "#181817")
   (company-tooltip :background "#0b0b0a")
   (company-tooltip-selection :background "#181817")
   (tooltip :background "#0b0b0a")
   (markdown-code-face :background base0)
   (markdown-inline-code-face :background base0)
   (markdown-pre-face :background base0)
   (eldoc-box-body :background bg)
   (eldoc-box-border :background base2)
   (font-lock-function-name-face :foreground functions :weight 'semi-bold)
   (font-lock-type-face :foreground type :weight 'semi-bold)
   (font-lock-variable-name-face :foreground fg)
   (font-lock-property-name-face :foreground fg)
   (font-lock-property-use-face :foreground fg)
   ))

;;; doom-simple-theme.el ends here
