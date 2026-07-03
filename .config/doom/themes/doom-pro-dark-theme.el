;;; themes/doom-pro-dark-theme.el -*- lexical-binding: t; -*-

(require 'doom-themes)

(defgroup doom-pro-dark-theme nil
  "Options for doom-pro-dark-theme."
  :group 'doom-themes)

(def-doom-theme doom-pro-dark
    "A high-contrast dark theme with highly differentiated syntax colors."

  ;; name        default   256       16
  ((bg         '("#000000" nil       nil            ))
   (bg-alt     '("#0b0b0a" nil       nil            ))
   (base0      '("#0b0b0a" "black"   "black"        ))
   (base1      '("#000000" "#1e1e1e" "brightblack"  ))
   (base2      '("#161615" "#2e2e2e" "brightblack"  ))
   (base3      '("#6b7280" "#262626" "brightblack"  ))
   (base4      '("#665c54" "#3f3f3f" "brightblack"  ))
   (base5      '("#bdae93" "#525252" "brightblack"  ))
   (base6      '("#c6bba0" "#6b6b6b" "brightblack"  ))
   (base7      '("#d3c6aa" "#979797" "brightblack"  ))
   (base8      '("#e5d5b7" "#dfdfdf" "white"        ))
   (fg         '("#cccccc" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#aaaaaa" "#2d2d2d" "white"        ))

   (grey       '("#606060" "grey"    "grey"         ))
   (red        '("#f38ba8" "#ff6655" "red"          ))
   (orange     '("#fab387" "#dd8844" "brightred"    ))
   (green      '("#a6e3a1" "#99bb66" "green"        ))
   (teal       '("#94e2d5" "#44b9b1" "brightgreen"  ))
   (yellow     '("#f9e2af" "#ecbe7b" "yellow"       ))
   (blue       '("#8caaee" "#51afef" "brightblue"   ))
   (dark-blue  '("#74c7ec" "#2257A0" "blue"         ))
   (magenta    '("#f5c2e7" "#c678dd" "brightmagenta"))
   (violet     '("#cba6f7" "#a9a1e1" "magenta"      ))
   (cyan       '("#95d5c0" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#7ab2a0" "#5699AF" "cyan"         ))

   ;; face categories mapped for maximum differentiation
   (highlight      blue)
   (vertical-bar   base2)
   (selection      base2)
   (builtin        teal)
   (comments       grey)
   (doc-comments   grey)
   (constants      orange)
   (functions      blue)
   (keywords       magenta)
   (methods        cyan)
   (operators      fg-alt)
   (type           yellow)
   (strings        green)
   (variables      fg)
   (numbers        violet)
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
   (line-number-current-line :foreground yellow :background bg :weight 'semi-bold)
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
   (font-lock-keyword-face :foreground keywords :weight 'semi-bold)
   (font-lock-constant-face :foreground constants :weight 'semi-bold)
   (font-lock-variable-name-face :foreground fg)
   (font-lock-property-name-face :foreground fg)
   (font-lock-property-use-face :foreground fg)
   ))

;;; doom-pro-dark-theme.el ends here
