  local dashboard = require "alpha.themes.dashboard"

  local function header()
    return require("cyruswalker.logos")["random"]
  end

  dashboard.section.header.val = header()
