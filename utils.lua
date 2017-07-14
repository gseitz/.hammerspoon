-------------------------------------------------------------------------------
-- from https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
-------------------------------------------------------------------------------
function push(x, y, w, h)
  return function ()
  	local win = hs.window.focusedWindow()
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
end

function bindHyper(key, func)
	hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, key, func)
end

function appShortcut(app, key)
	bindHyper(key, function() hs.application.launchOrFocus(app) end)
end

function moveToMonitor(monitor)
	return function()
		local win = hs.window.focusedWindow()
		if (win) then
			win:moveToScreen(hs.screen.find(monitor))
		end
	end
end