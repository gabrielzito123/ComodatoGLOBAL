local config = {
	bridgePositions = {
		{position = Position(32099, 32205, 8), groundId = 9022, itemId = 4645},
		{position = Position(32100, 32205, 8), groundId = 4616},
		{position = Position(32101, 32205, 8), groundId = 9022, itemId = 4647}
	},
	leverPositions = {
		Position(32098, 32204, 8),
		Position(32104, 32204, 8)
	},
	relocatePosition = Position(32102, 32205, 8),
	bridgeId = 5770
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local leverLeft = item.itemid == 1945
	for _, position in pairs(config.leverPositions) do
		Tile(position):getItemById(leverLeft and 1945 or 1946):transform(leverLeft and 1946 or 1945)
	end

	local tile, tmpItem
	if leverLeft then
		for _, bridge in pairs(config.bridgePositions) do
			tile = Tile(bridge.position)

			tmpItem = tile:getGround()
			if tmpItem then
				tmpItem:transform(config.bridgeId)
			end

			if bridge.itemId then
				tmpItem = tile:getItemById(bridge.itemId)
				if tmpItem then
					tmpItem:remove()
				end
			end
		end
	else
		for _, bridge in pairs(config.bridgePositions) do
			tile = Tile(bridge.position)

			tile:relocateTo(config.relocatePosition, true)
			tile:getGround():transform(bridge.groundId)
			Game.createItem(bridge.itemId, 1, bridge.position)
		end

	end
	return true
end
