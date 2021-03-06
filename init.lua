require "utils"
spaces = require("hs._asm.undocumented.spaces")

local main_monitor = "Color LCD"
local second_monitor = "PHL 272S4L"

-- settings
hs.window.animation = 0

-- bindings
bindHyper("R", function() hs.reload() end)

bindHyper("Left", function() pushActive(0, 0, 1/2, 1) end)
bindHyper("Right", function() pushActive(1/2, 0, 1/2, 1) end)
bindHyper("F", function() pushActive(0, 0, 1, 1) end)

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

bindHyper("6", function ()
	local newSpaceId = spaces.createSpace()
	local win

	win = newWindow("Google Chrome", newSpaceId)
	push(win, 0, 0, 1/2, 1)

	win = newWindow("iTerm2", newSpaceId)
	push(win, 1/2, 0, 1/2, 1/2)

	win = newWindow("Sublime Text", newSpaceId)
	push(win, 1/2, 1/2, 1/2, 1/2)

	spaces.changeToSpace(newSpaceId)
end)

-- all done now
hs.alert.show("Config loaded")
