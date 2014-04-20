function onSay(cid, words, param)


	local statusLog = true
	ComodatoLog (cid, statusLog, words, param)


	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	
	if param == "shutdown" then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	else
		Game.setGameState(GAME_STATE_CLOSED)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Server is now closed.")
	end
	return false
end
