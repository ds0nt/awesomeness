local awful = require("awful")
local lain = require("lain")

-- LAYOUTS

layouts =
{
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.fair,
  lain.layout.termfair,
  lain.layout.centerfair,
  lain.layout.cascade,
}

first_tags = {
  names  = { " 1 ", " 10 ", " 11 ", " 100 ", " 101 ", " 110 ", " 111 " },
  layouts = layouts
}

default_tags = {
  names  = { " 1 ", " 10 ", " 11 ", " 100 ", " 101 ", " 110 ", " 111 " },
  layouts = layouts
}

tags = {}
tags[1] = awful.tag(first_tags.names, 1, first_tags.layouts)
if screen.count() > 1 then
  tags[2] = awful.tag(default_tags.names, 2, default_tags.layouts)
end
