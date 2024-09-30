function serverCallbackProxy.getSellableItems(source)
   return SharedConfig.items:map(function(item)
      local count = vx.inventory.getItemCount(source, item.name) or 0
      return {
         label = item.label,
         name = item.name,
         count = count,
         price = count * item.price,
         priceEach = item.price
      }
   end)
end

function serverCallbackProxy.sellItem(item, source)
   local itemConfig = shared.getItemByName(item)
   if not itemConfig then
      return false
   end

   local itemCount = vx.inventory.getItemCount(source, item)
   if itemCount <= 0 then
      return false
   end

   local vxPlayer = vx.player.getFromId(source)
   vx.inventory.removeItem(source, item, itemCount)
   vxPlayer:addAccountMoney("black_money", itemConfig.price * itemCount)
end
