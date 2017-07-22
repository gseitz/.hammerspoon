-------------------------------------------------------------------------------
-- from https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
-------------------------------------------------------------------------------
function pushActive(x, y, w, h)
	push(hs.window.focusedWindow(), x, y, w, h)
end

function push(win, x, y, w, h)
	local id = win:id()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f, 0)
end

local HYPER = {"cmd", "alt", "ctrl", "shift"}

function bindHyper(key, func)
	hs.hotkey.bind(HYPER, key, func)
end

function appShortcut(app, key)
	bindHyper(key, function() hs.application.launchOrFocus(app) end)
end

function newWindow(appName, space)
	local app = hs.application.get(appName)
	app:selectMenuItem("New Window")
	local win = app:focusedWindow()
	spaces.moveWindowToSpace(win:id(), space)
	return win
end

function moveToMonitor(monitor)
	return function()
		local win = hs.window.focusedWindow()
		if (win) then
			win:moveToScreen(hs.screen.find(monitor))
		end
	end
end