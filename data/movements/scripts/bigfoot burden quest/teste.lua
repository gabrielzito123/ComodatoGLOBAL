

function onStepIn(cid, item, position, lastPosition)


		local p = Player(cid)


		local poss = {x = 33007, y = 31921, z = 10}
		if position.x == 33003 then
			p:teleportTo(poss)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		

		end
return true
end

