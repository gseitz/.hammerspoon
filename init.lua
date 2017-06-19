require "utils"

-- settings
hs.window.animation = 0

-- bindings
bindHyper("R", function() hs.reload() end)

bindHyper("Left", push(0, 0, 1/2, 1))
bindHyper("Right", push(1/2, 0, 1/2, 1))
bindHyper("F", push(0, 0, 1, 1))

appShortcut("iTerm", "I")
appShortcut("Slack", "S")
appShortcut("Google Chrome", "G")
appShortcut("Sublime Text", "T")



-- all done now
hs.alert.show("Config loaded")
