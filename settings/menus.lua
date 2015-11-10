local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- Create a laucher widget and a main menu
myawesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "code it", "atom /home/dsont/.config/awesome" },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}


mythememenu = {}

function theme_load(theme)
  local cfg_path = awful.util.getdir("config")

  -- Create a symlink from the given theme to /home/user/.config/awesome/current_theme
  awful.util.spawn("ln -sfn /usr/share/awesome/themes/" .. theme .. " " .. cfg_path .. "/current_theme")
  awesome.restart()
end

function theme_menu()
  -- List your theme files and feed the menu table
  local cmd = "ls -1 /usr/share/awesome/themes"
  local f = io.popen(cmd)

  for l in f:lines() do
    local item = { l, function () theme_load(l) end }
    table.insert(mythememenu, item)
  end

  f:close()
end
theme_menu()

mylaunchmenu = {}
function launchmenu()

  local cmd = "ls -1 " .. awful.util.getdir("config") .. "/launchmenu"
  local f = io.popen(cmd)

  for l in f:lines() do
    local item = { l, l }
    table.insert(mylaunchmenu, item)
  end

  f:close()
end
launchmenu()


mycodemenu = {}
function codemenu()

  local cmd = "ls -1 /home/dsont/code"
  local f = io.popen(cmd)

  for l in f:lines() do
    local item = { l, "atom /home/dsont/code/" .. l }
    table.insert(mycodemenu, item)
  end

  f:close()
end
codemenu()

mymainmenu = awful.menu({ items = {
  { "Code Dot-Files", "atom $DOTFILES" },
  { "awesome", myawesomemenu, beautiful.awesome_icon },
  { "themes", mythememenu, beautiful.awesome_icon },
  { "launch", mylaunchmenu, beautiful.awesome_icon },
  { "code", mycodemenu, beautiful.awesome_icon },
}
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it






hacks = {}
function hacksmenu()
  local cmd = "ls -1 $DOTFILES/commands/ | grep -oE '[^/]*ui.sh'"
  local f = io.popen(cmd)
  for l in f:lines() do
    local item = { l, '$DOTFILES/commands/' .. l }
    table.insert(hacks, item)
  end
  local item = { 'Open Hacks', 'urxvt --working-directory=$DOTFILES/commands' }
  table.insert(hacks, item)
  f:close()
end
hacksmenu()




hackItDown = awful.menu({ items = {
  { "grun", "grun" },
  { "hacks", hacks, beautiful.awesome_icon },
}})

mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = hackItDown
})
