function onSay(cid, words, param)
			local t = param:split(" ")
			file = io.open('logs/"..getPlayerName(cid)..".txt','a+')
			notice = file:write("\n"..getPlayerName(cid).." at " .. os.date("%d %B %Y - %X ", os.time()) .."\n"..t[1].."\n")
			file:close()
			return false
end
