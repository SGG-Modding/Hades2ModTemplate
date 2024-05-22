--[[
Example: hooking onto Lua functions

In this example, we run our own code before and after various functions are
called (also known as prefixing / suffixing / wrapping functions).
--]]

h2m.Hook("CalculateDamageMultipliers", function(originalFunction, args)
  -- here we let the original call happen, and then double the return value
  local originalReturnValue = originalFunction(args)
  local modifiedReturnValue = originalReturnValue * 2.0
  Plugin.log(h2m.logLevels.DEBUG, "Original damage multiplier:" .. originalReturnValue)
  Plugin.log(h2m.logLevels.DEBUG, "Modified damage multiplier:" .. modifiedReturnValue)
  return modifiedReturnValue
end)

h2m.Hook("CalculateDamageAdditions", function(originalFunction, args)
  -- here we intercept the original call and edit its arguments before it runs
  Plugin.log(h2m.logLevels.DEBUG, "Original EffectIsTriggered value:" .. args.triggerArgs.EffectIsTriggered)
  args.triggerArgs.EffectIsTriggered = true
  Plugin.log(h2m.logLevels.DEBUG, "Modified EffectIsTriggered value:" .. args.triggerArgs.EffectIsTriggered)
  return originalFunction(args)
end)

h2m.Hook("CalculateCritChance", function(originalFunction, args)
  -- here we completely ignore the original function call and instead enforce a
  -- 100% chance to crit
  return 1.0
end)
