local M = {}

M.base_30 = {
  white = "#cccccc",
  darker_black = "#020200",
  black = "#020200", -- nvim bg
  black2 = "#070707",
  one_bg = "#121212",
  one_bg2 = "#1c1c1c",
  one_bg3 = "#333333",
  grey = "#333333",
  grey_fg = "#606060",
  grey_fg2 = "#555555",
  light_grey = "#7a7a7a",
  red = "#ff5050",
  baby_pink = "#ff5050",
  pink = "#bb9af7",
  line = "#303030", -- for lines like vertsplit
  green = "#9ece6a",
  vibrant_green = "#9acf6a",
  nord_blue = "#b2e9ff",
  blue = "#b2e9ff",
  yellow = "#f5e642",
  sun = "#f5e642",
  purple = "#bb9af7",
  dark_purple = "#9999cc",
  teal = "#b4f9f8",
  orange = "#dfef20",
  cyan = "#b4f9f8",
  statusline_bg = "#020200",
  lightbg = "#121212",
  pmenu_bg = "#b2e9ff",
  folder_bg = "#b2e9ff",
}

M.base_16 = {
  base00 = "#020200",
  base01 = "#121212",
  base02 = "#1c1c1c",
  base03 = "#404040",
  base04 = "#555555",
  base05 = "#cccccc",
  base06 = "#e5e5e5",
  base07 = "#e5e5e5",
  base08 = "#ff5050",
  base09 = "#e5e5e5",
  base0A = "#9999cc",
  base0B = "#9acf6a",
  base0C = "#9ece6a",
  base0D = "#b2e9ff",
  base0E = "#a9b1d5",
  base0F = "#bb9af7",
}

M.polish_hl = {
  syntax = {
    Boolean = { fg = M.base_16.base06 },
    Constant = { fg = M.base_16.base06 },
    Number = { fg = M.base_16.base06 },
    Operator = { fg = M.base_16.base05 },
  },

  treesitter = {
    ["@attribute"] = { fg = M.base_16.base0C },
    ["@boolean"] = { fg = M.base_16.base06 },
    ["@constant"] = { fg = M.base_16.base06 },
    ["@label"] = { fg = M.base_16.base0C },
    ["@number"] = { fg = M.base_16.base06 },
    ["@operator"] = { fg = M.base_16.base05 },
    ["@property"] = { fg = M.base_16.base05 },
    ["@punctuation.bracket"] = { fg = M.base_16.base05 },
    ["@punctuation.delimiter"] = { fg = M.base_16.base05 },
    ["@tag"] = { fg = M.base_16.base05 },
    ["@variable.member"] = { fg = M.base_16.base05 },
    ["@variable.parameter"] = { fg = M.base_16.base05 },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "doom-subtle-dark")

return M
