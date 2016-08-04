local awful = require("awful")

local numpad = { "#87", "#88", "#89", "#83", "#84", "#85", "#79", "#80", "#81" }
local alt = "Mod1"
local mod = "Mod4"
local ctrl = "Control"
local shift = "Shift"

confdir = awful.util.getdir("config")

-- GLOBAL KEYBINDINGS
globalkeys = awful.util.table.join(globalkeys,

    -- awful.key({ mod, }, "p", function () awful.util.spawn('bash -ic \"xfce4-appfinder\"') end),

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
