local firstItemssorc =	 {1988, 8819, 8820, 2643, 2175, 2190}
local firstItemsdruid =	 {1988, 8819, 8820, 2643, 2175, 2182}
local firstItemsknight = {1988, 2457, 2463, 2525, 2647, 2394, 2383, 2428}
local firstItemspala = 	 {1988, 2457, 2463, 2525, 2647}

function onSay(cid, words, param)
	local player = Player(cid)
	if player:getLastLoginSaved() <= 0 or player:getAccountType() == ACCOUNT_TYPE_GOD then
		if player:getVocation():getId() == 1 then
		
			for i = 1, #firstItemssorc do
				player:addItem(firstItemssorc[i], 1)
			end
			
		elseif player:getVocation():getId() == 2 then
			
			for i = 1, #firstItemsdruid do
				player:addItem(firstItemsdruid[i], 1)
			end
		
		elseif player:getVocation():getId() == 4 then
			
			for i = 1, #firstItemsknight do
				player:addItem(firstItemsknight[i], 1)
			end
			
		elseif player:getVocation():getId() == 0 then
			
			for i = 1, #firstItemsknight do
				player:addItem(firstItemsknight[i], 1)
			end
		
		elseif player:getVocation():getId() == 3 then
			
			for i = 1, #firstItemspala do
				player:addItem(firstItemspala[i], 1)
				player:addItem(2389, 10)
			end		
		
		
		end
	end
	return true
end