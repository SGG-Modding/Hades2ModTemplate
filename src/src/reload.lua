-- basically, only assign to values or define things here
-- such as these private functions

function private.sjson_ShellText(data)
	for _,v in ipairs(data.Texts) do
		if v.Id == 'MainMenuScreen_PlayGame' then
			v.DisplayName = 'Test ' .. _PLUGIN.guid
			break
		end
	end
end

function private.wrap_SetupMap(base)
	print('Map is loading, here we might load some packages.')
	return base()
end

function private.trigger_Gift()
	modutil.mod.Hades.PrintOverhead(config.message)
end