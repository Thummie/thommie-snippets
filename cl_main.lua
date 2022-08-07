-- Disable Blind Fire while in cover
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(4)
		local ped = GetPlayerPed(-1)
		if IsPedInCover(ped) and not IsPedAimingFromCover(ped) then
			DisableControlAction(2, 24, true)
			DisableControlAction(2, 142, true)
			DisableControlAction(2, 257, true)
		end
	end
end)

-- Disable Pistol Whip
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(4)
		if IsPedArmed(GetPlayerPed(-1), 6) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		else
			Citizen.Wait(1500)
		end
	end
end)
