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

-- Vehicle Air Control
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)
        local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    	if DoesEntityExist(Vehicle) and not IsEntityDead(Vehicle) then
    	    local Model = GetEntityModel(Vehicle)
            if not IsThisModelABoat(Model) and not IsThisModelAHeli(Model) and not IsThisModelAPlane(Model) and not IsThisModelABike(Model) and IsEntityInAir(Vehicle) then
		DisableControlAction(0, 280)-- Left Shift
		DisableControlAction(0, 281)-- Left Control
		DisableControlAction(0, 60)-- Left Shift
		DisableControlAction(0, 61)-- Lef Control
		DisableControlAction(0, 131)-- Left Shift
		DisableControlAction(0, 132)-- Lef Control
		DisableControlAction(0, 209)-- Left Shift
		DisableControlAction(0, 210)-- Lef Control
		DisableControlAction(0, 340)-- Left Shift
		DisableControlAction(0, 341)-- Lef Control
		DisableControlAction(0, 63)-- A
		DisableControlAction(0, 64)-- D
		DisableControlAction(0, 338)-- A
		DisableControlAction(0, 339)-- D
		DisableControlAction(0, 59)-- D
           end
	end
    end
end)

--Amount of peds walking & driving around
Citizen.CreateThread(function()
  while true do
	Citizen.Wait(0)
    	WaterOverrideSetStrength(0.0)
	SetVehicleDensityMultiplierThisFrame(0.52)
	SetPedDensityMultiplierThisFrame(1.0)
  	SetParkedVehicleDensityMultiplierThisFrame(0.40)
	SetScenarioPedDensityMultiplierThisFrame(0.31, 0.31)
    end
end)
