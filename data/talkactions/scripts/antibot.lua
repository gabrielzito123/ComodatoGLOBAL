domodlib('ban_func') 
function onSay(cid, words, param, channel)
if AB_SYSTEM_get(cid,AB_SYSTEM_CAN_USE_TALKACTION) >= 1 then
	if(param == '') then
		AB_SYSTEM_send_player_white_text(cid, "Invalid param, just say !antibot "..AB_SYSTEM_get(cid,AB_SYSTEM_USER_RANDOM_NUMBER)..".")
		return true
	end
	if param == ''..AB_SYSTEM_get(cid,AB_SYSTEM_USER_RANDOM_NUMBER)..'' then
		AB_SYSTEM_set(cid, AB_SYSTEM_CAN_USE_TALKACTION, 0)
		AB_SYSTEM_set(cid, AB_SYSTEM_USER_RANDOM_NUMBER, 0)
		AB_SYSTEM_set(cid, AB_SYSTEM_TIMES_RESPOND_WRONG, 0)
		AB_SYSTEM_send_player_white_text(cid, "Thank you for the correct answer.")
	else
		local player = getPlayerGUIDByName(cid)
		local account = getAccountIdByName(cid)
		local how = AB_SYSTEM_get(cid,AB_SYSTEM_TIMES_ALREADY_CAUGHT)
		local how2 = AB_SYSTEM_get(cid,AB_SYSTEM_TIMES_RESPOND_WRONG)
		local how3 = how2 + 1
		AB_SYSTEM_set(cid, AB_SYSTEM_TIMES_RESPOND_WRONG, how3)
		local how5 = AB_SYSTEM_get(cid,AB_SYSTEM_TIMES_RESPOND_WRONG)
		AB_SYSTEM_send_player_white_text(cid, "Wrong secure code, your secure code is "..AB_SYSTEM_get(cid,AB_SYSTEM_USER_RANDOM_NUMBER).." that was your "..how3.." time of "..AB_SYSTEM_TIMES_WRONG.." wrong answers.")
		if how5 == 3 then
			AB_SYSTEM_set(cid, AB_SYSTEM_CAN_USE_TALKACTION, 0)
			AB_SYSTEM_set(cid, AB_SYSTEM_USER_RANDOM_NUMBER, 0)
			AB_SYSTEM_set(cid, AB_SYSTEM_TIMES_RESPOND_WRONG, 0)
				if  how <= 0 then
					AB_SYSTEM_set(cid, AB_SYSTEM_TIMES_ALREADY_CAUGHT, 1)
					doTeleportThing(cid, AB_SYSTEM_TELEPORT_TO)
					AB_SYSTEM_send_player_white_text(cid, AB_SYSTEM_TEXT_AFTER_TP)
				elseif how == 1 then
					AB_SYSTEM_set(cid, AB_SYSTEM_TIMES_ALREADY_CAUGHT, 2)
					doTeleportThing(cid, AB_SYSTEM_TELEPORT_TO)
					AB_SYSTEM_send_player_white_text(cid, AB_SYSTEM_TEXT_AFTER_TP)
				elseif how >= 2 then
					doTeleportThing(cid, AB_SYSTEM_TELEPORT_TO)
					AB_SYSTEM_set(cid, AB_SYSTEM_TIMES_ALREADY_CAUGHT, 0)
					doRemoveCreature(cid)
				end
		end
	end
else
AB_SYSTEM_send_player_white_text(cid, "The AntiBot system is not already available for you.")
end
	return true
end