;;; themes/doom-gruvbox-simple-theme.el -*- lexical-binding: t; -*-

(require 'doom-themes)

(defgroup doom-gruvbox-simple-theme nil
  "Options for doom-gruvbox-simple-theme."
  :group 'doom-themes)

(def-doom-theme doom-gruvbox-simple
    "A Gruvbox Hard theme retaining the custom simple background."

  ;; name        default   256       16
  ((bg         '("#000000" nil       nil            ))
   (bg-alt     '("#0b0b0a" nil       nil            ))
   (base0      '("#0b0b0a" "black"   "black"        ))
   (base1      '("#000000" "#1e1e1e" "brightblack"  ))
   (base2      '("#161615" "#2e2e2e" "brightblack"  ))
   (base3      '("#928374" "#262626" "brightblack"  ))
   (base4      '("#665c54" "#3f3f3f" "brightblack"  ))
   (base5      '("#bdae93" "#525252" "brightblack"  ))
   (base6      '("#d5c4a1" "#6b6b6b" "brightblack"  ))
   (base7      '("#ebdbb2" "#979797" "brightblack"  ))
   (base8      '("#fbf1c7" "#dfdfdf" "white"        ))
   (fg         '("#ebdbb2" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#d5c4a1" "#2d2d2d" "white"        ))

   (grey       '("#555555" "grey"    "grey"         ))
   (red        '("#fb4934" "#ff6655" "red"          ))
   (orange     '("#fe8019" "#dd8844" "brightred"    ))
   (green      '("#b8bb26" "#99bb66" "green"        ))
   (teal       '("#8ec07c" "#44b9b1" "brightgreen"  ))
   (yellow     '("#fabd2f" "#ecbe7b" "yellow"       ))
   (blue       '("#83a598" "#51afef" "brightblue"   ))
   (dark-blue  '("#458588" "#2257A0" "blue"         ))
   (magenta    '("#d3869b" "#c678dd" "brightmagenta"))
   (violet     '("#b16286" "#a9a1e1" "magenta"      ))
   (cyan       '("#8ec07c" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#689d6a" "#5699AF" "cyan"         ))

   ;; face categories
   (highlight      blue)
   (vertical-bar   base2)
   (selection      base2)
   (builtin        orange)
   (comments       grey)
   (doc-comments   grey)
   (constants      magenta)
   (functions      teal)
   (keywords       red)
   (methods        teal)
   (operators      fg)
   (type           yellow)
   (strings        green)
   (variables      fg)
   (numbers        magenta)
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
   (font-lock-variable-name-face :foreground fg)
   (font-lock-property-name-face :foreground fg)
   (font-lock-property-use-face :foreground fg)
   ))

;;; doom-gruvbox-simple-theme.el ends here
