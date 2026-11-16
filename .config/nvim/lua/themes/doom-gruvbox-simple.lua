local M = {}

M.base_30 = {
  white = "#ebdbb2",
  darker_black = "#030200",
  black = "#030200", -- nvim bg
  black2 = "#0b0b0a",
  one_bg = "#161615",
  one_bg2 = "#262626",
  one_bg3 = "#3f3f3f",
  grey = "#3f3f3f",
  grey_fg = "#555555",
  grey_fg2 = "#665c54",
  light_grey = "#928374",
  red = "#fb4934",
  baby_pink = "#cc241d",
  pink = "#d3869b",
  line = "#161615", -- for lines like vertsplit
  green = "#b8bb26",
  vibrant_green = "#b8bb26",
  nord_blue = "#83a598",
  blue = "#83a598",
  yellow = "#fabd2f",
  sun = "#fabd2f",
  purple = "#d3869b",
  dark_purple = "#b16286",
  teal = "#8ec07c",
  orange = "#fe8019",
  cyan = "#8ec07c",
  statusline_bg = "#030200",
  lightbg = "#0b0b0a",
  pmenu_bg = "#83a598",
  folder_bg = "#83a598",
}

M.base_16 = {
  base00 = "#030200",
  base01 = "#0b0b0a",
  base02 = "#161615",
  base03 = "#505048",
  base04 = "#928374",
  base05 = "#ebdbb2",
  base06 = "#fbf1c7",
  base07 = "#fbf1c7",
  base08 = "#fb4934",
  base09 = "#d3869b",
  base0A = "#fabd2f",
  base0B = "#b8bb26",
  base0C = "#8ec07c",
  base0D = "#8ec07c",
  base0E = "#fb4934",
  base0F = "#fe8019",
}

M.polish_hl = {
  syntax = {
    Boolean = { fg = M.base_16.base09 },
    Constant = { fg = M.base_16.base09 },
    Number = { fg = M.base_16.base09 },
    Operator = { fg = M.base_16.base05 },
  },

  treesitter = {
    ["@attribute"] = { fg = M.base_16.base0C },
    ["@boolean"] = { fg = M.base_16.base09 },
    ["@constant"] = { fg = M.base_16.base09 },
    ["@label"] = { fg = M.base_16.base0C },
    ["@number"] = { fg = M.base_16.base09 },
    ["@operator"] = { fg = M.base_16.base05 },
    ["@property"] = { fg = "#cfccbc" },
    ["@punctuation.bracket"] = { fg = M.base_16.base05 },
    ["@punctuation.delimiter"] = { fg = M.base_16.base05 },
    ["@tag"] = { fg = "#afefbf" },
    ["@variable.member"] = { fg = "#cfccbc" },
    ["@variable.member.key"] = { fg = "#cfccbc" },
    ["@variable.parameter"] = { fg = M.base_16.base05 },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "doom-gruvbox-simple")

return M
