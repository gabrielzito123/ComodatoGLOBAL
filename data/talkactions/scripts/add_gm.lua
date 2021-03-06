function onSay(cid, words, param)

	local statusLog = true
	ComodatoLog (cid, statusLog, words, param)


	local player = Player(cid)
	if player:getAccountType() <= ACCOUNT_TYPE_GAMEMASTER then
		return true
	end

	local target = Player(param)
	if target == nil then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	if target:getAccountType() ~= ACCOUNT_TYPE_NORMAL then
		player:sendCancelMessage("You can only promote a normal player to a GAME MASTER.")
		return false
	end

	target:setAccountType(ACCOUNT_TYPE_GAMEMASTER)
	target:setGroup(Group(ACCOUNT_TYPE_GAMEMASTER))
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been promoted to a GAME MASTER by " .. player:getName() .. ".")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have promoted " .. target:getName() .. " to a GAME MASTER.")
	return false
end
