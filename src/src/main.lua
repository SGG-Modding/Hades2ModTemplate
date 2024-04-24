if not ModName.Config.Enabled then return end

OnAnyLoad { "DeathArea", function(triggerArgs)
  DebugPrint({ Text = "Hello World!" })
end }
