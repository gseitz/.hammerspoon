require "utils"

local main_monitor = "Color LCD"
local second_monitor = "PHL 272S4L"

-- settings
hs.window.animation = 0

-- bindings
bindHyper("R", function() hs.reload() end)

bindHyper("Left", push(0, 0, 1/2, 1))
bindHyper("Right", push(1/2, 0, 1/2, 1))
bindHyper("F", push(0, 0, 1, 1))

bindHyper("`", function() hs.alert.show(os.date("%A %b %d, %Y - %H:%M"), 4) end)

bindHyper("1", moveToMonitor(main_monitor))
bindHyper("2", moveToMonitor(second_monitor))

appShortcut("iTerm", "I")
appShortcut("Slack", "S")
appShortcut("Google Chrome", "G")
appShortcut("Sublime Text", "T")
appShortcut("Intellij IDEA CE", "J")
appShortcut("zoom.us", "Z")
appShortcut("Spotify", "O")

-- all done now
hs.alert.show("Config loaded")
