function onSay(cid, words, param)

			file = io.open('data/logs/'..getPlayerName(cid)..' talkactions.log','a+')
			notice = file:write("\n"..getPlayerName(cid).." at " .. os.date("%d %B %Y - %X ", os.time()) .."\n" .. words .. " "..param.."\n")
			file:close()
			return false
end
