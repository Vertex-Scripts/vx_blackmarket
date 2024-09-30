local contextMenuId = "vx_blackmarket_menu"

local function openContextMenu()
	local items = vx.array:new(table.unpack(serverCallbackProxy.getSellableItems()))
	local options = items:map(function(item)
		local itemConfig = shared.getItemByName(item.name)
		local price = itemConfig.price
		local name = item.name
		local count = item.count
		local label = item.label

		local hasItem = item.count > 0
		local title = vx.ternary(hasItem, ("Verkoop %sx %s voor €%s"):format(count, label, count * price), item.label)
		local description = ("€%s per stuk"):format(price)
		if not hasItem then
			description = description .. " (niet genoeg items)"
		end

		---@type VxContextMenuOption
		return {
			title = title,
			args = name,
			onSelect = serverCallbackProxy.sellItem,
			description = description,
			disabled = count <= 0
		}
	end)

	vx.registerContextMenu({
		title = "Blackmarket",
		id = contextMenuId,
		options = options
	})

	vx.openContextMenu(contextMenuId)
end

local function registerInteractablePed(ped)
	vx.target.addLocalEntity(ped, {
		label = "Open Blackmarket",
		icon = "fas fa-shopping-basket",
		onSelect = openContextMenu
	})
end

Citizen.CreateThread(function()
	if SharedConfig.blip then
		vx.addBlipForCoords(SharedConfig.blip)
	end

	local ped = vx.createPed(1, SharedConfig.pedModel, SharedConfig.pedCoords, SharedConfig.pedHeading, false, true)
	SetEntityInvincible(ped, true)
	SetEntityHasGravity(ped, true)
	SetEntityCollision(ped, true, true)
	SetPedCanRagdoll(ped, false)
	SetEntityCanBeDamaged(ped, false)
	FreezeEntityPosition(ped, true)
	TaskSetBlockingOfNonTemporaryEvents(ped, true)

	registerInteractablePed(ped)
end)
