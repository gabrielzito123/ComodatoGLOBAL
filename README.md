FORGOTTENSERVER-ORTS
====================
Client Version: 10.37
Try to make the perfect open real tibia server based on forgottenserver by Mark Samman!
Here you can find the sources and also some compile tutorials: https://github.com/otland/forgottenserver

You can download TFS 1.0 Windows Binaries from: http://nightlies.otland.net

To login you can use otclient by Edubart!
https://github.com/edubart/otclient

Also you can use the forum to discuss and report:
http://otland.net/threads/best-released-real-map-10-31-based-1-0.204514/

**If you want to contribute by sending pull request, here is some tips.
Try to use metatables in your script. Ex.**
```
function metaExample(cid)
	local player = Player(cid)
	if player ~= nil then
		player:addItem(2160, 5)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Here is some cash.")
	end
end
```
**How non meta looks like:**
```
function nonMetaExample(cid)
	if isPlayer(cid) then
		doPlayerAddItem(cid, 2160, 5)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Here is some cash.")
	end
end
```
**LUA METATABLE LISTS:**

http://pastebin.com/UPKLCSsi

**NOTE:**
Due to that the link above dosen't have all the functions in it, I will link to a compat.lua file(can be found in your ot aswell, dir/data/compat.lua), use ctrl+f and enter the old function then press enter. 

https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/blob/master/data/compat.lua
