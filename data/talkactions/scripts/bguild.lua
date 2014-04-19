function onSay(cid, words, param, channel)
    if getPlayerGuildId(cid) > 0 then
        if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE then
            for _, pid in ipairs(getPlayersOnline()) do
                local message = "*Guild* " .. getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]: " .. param .. ""
                if getPlayerGuildId(pid) == getPlayerGuildId(cid) then
                    doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_ORANGE, message)
                end
            end
        else
            doPlayerSendCancel(cid, "You may not broadcast to your guild.")
        end
    else
        doPlayerSendCancel(cid, "You are not in a guild.")
    end
    return true
end