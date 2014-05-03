local function doRemoveField(cid, pos)
    pos.stackpos = 254
    local tile = pos:getTile()
    if tile then
        local thing = tile:getFieldItem()
        if thing and isInArray(FIELDS, thing:getId()) then
            thing:remove()
            pos:sendMagicEffect(CONST_ME_POFF)
            return LUA_NO_ERROR
        end
    end

    local player = Player(cid)
    player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    return LUA_ERROR
end

function onCastSpell(creature, var)
    local pos = variantToPosition(var)
    if(pos.x ~= 0 and pos.y ~= 0 and pos.z ~= 0) then
        return doRemoveField(creature:getId(), pos)
    end

    creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
    creature:getPosition():sendMagicEffect(CONST_ME_POFF)
    return LUA_ERROR
end