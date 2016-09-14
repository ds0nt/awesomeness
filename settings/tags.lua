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

default_tags = {
  names  = { " 1 ", " 10 ", " 11 ", " 100 ", " 101 ", " 110 ", " 111 " },
  layouts = layouts
}

tags = {}
for i=1,screen.count() do
  -- body...
  tags[i] = awful.tag(default_tags.names, i, default_tags.layouts)
end
