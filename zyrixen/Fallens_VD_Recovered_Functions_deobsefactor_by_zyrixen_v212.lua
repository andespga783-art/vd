-- deobsefactor by zyrixen
-- FALLENS VD | Luraph v15.1 | incremental executable function recovery v212
-- NOT a full hub: modules require the captured game environment. No VM launcher restored.

local Fallens = {}

-- proto_t2903: SelectedKiller name from primary then secondary object.
function Fallens.getSelectedKiller(primary, secondary, getGameValue)
    if not primary then
        return nil
    end
    local selected = getGameValue(primary, "SelectedKiller")
    if type(selected) == "string" and selected ~= "" then
        return selected
    end
    if secondary then
        local backup = getGameValue(secondary, "SelectedKiller")
        if type(backup) == "string" and backup ~= "" then
            return backup
        end
    end
    return nil
end

-- proto_217: Reconcile the player's breakspeed attribute with Killer settings.
function Fallens.syncBreakSpeed(player, state)
    local character = player.Character
    if not character then
        return
    end
    if state.Killer.BreakSpeedEnabled then
        local speed = state.Killer.BreakSpeed
        if character:GetAttribute("breakspeed") ~= speed then
            character:SetAttribute("breakspeed", speed)
        end
    elseif character:GetAttribute("breakspeed") ~= nil then
        character:SetAttribute("breakspeed", nil)
    end
end

-- proto_148: Delete an existing spear trajectory preview, Terrain first.
function Fallens.clearSpearTrajectory(workspaceObject)
    local terrain = workspaceObject.Terrain
    local indicator = terrain:FindFirstChild("AimSpearTrajectory")
    if indicator then
        indicator:Destroy()
        return
    end
    indicator = workspaceObject:FindFirstChild("AimSpearTrajectory")
    if indicator then
        indicator:Destroy()
    end
end


function Fallens.applyVisualsForce(state, lighting)
    local visual = state.Visual
    local previous = state.LastVisualState
    local original = state.OriginalLighting

    previous.Fullbright = visual.Fullbright
    if visual.Fullbright then
        lighting.Brightness = 2
        lighting.ClockTime = 14
        -- VM stored these as unresolved constants; the captured lifting uses nil.
        lighting.Ambient = nil
        lighting.OutdoorAmbient = nil
    else
        lighting.Brightness = original.Brightness
        lighting.ClockTime = original.ClockTime
        lighting.Ambient = original.Ambient
        lighting.OutdoorAmbient = original.OutdoorAmbient
    end

    previous.NoShadow = visual.NoShadow
    lighting.GlobalShadows = not visual.NoShadow

    previous.Ambient = visual.Ambient
    previous.AmbientColor = visual.AmbientColor
    previous.Brightness = visual.Brightness
    previous.ClockTime = visual.ClockTime
    if visual.Ambient then
        lighting.Ambient = visual.AmbientColor
        lighting.OutdoorAmbient = visual.AmbientColor
        lighting.Brightness = visual.Brightness
        lighting.ClockTime = visual.ClockTime
    elseif not visual.Fullbright then
        lighting.Brightness = original.Brightness
        lighting.ClockTime = original.ClockTime
        lighting.Ambient = original.Ambient
        lighting.OutdoorAmbient = original.OutdoorAmbient
    end
end

-- Nine ESP color/transparency callbacks reconstructed from original VM-lifted routines.
-- lifted proto_165
function Fallens.setSurvivorFill(state, color, transparency, refresh)
    local visual = state.ESPVisual.Survivor
    visual.FillColor = color
    if transparency ~= nil then
        visual.FillTransparency = transparency
    end
    refresh()
end

-- lifted proto_168
function Fallens.setSurvivorOutline(state, color, transparency, refresh)
    local visual = state.ESPVisual.Survivor
    visual.OutlineColor = color
    if transparency ~= nil then
        visual.OutlineTransparency = transparency
    end
    refresh()
end

-- lifted proto_172
function Fallens.setGeneratorOutline(state, color, transparency, refresh)
    local visual = state.ESPVisual.Generator
    visual.OutlineColor = color
    if transparency ~= nil then
        visual.OutlineTransparency = transparency
    end
    refresh()
end

-- lifted proto_174
function Fallens.setSCPOutline(state, color, transparency, refresh)
    local visual = state.ESPVisual.SCP
    visual.OutlineColor = color
    if transparency ~= nil then
        visual.OutlineTransparency = transparency
    end
    refresh()
end

-- lifted proto_175
function Fallens.setPalletFill(state, color, transparency, refresh)
    local visual = state.ESPVisual.Pallet
    visual.FillColor = color
    if transparency ~= nil then
        visual.FillTransparency = transparency
    end
    refresh()
end

-- lifted proto_176
function Fallens.setPalletOutline(state, color, transparency, refresh)
    local visual = state.ESPVisual.Pallet
    visual.OutlineColor = color
    if transparency ~= nil then
        visual.OutlineTransparency = transparency
    end
    refresh()
end

-- lifted proto_180
function Fallens.setPumpkinOutline(state, color, transparency, refresh)
    local visual = state.ESPVisual.Pumpkin
    visual.OutlineColor = color
    if transparency ~= nil then
        visual.OutlineTransparency = transparency
    end
    refresh()
end

-- lifted proto_181
function Fallens.setBearTrapFill(state, color, transparency, refresh)
    local visual = state.ESPVisual.BearTrap
    visual.FillColor = color
    if transparency ~= nil then
        visual.FillTransparency = transparency
    end
    refresh()
end

-- lifted proto_182
function Fallens.setBearTrapOutline(state, color, transparency, refresh)
    local visual = state.ESPVisual.BearTrap
    visual.OutlineColor = color
    if transparency ~= nil then
        visual.OutlineTransparency = transparency
    end
    refresh()
end

-- lifted proto_t764: stop stun effects and clear the notification state.
function Fallens.clearStunNotification(handlers, state)
    handlers.StopStunMusic()
    handlers.DestroyStunMusic()
    handlers.HideStunSticker()
    state.StunNotification._wasStunned = false
    state.StunNotification._lastKillerChar = nil
end

return Fallens
