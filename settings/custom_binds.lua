local awful = require("awful")

local numpad = { "#87", "#88", "#89", "#83", "#84", "#85", "#79", "#80", "#81" }
local alt = "Mod1"
local mod = "Mod4"
local ctrl = "Control"
local shift = "Shift"

confdir = awful.util.getdir("config")

-- GLOBAL KEYBINDINGS
globalkeys = awful.util.table.join(globalkeys,

    -- markdown
    awful.key({ ctrl, alt, }, 1, function () awful.util.spawn('xfce4-terminal --geometry=80x30 --hide-menubar --hide-toolbar --hide-borders --working-directory="/home/dsont"') end),
    awful.key({ ctrl, alt, }, 2, function () awful.util.spawn('xfce4-terminal --geometry=80x30 --hide-menubar --hide-toolbar --hide-borders --working-directory="/home/dsont/dot-files/commands"') end),
    awful.key({ ctrl, alt, }, 3, function () awful.util.spawn('xfce4-terminal --geometry=80x30 --hide-menubar --hide-toolbar --hide-borders --working-directory="/home/dsont/go/src/github.com/ds0nt"') end),
    awful.key({ ctrl, alt, }, 4, function () awful.util.spawn('xfce4-terminal --geometry=80x30 --hide-menubar --hide-toolbar --hide-borders --working-directory="/home/dsont/work"') end),


    awful.key({ mod, }, "Delete", function () awful.util.spawn("bash -ic \"zenrun\"") end),
    awful.key({ mod, }, "Return", function () awful.util.spawn("urxvt +sb --font -misc-fixed-medium-r-normal--15-140-75-75-c-90-iso8859-1") end),

    awful.key({ mod, }, "w", function () mymainmenu:show() end),

    awful.key({ mod, }, numpad[2], function () awful.util.spawn("bash -ic \"screenshot | zenpipe\"") end),
    awful.key({ mod, }, numpad[5],     function () awful.util.spawn("google-chrome-beta") end),
    awful.key({ mod, }, numpad[7], function () hackItDown:show() end),
    awful.key({ mod, }, numpad[8], function () awful.util.spawn("subl3 " .. confdir .. "/settings/custom_binds.lua") end),
    awful.key({ mod, }, "`",     function () awful.util.spawn("xfce4-terminal --drop-down") end),

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
