SharedConfig = {}

SharedConfig.pedModel = "s_m_m_bouncer_01"
SharedConfig.pedCoords = vector3(1228.4922, -3327.1389, 5.0288)
SharedConfig.pedHeading = 205.1451

---@type VxBlipOptions
SharedConfig.blip = {
   coords = SharedConfig.pedCoords,
   sprite = 110,
   color = 40,
   text = "Blackmarket",
   scale = 0.6,
   shortRange = true
}

SharedConfig.items = vx.array:new(
   {
      name = "jewels",
      label = "Juwelen",
      icon = "fas fa-ring",
      price = 1000,
   },
   {
      name = "diamond",
      label = "Diamanten",
      icon = "fas fa-gem",
      price = 2500,
   }
)
