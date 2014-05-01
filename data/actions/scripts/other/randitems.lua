local config = {
-- pirate surprise
[16094] = { 
{ rate = 2386, item = 2670, count = { const = 4 }}, --shrimps
{ rate = 1705, item = 2385, count = { const = 1 }}, --sabre
{ rate = 1591, item = 5928, count = { const = 1 }}, --empty oldfish bowl
{ rate = 1250, item = 11219, count = { const = 1 }}, --compass
{ rate = 1136, item = 2238, count = { const = 1 }}, --worm lather boots
{ rate = 1023, item = 6097, count = { const = 1 }}, --hook
{ rate = 341, item = 6095, count = { const = 1 }}, --pirate shirt
{ rate = 114, item = 14337, count = { const = 1 }}, --treasure map (pirate)
{ rate = 114, item = 5462, count = { const = 1 }}, --pirate boots
{ rate = 114, item = 5926, count = { const = 1 }} -- pirate backpack
},
-- suspicious surprise bag
[7587] = { 
{ rate = 1429, item = 8072, count = { const = 10 }}, --yellow pillow supersoft
{ rate = 857, item = 6574, count = { const = 10 }}, --bar of chocolate
{ rate = 571, item = 6394, count = { const = 10 }}, --cream cake
{ rate = 571, item = 7377, count = { const = 10 }}, --ice cream cone
{ rate = 286, item = 2114, count = { const = 10 }}, --piggy bank
{ rate = 286, item = 6574, count = { const = 1 }} --explosive present
},
-- gooey mass
[15572] = { 
{ rate = 2166, item = 2152, count = { const = 2 }}, --Platinum Coins
{ rate = 2059, item = 15487, count = { const = 1 }}, --larvas
{ rate = 2038, item = 2144, count = { const = 1 }}, -- black pearl
{ rate = 1911, item = 7591, count = { const = 1 }}, -- grat health potion
{ rate = 1656, item = 7590, count = { const = 1 }}, -- great mana potion
{ rate = 85, item = 9971, count = { const = 1 }}, -- gold ingot
{ rate = 85, item = 15546, count = { const = 1 }} -- four leaf clover
},
--gnomish supply package
[18215] = { 
{ rate = 1132, item = 18304, count = { const = 15 }}, --crystalline arrow
{ rate = 1132, item = 2787, count = { const = 20 }}, -- white mushrooms
{ rate = 991, item = 18397, count = { const = 1 }}, -- mushroom pie
{ rate = 943, item = 18437, count = { const = 15 }}, --envenenomed arrow
{ rate = 991, item = 7588, count = { const = 2 }}, --strong health potion
{ rate = 991, item = 7618, count = { const = 4 }}, --health potion
{ rate = 802, item = 7589, count = { const = 2 }}, --strong mana potion
{ rate = 802, item = 7590, count = { const = 1 }}, -- great mana potion
{ rate = 849, item = 18457, count = { const = 1 }}, --teleport crystal
{ rate = 755, item = 7443, count = { const = 1 }}, --bullseye potion
{ rate = 613, item = 7620, count = { const = 4 }}, --mana potion
{ rate = 802, item = 2152, count = { const = 5 }}, --platinum coin
{ rate = 802, item = 7591, count = { const = 1 }}, --great mana potion
{ rate = 849, item = 5911, count = { const = 1 }}, --red piece of cloth
{ rate = 755, item = 7439, count = { const = 1 }}, --berserk potion
{ rate = 991, item = 7440, count = { const = 1 }}, --mastermind potion
{ rate = 802, item = 18455, count = { const = 1 }}, --pet pig
{ rate = 802, item = 18519, count = { const = 1 }}, --gnomish voucher type MA2
{ rate = 849, item = 18522, count = { const = 1 }}, --gnomish voucher type CA2
{ rate = 755, item = 2160, count = { const = 1 }}, -- crystal coin
{ rate = 613, item = 2156, count = { const = 1 }}, --red gem
{ rate = 802, item = 18509, count = { const = 1 }}, --red teleport crystal
{ rate = 802, item = 2154, count = { const = 1 }}, --yellow gem
{ rate = 849, item = 2158, count = { const = 1 }}, --blue gem
{ rate = 755, item = 2155, count = { const = 1 }} -- green gem
},
}
local sumOfRate = {}
for k,v in pairs(config) do
sumOfRate[k] = 0
for k2,v2 in pairs(v) do
    sumOfRate[k] = sumOfRate[k] + v2.rate
end
end
function randomGift(itemid)
local rand = math.random(1, sumOfRate[itemid])
local subSum = 0
local exactItem = nil
for i,v in ipairs(config[itemid]) do
    if (subSum > rand) then
        if (i > 1) then
            exactItem = i-1
        end
        break
    end

    subSum = subSum + v.rate
    if (subSum >= rand) then
        exactItem = i
        break
    end
end

return exactItem
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
local run = false

for k,v in pairs(config) do
    if (k == item.itemid) then
        run = true
        break
    end
end

if (not run) then
    return false
end

local gift = randomGift(item.itemid)

if (config[item.itemid][gift].count.const ~= nil) then
    doPlayerAddItem(cid, config[item.itemid][gift].item, config[item.itemid][gift].count.const)
else
    doPlayerAddItem(cid, config[item.itemid][gift].item, math.random(config[item.itemid][gift].count.min, config[item.itemid][gift].count.max))
end

doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
doRemoveItem(item.uid, 1)

return true
end
