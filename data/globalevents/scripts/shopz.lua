-- Znote Shop v1.0 for Znote AAC on TFS 0.2.13+ Mystic Spirit.

function onThink(interval, lastExecution)



	local storage = 54073 -- Make sure to select non-used storage. This is used to prevent SQL load attacks.
	local cooldown = 15 -- in seconds.
	
		-- Create the query
		local orderQuery = db.storeQuery("SELECT `id`, `account_id`, `type`, `itemid`, `count` FROM `znote_shop_orders`")
		
		-- Detect if we got any results
		if orderQuery ~= false then
		
        repeat
		
			-- Fetch order values
			local q_id = result.getDataInt(orderQuery, "id")
			local q_id = result.getDataInt(orderQuery, "account_id")
			local q_type = result.getDataInt(orderQuery, "type")
			local q_itemid = result.getDataInt(orderQuery, "itemid")
			local q_count = result.getDataInt(orderQuery, "count")
			result.free(orderQuery)
			
			-- ORDER TYPE 1 (Regular item shop products)
			if q_type == 1 then
				-- Get wheight
				local playerCap = getPlayerFreeCap(cid)
				local itemweight = getItemWeight(q_itemid, q_count)
					if playerCap >= itemweight then
						db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
						doPlayerAddItem(cid, q_itemid, q_count)
						doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratulations! You have recieved ".. q_count .." "..getItemName(q_itemid).."(s)!")
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Need more CAP!")
					end
			end
			-- Add custom order types here
			-- Type 2 is reserved for premium days and is handled on website, not needed here.
			-- Type 3 is reserved for character gender(sex) change and is handled on website as well.
			-- So use type 4+ for custom stuff, like etc packages.
			-- if q_type == 4 then
			-- end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "You have no orders.")
		end
		
	return false
end