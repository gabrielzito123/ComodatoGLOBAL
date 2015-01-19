local flowerPosition = Position(32024, 32830, 4)

local function decayFlower()
	local tile = Tile(flowerPosition):getItemById(5659)
	if tile then
		tile:transform(5687)
	end
end

local function bloom()
	if math.random(7) ~= 1 then
		addEvent(bloom, 60 * 60 * 1000)
		return
	end

	local tile = Tile(flowerPosition):getItemById(5687)
	if tile then
		tile:transform(5659)
		flowerPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
	end

	local bloomHours = math.random(2, 6)
	addEvent(decayFlower, bloomHours * 60 * 60 * 1000)
	addEvent(bloom, bloomHours * 60 * 60 * 1000)
end

function onStartup()
	bloom()
	return true
end