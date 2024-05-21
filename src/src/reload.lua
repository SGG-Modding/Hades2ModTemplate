---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- this file will be reloaded if it changes during gameplay,
-- 	so only assign to values or define things here.

function sjson_ShellText(data)
	for _,v in ipairs(data.Texts) do
		if v.Id == 'MainMenuScreen_PlayGame' then
			v.DisplayName = 'Test ' .. _PLUGIN.guid
			break
		end
	end
end

function prefix_SetupMap()
	print('Map is loading, here we might load some packages.')
	-- LoadPackages({Name = package_name_string})
end

function trigger_Gift()
	modutil.mod.Hades.PrintOverhead(config.message)
end