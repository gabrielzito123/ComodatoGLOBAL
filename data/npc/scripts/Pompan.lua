local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local itemsList = {
	{name="arrow", id=2544, buy=3},
	{name="backpack", id=1988, buy=20},
	{name="bag", id=1987, buy=5},
	{name="basket", id=1989, buy=6},
	{name="bolt", id=2543, buy=4},
	{name="bow", id=2456, buy=400, sell=100},
	{name="bucket", id=2005, buy=4},
	{name="candlestick", id=2047, buy=2},
	{name="crossbow", id=2455, buy=500, sell=120},
	{name="crowbar", id=2416, buy=260, sell=50},
	{name="earth arrow", id=7850, buy=5},
	{name="expedition backpack", id=11241, buy=100},
	{name="expedition bag", id=11242, buy=50},
	{name="fishing rod", id=2580, buy=150, sell=40},
	{name="flaming arrow", id=7840, buy=5},
	{name="flash arrow", id=7838, buy=5},
	{name="inkwell", id=2600, sell=8},
	{name="lamp", id=2044, buy=8},
	{name="mirror", id=2560, sell=10},
	{name="onyx arrow", id=7365, buy=7},
	{name="pick", id=2553, buy=50, sell=15},
	{name="piercing bolt", id=7363, buy=5},
	{name="power bolt", id=2547, buy=7},
	{name="rope", id=2120, buy=50, sell=15},
	{name="royal spear", id=7378, buy=15},
	{name="scythe", id=2550, buy=50, sell=10},
	{name="shiver arrow", id=7839, buy=5},
	{name="shovel", id=2554, buy=50, sell=8},
	{name="sickle", id=2405, sell=3},
	{name="sniper arrow", id=7364, buy=5},
	{name="spear", id=2389, buy=10, sell=3},
	{name="throwing star", id=2399, buy=42},
	{name="torch", id=2050, buy=2},
	{name="closed trap", id=2578, buy=280, sell=75},
	{name="watch", id=2036, buy=20, sell=6},
	{name="worm", id=3976, buy=1}
}

local function setNewTradeTable(table)
	local items = {}
	for _, v in ipairs(table) do
		items[v.id] = {itemId = v.id, buyPrice = v.buy, sellPrice = v.sell, subType = 0, realName = v.name}
	end
	return items
end
		

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local player = Player(cid)
	
	if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and (not npcHandler:isFocused(cid)) then
		npcHandler:say("Hello.", cid, TRUE)
		npcHandler:addFocus(cid)
	elseif(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("It was a pleasure to help you, "..getCreatureName(cid)..".", cid, TRUE)
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "trade") then
		if player:getStorageValue(85300) >= 1 then
			table.insert(itemsList, {name="dragon tapestry", id=11258, buy=80})
		end
		if player:getStorageValue(85300) >= 2 then
			table.insert(itemsList, {name="minotaur backpack", id=11238, buy=200})
			table.insert(itemsList, {name="corrupted flag", id=11320, sell=700})
			table.insert(itemsList, {name="high guard flag", id=11326, sell=550})
			table.insert(itemsList, {name="legionnaire flags", id=11328, sell=500})
			table.insert(itemsList, {name="zaogun flag", id=11324, sell=600})
		end
		if player:getStorageValue(85300) >= 5 then
			table.insert(items, {name="dragon backpack", id=11237, buy=200})
		end
		local player = Player(cid)
		
		local items = setNewTradeTable(itemsList)
		
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
		openShopWindow(cid, itemsList, onBuy, onSell)
		
		npcHandler:say("Keep in mind you won't find better offers here. Just browse through my wares.", cid)
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)