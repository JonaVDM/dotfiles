wifiWatcher = nil
local homeSSID = "Huize Whalesome"
local schoolSSID = "eduroam"
local hotspotSSID = "🍕"
local lastSSID = hs.wifi.currentNetwork()

local title = "Wifi"

local speakers = "MacBook Pro Speakers"
local headphones = "External Headphones"

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        local headphones = hs.audiodevice.findOutputByName(headphones)
        if headphones ~= nil then
            headphones:setVolume(40)
        end
        hs.audiodevice.findOutputByName(speakers):setVolume(70)
        hs.notify.new({title=title, informativeText="Connected to Home WIFI"}):send()

    elseif newSSID == schoolSSID and lastSSID ~= schoolSSID then
        -- We just joined the schools wifi
        local headphones = hs.audiodevice.findOutputByName(headphones)
        if headphones ~= nil then
            headphones:setVolume(0)
        end
        hs.audiodevice.findOutputByName(speakers):setVolume(0)
        hs.notify.new({title=title, informativeText="Connected to School WIFI"}):send()

    elseif newSSID == hotspotSSID and lastSSID ~= hotspotSSID then
        -- We just joined the schools wifi
        local headphones = hs.audiodevice.findOutputByName(headphones)
        if headphones ~= nil then
            headphones:setVolume(40)
        end
        hs.notify.new({title=title, informativeText="Connected to School WIFI"}):send()

    elseif newSSID == nil and lastSSID ~= nil then
        -- We just lost WIFI network
        local headphones = hs.audiodevice.findOutputByName(headphones)
        if headphones ~= nil then
            headphones:setVolume(30)
        end
        hs.audiodevice.findOutputByName(speakers):setVolume(0)
        hs.notify.new({title=title, informativeText="Lost your Wifi"}):send()

    elseif lastSSID ~= newSSID then
        -- We just departed our home WiFi network
        local headphones = hs.audiodevice.findOutputByName(headphones)
        if headphones ~= nil then
            headphones:setVolume(30)
        end
        hs.audiodevice.findOutputByName(speakers):setVolume(0)
        hs.notify.new({title=title, informativeText="Connected to Public WIFI"}):send()
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
