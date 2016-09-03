local awful = require("awful")

-- xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'
local XF86AudioLowerVolume = "#122"
local XF86AudioRaiseVolume = "#123"
local XF86AudioPrev = "#173"
local XF86AudioPlay = "#172"
local XF86AudioNext = "#171"
local XF86Sleep = "#150"
local XF86AudioMute = "#121"

local numpad = { "#87", "#88", "#89", "#83", "#84", "#85", "#79", "#80", "#81" }
local alt = "Mod1"
local mod = "Mod4"
local ctrl = "Control"
local shift = "Shift"

confdir = awful.util.getdir("config")

-- GLOBAL KEYBINDINGS
globalkeys = awful.util.table.join(globalkeys,

    -- awful.key({ mod, }, "p", function () awful.util.spawn('bash -ic \"xfce4-appfinder\"') end),

    awful.key({  }, XF86AudioLowerVolume, awful.tag.viewprev),
    awful.key({  }, XF86AudioRaiseVolume, awful.tag.viewnext),
    awful.key({ mod }, XF86AudioLowerVolume, function () awful.screen.focus_relative( 1) end),
    awful.key({ mod }, XF86AudioRaiseVolume, function () awful.screen.focus_relative(-1) end),
    awful.key({ mod, }, "Delete", function () awful.util.spawn("bash -ic \"zenrun\"") end),
    awful.key({ mod, }, "Return", function () awful.util.spawn("terminator") end),

    awful.key({ mod, }, "w", function () mymainmenu:show() end),

    awful.key({ mod, }, "s", function () awful.util.spawn("scrot", "-s") end),

    awful.key({ mod, }, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end))

-- CLIENT KEYS (work on current clients-windows)
clientkeys = awful.util.table.join(clientkeys,
    awful.key({ mod, }, "q",      function (c) c:kill() end)
)

-- CLIENT BUTTONS BINDINGS
clientbuttons = awful.util.table.join(clientbuttons)
