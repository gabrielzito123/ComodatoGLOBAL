function onLogin(cid)
	if getPlayerGroupId(cid) == 1 and getPlayerStorageValue(cid, 87778) == -1 then
		if isSorcerer(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
	
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 10513, 1)
			doAddContainerItem(bag, 7618, 20)
			doAddContainerItem(bag, 7620, 20)			
		
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 8870, 1)
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2190, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)

		    doPlayerAddBlessing(cid, 1)
		    doPlayerAddBlessing(cid, 2)
		    doPlayerAddBlessing(cid, 3)
		    doPlayerAddBlessing(cid, 4)
		    doPlayerAddBlessing(cid, 5)
			
	if(getPlayerSex(cid) == 0)then
		doPlayerAddOutfit(cid, 140, 3)
	else
		doPlayerAddOutfit(cid, 132, 3)
	end	

			setPlayerStorageValue(cid, 87778, 1)

		elseif isDruid(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 10513, 1)
			doAddContainerItem(bag, 7618, 20)
			doAddContainerItem(bag, 7620, 20)				
		
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 8870, 1)
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2182, 1)
			doPlayerAddItem(cid, 2647, 1)
			doPlayerAddItem(cid, 2643, 1)

		    doPlayerAddBlessing(cid, 1)
		    doPlayerAddBlessing(cid, 2)
		    doPlayerAddBlessing(cid, 3)
		    doPlayerAddBlessing(cid, 4)
		    doPlayerAddBlessing(cid, 5)
			
	if(getPlayerSex(cid) == 0)then
		doPlayerAddOutfit(cid, 140, 3)
	else
		doPlayerAddOutfit(cid, 132, 3)
	end	

			setPlayerStorageValue(cid, 87778, 1)

		elseif isPaladin(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 10513, 1)
			doAddContainerItem(bag, 7618, 15)
			doAddContainerItem(bag, 7620, 10)				
		
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 8872, 1)
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2389, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2647, 1)

		    doPlayerAddBlessing(cid, 1)
		    doPlayerAddBlessing(cid, 2)
		    doPlayerAddBlessing(cid, 3)
		    doPlayerAddBlessing(cid, 4)
		    doPlayerAddBlessing(cid, 5)
			
	if(getPlayerSex(cid) == 0)then
		doPlayerAddOutfit(cid, 140, 3)
	else
		doPlayerAddOutfit(cid, 132, 3)
	end	

			setPlayerStorageValue(cid, 87778, 1)

		elseif isKnight(cid) then
			local bag = doPlayerAddItem(cid, 1988, 1)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 10513, 1)
			doAddContainerItem(bag, 7618, 25)
			doAddContainerItem(bag, 7620, 5)
			doAddContainerItem(bag, 2429, 1)
			doAddContainerItem(bag, 2417, 1)			
		
			doPlayerAddItem(cid, 2457, 1)
			doPlayerAddItem(cid, 2463, 1)
			doPlayerAddItem(cid, 2525, 1)
			doPlayerAddItem(cid, 2383, 1)
			doPlayerAddItem(cid, 2643, 1)
			doPlayerAddItem(cid, 2647, 1)

		    doPlayerAddBlessing(cid, 1)
		    doPlayerAddBlessing(cid, 2)
		    doPlayerAddBlessing(cid, 3)
		    doPlayerAddBlessing(cid, 4)
		    doPlayerAddBlessing(cid, 5)
			
	if(getPlayerSex(cid) == 0)then
		doPlayerAddOutfit(cid, 140, 3)
	else
		doPlayerAddOutfit(cid, 132, 3)
	end	

			setPlayerStorageValue(cid, 87778, 1)
		end
	end
 	return TRUE
end