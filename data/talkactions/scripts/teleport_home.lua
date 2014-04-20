function onSay(cid, words, param)

	local statusLog = true
	ComodatoLog (cid, statusLog, words, param)


	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	player:teleportTo(player:getTown():getTemplePosition())
	return false
end
