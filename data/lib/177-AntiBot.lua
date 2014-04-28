AB_SYSTEM_CHECK_WHEN = 60 -- seconds, after kill monster --done
AB_SYSTEM_CHECK_LVL = 100 -- lvl player to check --done
AB_SYSTEM_TIME_AFTER_TP = 300 --(If player does not respond correctly after 1.5 minutes)
AB_SYSTEM_TIMES_WRONG = 3 --(If player does not respond correctly after 3 times)
AB_SYSTEM_TELEPORT_TO = {x = 32369, y = 32241, z = 7}
AB_SYSTEM_BAN_LENGHT = 12 --hours time before 3 time
AB_SYSTEM_TEXT_AFTER_TP = "You have beed moved to the place of botters and you received warning keep playing but stop botting!"
AB_SYSTEM_BASE = 77000 -- this storage must be free, from 77000 to 77006 --done
AB_SYSTEM_KILLSTORAGE = AB_SYSTEM_BASE + 1 --done
AB_SYSTEM_TIMES_RESPOND_WRONG = AB_SYSTEM_BASE + 2
AB_SYSTEM_TIMES_ALREADY_CAUGHT = AB_SYSTEM_BASE + 3
AB_SYSTEM_IGNOREUSERS = AB_SYSTEM_BASE + 4 --done
AB_SYSTEM_CAN_USE_TALKACTION = AB_SYSTEM_BASE + 5 --done
AB_SYSTEM_USER_RANDOM_NUMBER = AB_SYSTEM_BASE + 6 --done
 
function AB_SYSTEM_get(cid, a_storage)
	return getPlayerStorageValue(cid, a_storage)
end
 
function AB_SYSTEM_set(cid, b_storage, b_value)
	setPlayerStorageValue(cid, b_storage, b_value)
end
 
function AB_SYSTEM_send_player_white_text(cid, text)
	doPlayerSendTextMessage(cid, 18, text)
end
 
function AB_SYSTEM_send_player_red_text(cid, text)
	doPlayerSendTextMessage(cid, 22, text)
end
 
function isOnline(player)
	local rows = db.getResult("SELECT `online` FROM `players` WHERE `id` = " .. player .. ";")
	local on = rows:getDataInt("online")
		if on ~= 0 then
			return TRUE
		else
			return FALSE
		end
end
 
function isSummon(cid)
	return getCreatureMaster(cid) ~= nil
end