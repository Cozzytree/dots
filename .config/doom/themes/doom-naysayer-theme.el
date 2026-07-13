;;; themes/doom-naysayer-theme.el -*- lexical-binding: t; -*-

(require 'doom-themes)

(defgroup doom-naysayer-theme nil
  "Options for doom-naysayer-theme."
  :group 'doom-themes)

(def-doom-theme doom-naysayer
    "A theme inspired by Jonathan Blow's compiler livestreams (naysayer)."

  ;; Base palette
  ((bg         '("#072626" nil       nil            ))
   (bg-alt     '("#041818" nil       nil            ))
   (base0      '("#041818" "black"   "black"        ))
   (base1      '("#072626" "#1e1e1e" "brightblack"  ))
   (base2      '("#0b3335" "#2e2e2e" "brightblack"  )) ;; highlight line
   (base3      '("#11494c" "#262626" "brightblack"  ))
   (base4      '("#186569" "#3f3f3f" "brightblack"  ))
   (base5      '("#248d94" "#525252" "brightblack"  ))
   (base6      '("#34a4ab" "#6b6b6b" "brightblack"  ))
   (base7      '("#4ac1c9" "#979797" "brightblack"  ))
   (base8      '("#ffffff" "#dfdfdf" "white"        ))
   (fg         '("#d3b58d" "#bfbfbf" "brightwhite"  )) ;; text tan
   (fg-alt     '("#a89379" "#999999" "white"        ))

   (grey       base4)
   (red        '("#ff0000" "#ff6655" "red"          ))
   (orange     '("#ffaa00" "#dd8844" "brightred"    ))
   (green      '("#44b340" "#99bb66" "green"        )) ;; comments green
   (teal       '("#2ec09c" "#44b9b1" "brightgreen"  )) ;; strings cyan/green
   (yellow     '("#e6db74" "#ecbe7b" "yellow"       ))
   (blue       '("#c1d1e3" "#51afef" "brightblue"   )) ;; variables blueish
   (dark-blue  '("#42a5f5" "#2257A0" "blue"         )) ;; brightened selection blue
   (magenta    '("#fd5ff0" "#c678dd" "brightmagenta"))
   (violet     '("#ae81ff" "#a9a1e1" "magenta"      ))
   (cyan       '("#7ad0c6" "#46D9FF" "brightcyan"   )) ;; constants cyan
   (dark-cyan  '("#0b3335" "#5699AF" "cyan"         ))

   ;; Logical faces mapped to Naysayer palette
   (functions      '("#ffffff" nil nil))
   (keywords       teal)
   (methods        fg)
   (type           blue)
   (variables      fg)
   (constants      fg)
   (comments       '("#3fdf1f" nil nil))
   (doc-comments   '("#3fdf1f" nil nil))
   (operators      fg) ;; punctuation
   (numbers        fg)
   (strings        '("#0fdfaf" nil nil))

   ;; UI colors
   (highlight      '("darkseagreen2" nil nil))
   (vertical-bar   base1)
   (selection      base3)
   (builtin        '("lightgreen" nil nil))
   (region         '("blue" nil nil))
   (error          red)
   (warning        '("#504038" nil nil))
   (success        strings)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red)
   )

  ;; Custom faces
  (
   (font-lock-function-name-face :foreground functions :weight 'semi-bold)
   (font-lock-keyword-face :foreground keywords)
   (font-lock-type-face :foreground type)
   (font-lock-variable-name-face :foreground variables)
   (font-lock-constant-face :foreground constants)
   (font-lock-string-face :foreground strings)
   (font-lock-comment-face :foreground comments :slant 'italic)
   (font-lock-builtin-face :foreground builtin)
   (font-lock-warning-face :foreground warning)
   (cursor :background "lightgreen")

   (lazy-highlight :background highlight :foreground "navyblue")
   (line-number :foreground base4 :background bg)
   (line-number-current-line :foreground fg :background bg :weight 'bold)
   (hl-line :background base2)
   (solaire-default-face :background bg)
   (solaire-hl-line-face :background base2)
   (vterm-color-default :background bg :foreground fg)
   (mode-line :background bg-alt :foreground fg :box nil)
   (mode-line-inactive :background bg :foreground fg-alt :box nil)
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
   (vertico-current :background base3 :foreground fg :weight 'bold)
   (ivy-current-match :background base3 :foreground fg :weight 'bold)
   (completions-common-part :foreground fg :weight 'bold)
   (completions-first-difference :foreground cyan :weight 'bold)
   ))

;;; doom-naysayer-theme.el ends here
