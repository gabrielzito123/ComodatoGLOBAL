local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function getTable(player)
local itemsList = {
		{name="Banana", id=2676, buy=2},
		}
local statues = {	
		{{name="Monkey Statue (No Seeing)", id=5086, buy=65},
		{name="Monkey Statue (No Hearing)", id=5087, buy=65},
		{name="Monkey Statue (No Speaking)", id=5088, buy=65}}
		}

if player:getStorageValue(12120) >= 18 then
	for i = 1, #statues[1] do
		table.insert(itemsList, statues[1][i])
	end
end
return itemsList
end

function greetCallback(cid)
	local player = Player(cid)
	if(player:getStorageValue(12120) <= 14) then
		npcHandler:setMessage(MESSAGE_GREET, "Oh! Hello! Hello! Did not notice!")
	elseif(player:getStorageValue(12120) >= 15) then
		npcHandler:setMessage(MESSAGE_GREET, "Be greeted, friend of the ape people. If you want to trade, just ask for my offers. If you are injured, ask for healing.")
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(12120) < 1 then
			npcHandler:say("These are dire times for our people. Problems plenty are in this times. But me people not grant trust easy. Are you willing to prove you friend of ape people?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(12120) == 1 then
			npcHandler:say("Oh, you brought me whisper moss? Good hairless ape you are! Can me take it?", cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(12120) == 2 then
			npcHandler:say({"Whisper moss strong is, but me need liquid that humans have to make it work ...",
							"Our raiders brought it from human settlement, it's called cough syrup. Go ask healer there for it."}, cid, 0, 1, 3000)
			player:setStorageValue(12120, 3)
			player:setStorageValue(12122, 1) -- The Ape City Questlog - Mission 2: The Cure
		elseif player:getStorageValue(12120) >= 3 and player:getStorageValue(12120) <= 6 then
			npcHandler:say("You brought me that cough syrup from human healer me asked for?", cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(12120) == 7 then
			npcHandler:say("Little ape should be healthy soon. Me so happy is. Thank you again! But me suspect we in more trouble than we thought. Will you help us again?", cid)
			npcHandler.topic[cid] = 5
		elseif player:getStorageValue(12120) == 8 then
			npcHandler:say("You got scroll from lizard village in south east?", cid)
			npcHandler.topic[cid] = 7
		elseif player:getStorageValue(12120) == 9 then
			npcHandler:say({"Ah yes that scroll. Sadly me not could read it yet. But the holy banana me insight gave! In dreams Hairycles saw where to find solution ...",
							"Me saw a stone with lizard signs and other signs at once. If you read signs and tell Hairycles, me will know how to read signs ...",
							"You go east to big desert. In desert there city. East of city under sand hidden tomb is. You will have to dig until you find it, so take shovel ...",
							"Go down in tomb until come to big level and then go down another. There you find a stone with signs between two huge red stones ...",
							"Read it and return to me. Are you up to that challenge?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 8
		elseif player:getStorageValue(12120) == 10 then
			npcHandler:say("Ah yes, you read the signs in tomb? Good! May me look into your mind to see what you saw?", cid)
			npcHandler.topic[cid] = 9
		elseif player:getStorageValue(12120) == 11 then
			npcHandler:say({"So much there is to do for Hairycles to prepare charm that will protect all ape people ...",
							"You can help more. To create charm of life me need mighty token of life! Best is egg of a regenerating beast as a hydra is ...",
							"Bring me egg of hydra please. You may fight it in lair of Hydra at little lake south east of our lovely city Banuta! You think you can do?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 10
		elseif player:getStorageValue(12120) == 12 then
			npcHandler:say("You bring Hairycles egg of hydra?", cid)
			npcHandler.topic[cid] = 11
		elseif player:getStorageValue(12120) == 13 then
			npcHandler:say({"Last ingredient for charm of life is thing to lure magic. Only thing me know like that is mushroom called witches cap. Me was told it be found in isle called Fibula, where humans live ...",
							"Hidden under Fibula is a secret dungeon. There you will find witches cap. Are you willing to go there for good ape people?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 12
		elseif player:getStorageValue(12120) == 14 then
			npcHandler:say("You brought Hairycles witches cap from Fibula?", cid)
			npcHandler.topic[cid] = 13
		elseif player:getStorageValue(12120) == 15 then
			npcHandler:say({"Mighty life charm is protecting us now! But my people are still in danger. Danger from within ...",
							"Some of my people try to mimic lizards to become strong. Like lizards did before, this cult drinks strange fluid that lizardsleft when fled ...",
							"Under the city still the underground temple of lizards is. There you find casks with red fluid. Take crowbar and destroy three of them to stop this madness. Are you willing to do that?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 14
		elseif player:getStorageValue(12120) == 16 then
			npcHandler:say("Your mission is to take crowbar and destroy three of them casks to stop this madness.", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(12120) == 17 then
			npcHandler:say("Quest Work in process", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(12120) == 18 then
			npcHandler:say("Quest Work in process", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
			npcHandler:say("To become friend of ape people a long and difficult way is. We do not trust easy but help is needed. Will you listen to story of Hairycles?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then	
			npcHandler:say({"So listen, little ape was struck by plague. Hairycles not does know what plague it is. That is strange. Hairycles should know. But Hairycles learnt lots and lots ...",
							"Me sure to make cure so strong to drive away all plague. But to create great cure me need powerful components ...",
							"Me need whisper moss. Whisper moss growing south of human settlement is. Problem is, evil little dworcs harvest all whisper moss immediately ...",
							"Me know they hoard some in their underground lair. My people raided dworcs often before humans came. So we know the moss is hidden in east of upper level of dworc lair ...",
							"You go there and take good moss from evil dworcs. Talk with me about mission when having moss."}, cid, 0, 1, 4000)
			player:setStorageValue(12120, 1)
			player:setStorageValue(12121, 1) -- The Ape City Questlog - Mission 1: Whisper Moss
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(4838) >= 1 then
				player:removeItem(4838, 1)
				npcHandler:say("Ah yes! That's it. Thank you for bringing mighty whisper moss to Hairycles. It will help but still much is to be done. Just ask for other {mission} if you ready.", cid)
				player:setStorageValue(12120, 2)
				player:setStorageValue(12121, 3) -- The Ape City Questlog - Mission 1: Whisper Moss
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount(4839) >= 1 then
				player:removeItem(4839, 1)
				npcHandler:say("You so good! Brought syrup to me! Thank you, will prepare cure now. Just ask for {mission} if you want help again.", cid)
				player:setStorageValue(12120, 7)
				player:setStorageValue(12122, 5) -- The Ape City Questlog - Mission 2: The Cure
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 5 then	
			npcHandler:say({"So listen, please. Plague was not ordinary plague. That's why Hairycles could not heal at first. It is new curse of evil lizard people ...",
							"I think curse on little one was only a try. We have to be prepared for big strike ...",
							"Me need papers of lizard magician! For sure you find it in his hut in their dwelling. It's south east of jungle. Go look there please! Are you willing to go?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 6
		elseif npcHandler.topic[cid] == 6 then	
			npcHandler:say("Good thing that is! Report about your mission when have scroll.", cid)
			player:setStorageValue(12120, 8)
			player:setStorageValue(12123, 1) -- The Ape City Questlog - Mission 3: Lizard Parchment
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			if player:getItemCount(5956) >= 1 then
				player:removeItem(5956, 1)
				npcHandler:say("You brought scroll with lizard text? Good! I will see what text tells me! Come back when ready for other {mission}.", cid)
				player:setStorageValue(12120, 9)
				player:setStorageValue(12123, 3) -- The Ape City Questlog - Mission 3: Lizard Parchment
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 8 then	
			npcHandler:say("Good thing that is! Report about mission when you have read those signs.", cid)
			player:setStorageValue(12120, 10)
			player:setStorageValue(12124, 1) -- The Ape City Questlog - Mission 4: Parchment Decyphering
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 9 then
			if player:getStorageValue(12124) == 2 then
				npcHandler:say("Oh, so clear is all now! Easy it will be to read the signs now! Soon we will know what to do! Thank you again! Ask for {mission} if you feel ready.", cid)
				player:setStorageValue(12120, 11)
				player:setStorageValue(12124, 3) -- The Ape City Questlog - Mission 4: Parchment Decyphering
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 10 then	
			npcHandler:say("You brave hairless ape! Get me hydra egg. If you lose egg, you probably have to fight many, many hydras to get another.", cid)
			player:setStorageValue(12120, 12)
			player:setStorageValue(12125, 1) -- The Ape City Questlog - Mission 5: Hydra Egg
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 then
			if player:getItemCount(4850) >= 1 then
				player:removeItem(4850, 1)
				npcHandler:say("Ah, the egg! Mighty warrior you be! Thank you. Hairycles will put it at safe place immediately.", cid)
				player:setStorageValue(12120, 13)
				player:setStorageValue(12125, 3) -- The Ape City Questlog - Mission 5: Hydra Egg
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 12 then	
			npcHandler:say("Long journey it will take, good luck to you.", cid)
			player:setStorageValue(12120, 14)
			player:setStorageValue(12126, 1) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 13 then
			if player:getItemCount(4840) >= 1 then
				player:removeItem(4840, 1)
				npcHandler:say("Incredible, you brought a witches cap! Now me can prepare mighty charm of life. Yet still other missions will await you,friend.", cid)
				player:setStorageValue(12120, 15)
				player:setStorageValue(12126, 3) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 14 then	
			npcHandler:say("Hairycles sure you will make it. Good luck, friend.", cid)
			player:setStorageValue(12120, 16)
			player:setStorageValue(12127, 1) -- The Ape City Questlog - Mission 7: Destroying Casks With Crowbar
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "trade") then
		if player:getStorageValue(12120) >= 15 then
			local player = Player(cid)
			local items = setNewTradeTable(getTable(player))
			local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
				if (ignoreCap == false and (player:getFreeCapacity() < getItemWeight(items[item].itemId, amount) or inBackpacks and player:getFreeCapacity() < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1)))) then
					return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
				end
				if items[item].buyPrice <= player:getMoney() then
					if inBackpacks then
						local container = Game.createItem(1988, 1)
						local bp = player:addItemEx(container)
						if(bp ~= 1) then
							return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough container.')	
						end
						for i = 1, amount do
							container:addItem(items[item].itemId, items[item])
						end
					else
						return 
						player:addItem(items[item].itemId, amount, false, items[item]) and
						player:removeMoney(amount * items[item].buyPrice) and
						player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
					end
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
					player:removeMoney(amount * items[item].buyPrice)
				else
					player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You do not have enough money.')
				end
				return true
			end
				
			local function onSell(cid, item, subType, amount, ignoreEquipped)
				if items[item].sellPrice then
					return
					player:removeItem(items[item].itemId, amount, -1, ignoreEquipped) and
					player:addMoney(items[item].sellPrice * amount) and
			
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
				end
				return true
			end
				openShopWindow(cid, getTable(player), onBuy, onSell)
				
				npcHandler:say("Keep in mind you won't find better offers here. Just browse through my wares.", cid)
			end
		else
			npcHandler:say("I only trade with friends of ape...", cid)
		end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())