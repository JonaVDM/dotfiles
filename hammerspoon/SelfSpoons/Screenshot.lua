-- Make selection screenshot
hs.hotkey.bind({}, 'F13', function()
  hs.task.new('/usr/sbin/screencapture', nil, {'-s', '-c'}):start()
end)

-- Make window screenshot
hs.hotkey.bind({'cmd', 'shift'}, 'F13', function()
  hs.task.new('/usr/sbin/screencapture', nil, {'-w', '-c'}):start()
end)

-- Make window screenshot without that weird shadow
hs.hotkey.bind({'cmd'}, 'F13', function()
  hs.task.new('/usr/sbin/screencapture', nil, {'-w', '-c', '-o'}):start()
end)

-- Make full screen screenshot
hs.hotkey.bind({'shift'}, 'F13', function()
  hs.task.new('/usr/sbin/screencapture', nil, {'-c', '-C'}):start()
end)
