function onThink()
	if (tonumber(os.date("%d")) ~= getGlobalStorageValue(23456)) then
		setGlobalStorageValue(23456, (tonumber(os.date("%d"))))
		db.query("UPDATE `players` SET `onlinetime7`=`onlinetime6`, `onlinetime6`=`onlinetime5`, `onlinetime5`=`onlinetime4`, `onlinetime4`=`onlinetime3`, `onlinetime3`=`onlinetime2`, `onlinetime2`=`onlinetime1`, `onlinetime1`=`onlinetimetoday`, `onlinetimetoday`=0;")
		db.query("UPDATE `players` SET `exphist7`=`exphist6`, `exphist6`=`exphist5`, `exphist5`=`exphist4`, `exphist4`=`exphist3`, `exphist3`=`exphist2`, `exphist2`=`exphist1`, `exphist1`=`experience`-`exphist_lastexp`, `exphist_lastexp`=`experience`;")
	end
	db.query("UPDATE `players` SET `onlinetimetoday` = `onlinetimetoday` + 60, `onlinetimeall` = `onlinetimeall` + 60 WHERE `id` IN (SELECT `player_id` FROM `players_online` WHERE `players_online`.`player_id` = `players`.`id`)")
	return true
end