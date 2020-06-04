-- Window management Spoon and some extra config
-- ---------------------------------------------
local placid = placid or {"ctrl", "cmd"}
local hyper = hyper or {"ctrl", "alt", "cmd"}

-- Set current frontmostWindow to full-screen
hs.hotkey.bind(placid, "return", function()
  local win = hs.window.frontmostWindow()
  win:setFullscreen(not win:isFullscreen())
end)

-- Move windows around spaces
-- https://github.com/Hammerspoon/hammerspoon/issues/235
local hotkey = require "hs.hotkey"
local window = require "hs.window"
-- local screen = require "hs.screen"
local spaces = require "hs._asm.undocumented.spaces"

function getGoodFocusedWindow(nofull)
   local win = window.focusedWindow()
   if not win or not win:isStandard() then return end
   if nofull and win:isFullScreen() then return end
   return win
end

function flashScreen(screen)
   local flash=hs.canvas.new(screen:fullFrame()):appendElements({
   action = "fill",
   fillColor = { alpha = 0.25, red=1},
   type = "rectangle"})
   flash:show()
   hs.timer.doAfter(.15,function () flash:delete() end)
end

function switchSpace(skip,dir)
   for i=1,skip do
      hs.eventtap.keyStroke({"ctrl"},dir)
   end
end

function moveWindowOneSpace(dir)
   local win = getGoodFocusedWindow(true)
   if not win then return end
   local screen=win:screen()
   local uuid=screen:spacesUUID()
   local userSpaces=spaces.layout()[uuid]
   local thisSpace=win:spaces() -- first space win appears on
   if not thisSpace then return else thisSpace=thisSpace[1] end
   local last=nil
   local skipSpaces=0
   for _, spc in ipairs(userSpaces) do
      if spaces.spaceType(spc)~=spaces.types.user then -- skippable space
   skipSpaces=skipSpaces+1
      else       -- A good user space, check it
   if last and
      (dir=="left"  and spc==thisSpace) or
      (dir=="right" and last==thisSpace)
   then
      -- move the window to target space
      win:spacesMoveTo(dir=="left" and last or spc)

      -- move the user to the target space
      -- switchSpace(skipSpaces+1,dir) -- put back if win:focus() isn't enough
      win:focus()
      return
   end
   last=spc   -- Haven't found it yet...
   skipSpaces=0
      end
   end
   flashScreen(screen)   -- Shouldn't get here, so no space found
end

-- function removeSpace()
--   local spaceUuid = spaces.activeSpace()
--   local currentScreen = hs.screen.mainScreen()

--   -- local userSpaces=spaces.layout()[uuid]

--   -- spaces.removeSpace(uuid)
--   error(currentScreen.id, 0)
-- end

hotkey.bind(hyper, "L",nil,
      function() moveWindowOneSpace("right") end)
hotkey.bind(hyper, "H",nil,
      function() moveWindowOneSpace("left") end)
hotkey.bind(hyper, "N", nil,
      function() spaces.createSpace() end)
-- hotkey.bind(hyper, "X", nil,
--       function() removeSpace() end)
