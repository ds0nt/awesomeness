local awful = require("awful")

-- LAYOUTS
layouts =
{
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.fair,
}

default_tags = {
  names  = { "I", "II", "III" },
  layouts = layouts
}

tags = {}
tags[1] = awful.tag(default_tags.names, 1, default_tags.layouts)
if screen.count() > 1 then
  tags[2] = awful.tag(default_tags.names, 2, default_tags.layouts)
end
