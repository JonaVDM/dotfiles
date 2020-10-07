-- Hendrik Peters Hammerspoon config
-- Edited by Jonathan
-- Removed the vim things & react native
-- ---------------------------------

-- These dotfiles are the configuration of Hammerspoon for OSX.
-- More info and download links to the software can be found on their site
-- https://www.hammerspoon.org/

hyper = {'ctrl', 'alt', 'cmd'}
placid = {'ctrl', 'cmd'}

-- Window manager
hs.loadSpoon('MiroWindowsManager')
hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {placid, 'K'},
  right = {placid, 'L'},
  down = {placid, 'J'},
  left = {placid, 'H'},
  fullscreen = {placid, 'g'}
})

-- Some Ad-ons for the window manager
require('SelfSpoons/WindowManagement')

-- Clipboard Manager
hs.loadSpoon('ClipboardTool')
spoon.ClipboardTool.hist_size = 100
spoon.ClipboardTool.show_in_menubar = false
spoon.ClipboardTool:start()
spoon.ClipboardTool:bindHotkeys({
  toggle_clipboard = {placid, 'V'}
})

-- Caffeine
hs.loadSpoon('Caffeine')
spoon.Caffeine:bindHotkeys({
  toggle = {placid, '6'}
})
spoon.Caffeine:start()

-- Open the terminal (like ctrl + alt + t on linux)
hs.hotkey.bind(placid, 'T', function()
  hs.application.open('alacritty')
end)

-- Open spotify
hs.hotkey.bind(placid, 'S', function()
  hs.application.open('Spotify')
end)

-- Open VS-Code
hs.hotkey.bind(placid, 'C', function()
  hs.application.open('Visual Studio Code')
end)

-- Open Browser (Firefox)
hs.hotkey.bind(placid, 'B', function()
  hs.application.open('Firefox')
end)

-- Awesome WIFI tools
require('SelfSpoons/WifiWatcher')

-- Reload automatically
require('SelfSpoons/Reloader')
