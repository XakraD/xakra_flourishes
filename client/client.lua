local Flourish1, Flourish2, Flourish3, Flourish4, Flourish5, Flourish6
local Flourishes = GetRandomIntInRange(0, 0xffffff)

Citizen.CreateThread(function()
    local str = GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_VAR_A'))
    Flourish1 = PromptRegisterBegin()
    PromptSetControlAction(Flourish1, GetHashKey('INPUT_EMOTE_TWIRL_GUN_VAR_A'))
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Flourish1, str)
    PromptSetEnabled(Flourish1, true)
    PromptSetVisible(Flourish1, true)
	PromptSetHoldMode(Flourish1, true)
	PromptSetGroup(Flourish1, Flourishes)
	PromptRegisterEnd(Flourish1)

    local str2 = GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_VAR_B'))
    Flourish2 = PromptRegisterBegin()
    PromptSetControlAction(Flourish2, GetHashKey('INPUT_EMOTE_TWIRL_GUN_VAR_B'))
    str2 = CreateVarString(10, 'LITERAL_STRING', str2)
    PromptSetText(Flourish2, str2)
    PromptSetEnabled(Flourish2, true)
    PromptSetVisible(Flourish2, true)
	PromptSetHoldMode(Flourish2, true)
	PromptSetGroup(Flourish2, Flourishes)
	PromptRegisterEnd(Flourish2)

    local str3 = GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_VAR_C'))
    Flourish3 = PromptRegisterBegin()
    PromptSetControlAction(Flourish3, GetHashKey('INPUT_EMOTE_TWIRL_GUN_VAR_C'))
    str3 = CreateVarString(10, 'LITERAL_STRING', str3)
    PromptSetText(Flourish3, str3)
    PromptSetEnabled(Flourish3, true)
    PromptSetVisible(Flourish3, true)
	PromptSetHoldMode(Flourish3, true)
	PromptSetGroup(Flourish3, Flourishes)
	PromptRegisterEnd(Flourish3)

    local str4 = GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_VAR_D'))
    Flourish4 = PromptRegisterBegin()
    PromptSetControlAction(Flourish4, GetHashKey('INPUT_EMOTE_TWIRL_GUN_VAR_D'))
    str4 = CreateVarString(10, 'LITERAL_STRING', str4)
    PromptSetText(Flourish4, str4)
    PromptSetEnabled(Flourish4, true)
    PromptSetVisible(Flourish4, true)
	PromptSetHoldMode(Flourish4, true)
	PromptSetGroup(Flourish4, Flourishes)
	PromptRegisterEnd(Flourish4)

    local str5 = GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_VAR_E'))
    Flourish5 = PromptRegisterBegin()
    PromptSetControlAction(Flourish5, GetHashKey('INPUT_CRAFTING_EAT'))
    str5 = CreateVarString(10, 'LITERAL_STRING', str5)
    PromptSetText(Flourish5, str5)
    PromptSetEnabled(Flourish5, true)
    PromptSetVisible(Flourish5, true)
	PromptSetHoldMode(Flourish5, true)
	PromptSetGroup(Flourish5, Flourishes)
	PromptRegisterEnd(Flourish5)

    -- local str6 = GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_VAR_F'))
    -- Flourish6 = PromptRegisterBegin()
    -- PromptSetControlAction(Flourish6, GetHashKey('INPUT_GAME_MENU_TAB_LEFT'))
    -- str6 = CreateVarString(10, 'LITERAL_STRING', str6)
    -- PromptSetText(Flourish6, str6)
    -- PromptSetEnabled(Flourish6, true)
    -- PromptSetVisible(Flourish6, true)
	-- PromptSetHoldMode(Flourish6, true)
	-- PromptSetGroup(Flourish6, Flourishes)
	-- PromptRegisterEnd(Flourish6)
end)

local emote1 = GetHashKey('KIT_EMOTE_TWIRL_GUN')
local emote2 = GetHashKey('KIT_EMOTE_TWIRL_GUN_DUAL')

