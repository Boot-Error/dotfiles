hs.application.enableSpotlightForNameSearches(true)

hyper = {"cmd", "ctrl", "alt", "shift"}

function openApplication(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
hs.hotkey.bind({"alt"}, "E", openApplication("Finder"))
hs.hotkey.bind({"alt"}, "F", openApplication("Brave Browser"))
hs.hotkey.bind({"alt"}, "T", openApplication("iTerm"))
hs.hotkey.bind({"alt"}, "K", openApplication("KeepassXC"))
hs.hotkey.bind({"alt"}, "S", openApplication("Spotify"))

-- Window Management

-- Move and resize focus window to left half of the screen
-- When placed at the left half, toggle between half and 2/3 of the screen.
hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local midLoc = max.x + (max.w / 2)
  
  if f.x >= midLoc then
    f.x = max.x + (max.w / 3)
    f.w = max.w * 2 / 3
  else
    f.x = max.x + (max.w / 2)
    f.w = max.w / 2
  end

  f.y = max.y
  f.h = max.h
  win:setFrame(f)
end)

-- Move and resize focus window to left half of the screen
-- When placed at the left half, toggle between half and 2/3 of the screen.
hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
 
  local midLoc = max.x + (max.w / 2)
  
  f.x = max.x
  if f.x + f.w <= midLoc then
    f.w = max.w * 2 / 3
  else
    f.w = max.w / 2
  end

  f.y = max.y
  f.h = max.h
  win:setFrame(f)
end)

function pingResult(object, message, seqnum, error)
    if message == "didFinish" then
        avg = tonumber(string.match(object:summary(), '/(%d+.%d+)/'))
        if avg == 0.0 then
            hs.alert.show("No network")
        elseif avg < 200.0 then
            hs.alert.show("Network good (" .. avg .. "ms)")
        elseif avg < 500.0 then
            hs.alert.show("Network poor(" .. avg .. "ms)")
        else
            hs.alert.show("Network bad(" .. avg .. "ms)")
        end
    end
end

--- Hyper + p to check Network Ping
hs.hotkey.bind(hyper, "p", function()
  hs.network.ping.ping("8.8.8.8", 1, 0.01, 1.0, "any", pingResult)
end)


