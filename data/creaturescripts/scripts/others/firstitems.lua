local firstItemssorc =	 {1988, 8819, 8820, 2643, 2175, 2190}
local firstItemsdruid =	 {1988, 8819, 8820, 2643, 2175, 2182}
local firstItemsknight = {1988, 2457, 2463, 2525, 2647, 2394, 2383, 2428}
local firstItemspala = 	 {1988, 2457, 2463, 2525, 2647}
ignoreCap == false

function onLogin(cid)
	local player = Player(cid)
	if player:getLastLoginSaved() <= 0 then
	
		if player:getVocation():getId() == 1 then
		
			for i = 1, #firstItemssorc do
				player:addItem(firstItemssorc[i], 1, ignoreCap)
			end
			
		elseif player:getVocation():getId() == 2 then
			
			for i = 1, #firstItemsdruid do
				player:addItem(firstItemsdruid[i], 1, ignoreCap)
			end
		
		elseif player:getVocation():getId() == 4 then
			
			for i = 1, #firstItemsknight do
				player:addItem(firstItemsknight[i], 1, ignoreCap)
			end
			
		elseif player:getVocation():getId() == 0 then
			
			for i = 1, #firstItemsknight do
				player:addItem(firstItemsknight[i], 1, ignoreCap)
			end
		
		elseif player:getVocation():getId() == 3 then
			
			for i = 1, #firstItemspala do
				player:addItem(firstItemspala[i], 1, ignoreCap)
				player:addItem(2389, 5, ignoreCap)
				
			end		
		
		end
		
		player:addItem(cid, 2674, 5, ignoreCap) -- 5 apples
		player:addItem(cid, 2120, 1, ignoreCap) -- 1 rope
		player:addItem(cid, 2152, 30, ignoreCap)
		player:addItem(cid, 2554, 1, ignoreCap)
		
	end
	return true
end