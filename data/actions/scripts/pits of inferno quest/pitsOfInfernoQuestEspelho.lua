local pos = {
	[39511] = {x = 32739, y = 32392, z = 14},
	[39512] = {x = 32739, y = 32393, z = 14}
}
		local p = Player(cid)


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 39511) then
		doRemoveItem(getTileItemById(pos[item.actionid], 6434).uid, 1)
		doCreateItem(6434, 1, pos[item.actionid+1])


	end
	
	if (item.actionid == 39512) then

		doRemoveItem(getTileItemById(pos[item.actionid], 6434).uid, 1)
		local item = doCreateItem(6434, 1, pos[item.actionid-1])
		doSetItemActionId(item, 39511)
		local trono =  {x = 32712, y = 32392, z = 13}
		local p = Player(cid)
		p:teleportTo(trono)
		p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)


	end
	
	return true
end



