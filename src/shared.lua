clientCallbackProxy = vx.createCallbackProxy()
serverCallbackProxy = vx.createCallbackProxy()

shared = {}

function shared.getItemByName(name)
  return SharedConfig.items:find(function(x) return x.name == name end)
end
