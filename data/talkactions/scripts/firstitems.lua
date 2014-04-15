local firstItemssorc =	 {2050, 2382}
local firstItemsdruid =	 {2050, 2382}
local firstItemsknight = {2050, 2382}
local firstItemspala = 	 {2050, 2382}

function onSay(cid, words, param)
	local player = Player(cid)
	if player:getLastLoginSaved() <= 0 then
		if player:getVocation():getId() == 1 then
		
			for i = 1, #firstItemssorc do
				player:addItem(firstItemssorc[i], 1)
			end
			
		elseif player:getVocation():getId() == 2 then
			
			for i = 1, #firstItemsdruid do
				player:addItem(firstItemsdruid[i], 1)
			end
			
		elseif player:getVocation():getId() == 3 then
			
			for i = 1, #firstItemsknight do
				player:addItem(firstItemsknight[i], 1)
			end
			
		else player:getVocation():getId() == 4 then
			
			for i = 1, #firstItemspala do
				player:addItem(firstItemspala[i], 1)
			end		
		
		
		end
	end
	return true
end