RegisterCommand("flourishes", function(source, args, rawCommand)
    if Citizen.InvokeNative(0xCF9B71C0AF824036, PlayerPedId(), -1) then
        return
    end

	local weapon0 = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
	local weapon1 = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 1)

    local ActiveEmote
	if weapon0 ~= 0 and weapon1 ~= 0 then
        ActiveEmote = emote2
        Citizen.InvokeNative(0xCBCFFF805F1B4596, PlayerPedId(), emote2)    -- SetActiveGunSpinningEquipKitEmoteTwirl
        Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 4, 1, Citizen.InvokeNative(0x2C4FEC3D0EFA9FC0, PlayerPedId()), true, false, false, false, false)    -- TaskPlayEmoteWithHash, GetPedGunSpinningEquippedKitEmoteTwirl
        Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 4)    -- SetGunSpinningInventorySlotIdActivate

    elseif weapon0 ~= 0 then
        ActiveEmote = emote1
        Citizen.InvokeNative(0xCBCFFF805F1B4596, PlayerPedId(), emote1)    -- SetActiveGunSpinningEquipKitEmoteTwirl
        Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 4, 1, Citizen.InvokeNative(0x2C4FEC3D0EFA9FC0, PlayerPedId()), true, false, false, false, false)    -- TaskPlayEmoteWithHash, GetPedGunSpinningEquippedKitEmoteTwirl
        Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 4)    -- SetGunSpinningInventorySlotIdActivate
	end

    Wait(500)
    if Citizen.InvokeNative(0xCF9B71C0AF824036, PlayerPedId(), -1) then -- IsEmoteTaskRunning
        Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 0, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 0))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
        Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 1, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 1))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
        Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 2, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 2))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
        Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 3, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 3))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
        Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 4, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 4))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
        -- Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 5, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 5))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
        Citizen.InvokeNative(0x01F661BB9C71B465, PlayerPedId(), 6, Citizen.InvokeNative(0xF4601C1203B1A78D, ActiveEmote, 6))  -- SetActiveGunSpinningKitEmoteTwirl, GetWeaponGunSpinningWeaponEmoteTrickTypeHash
    end

    while Citizen.InvokeNative(0xCF9B71C0AF824036, PlayerPedId(), -1) do    -- IsEmoteTaskRunning
        Wait(0)
        local label = CreateVarString(10, 'LITERAL_STRING', GetLabelTextByHash(GetHashKey('KIT_EMOTE_TWIRL_GUN_HOLD')))
        PromptSetActiveGroupThisFrame(Flourishes, label)

        if PromptHasHoldModeCompleted(Flourish1) then
            Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 0)    -- SetGunSpinningInventorySlotIdActivate
        elseif PromptHasHoldModeCompleted(Flourish2) then
            Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 1)    -- SetGunSpinningInventorySlotIdActivate    
        elseif PromptHasHoldModeCompleted(Flourish3) then
            Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 2)    -- SetGunSpinningInventorySlotIdActivate
        elseif PromptHasHoldModeCompleted(Flourish4) then
            Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 3)    -- SetGunSpinningInventorySlotIdActivate
        elseif PromptHasHoldModeCompleted(Flourish5) then
            Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 4)    -- SetGunSpinningInventorySlotIdActivate
            TriggerEvent('xakra_flourishes:DisablePrompts')
        -- elseif PromptHasHoldModeCompleted(Flourish6) then
        --     Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 5)    -- SetGunSpinningInventorySlotIdActivate
        else
            Citizen.InvokeNative(0x408CF580C5E96D49, PlayerPedId(), 6)    -- SetGunSpinningInventorySlotIdActivate
        end
    end
end)

RegisterNetEvent('xakra_flourishes:DisablePrompts')
AddEventHandler('xakra_flourishes:DisablePrompts', function()
    Wait(1000)
    PromptSetEnabled(Flourish1, false)
    PromptSetEnabled(Flourish2, false)
    PromptSetEnabled(Flourish3, false)
    PromptSetEnabled(Flourish4, false)
    -- PromptSetEnabled(Flourish5, false)
    PromptSetEnabled(Flourish6, false)

    Wait(2000)
    PromptSetEnabled(Flourish1, true)
    PromptSetEnabled(Flourish2, true)
    PromptSetEnabled(Flourish3, true)
    PromptSetEnabled(Flourish4, true)
    -- PromptSetEnabled(Flourish5, true)
    PromptSetEnabled(Flourish6, true)
end)