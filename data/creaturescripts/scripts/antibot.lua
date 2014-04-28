function onKill(cid, target, lastHit)
		if isPlayer(target) or isSummon(target) then return true end	
			AB_SYSTEM_set(cid, AB_SYSTEM_KILLSTORAGE, os.time())
	return true
end