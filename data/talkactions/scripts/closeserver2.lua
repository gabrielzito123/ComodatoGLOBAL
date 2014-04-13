function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	
	if param == "shutdown" then
		local function serverSave()
		Game.setGameState(GAME_STATE_SHUTDOWN)
		
		local function secondServerSaveWarning()
		broadcastMessage("Server is saving game in one minute. Please logout.", MESSAGE_STATUS_WARNING)
		addEvent(serverSave, 60000)
		end

		local function firstServerSaveWarning()
		broadcastMessage("Server is saving game in 3 minutes. Please logout.", MESSAGE_STATUS_WARNING)
		addEvent(secondServerSaveWarning, 120000)
		end

		function onTime(interval)
		broadcastMessage("Server is saving game in 5 minutes. Please logout.", MESSAGE_STATUS_WARNING)
		Game.setGameState(GAME_STATE_STARTUP)
		addEvent(firstServerSaveWarning, 120000)
		return not shutdownAtServerSave
		end		
		
		
		
	else
		Game.setGameState(GAME_STATE_CLOSED)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Server is now closed.")
	end
	return false
end
