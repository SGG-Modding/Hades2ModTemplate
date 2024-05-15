---@module 'SGG_Modding-ENVY'
local envy = rom.mods['SGG_Modding-ENVY']

---@module 'SGG_Modding-ENVY-auto'
envy.auto(); _ENV = private

---@module 'SGG_Modding-ReLoad'
local reload = rom.mods['SGG_Modding-ReLoad']
local loader = reload.auto_multiple()

---@module 'SGG_Modding-Chalk'
local chalk = rom.mods["SGG_Modding-Chalk"]

---@module 'SGG_Modding-Hades2GameDef-Globals'
local game = rom.game

---@module 'SGG_Modding-SJSON'
local sjson = rom.mods['SGG_Modding-SJSON']

---@module 'SGG_Modding-ModUtil'
local modutil = rom.mods['SGG_Modding-ModUtil']

---@module 'config'
local config = chalk.auto_lua_toml()
public.config = config

local function on_ready_setup()
	-- what to do when we are ready, but not re-do on reload.
	
	if not config.enabled then return end
	
	local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/ShellText.en.sjson')

	sjson.hook(file, function(...)
		return private.sjson_ShellText(...)
	end)
end

local function on_ready_final()
	-- what to do when we are ready, but not re-do on reload.

	if not config.enabled then return end
	
	modutil.mod.Path.Wrap("SetupMap", function(base, ...)
		return private.wrap_SetupMap(base, ...)
	end)
	
	game.OnControlPressed({'Gift', function(...)
		return private.trigger_Gift(...)
	end})
end

local function on_reload_setup()
	-- what to do when we are ready, but also again on every reload.
	-- only do things that are safe to run over and over.
	
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
end

loader.load('plugin is ready', on_ready_setup, on_reload_setup)

modutil.on_ready_final(function()
	loader.load('game is ready', on_ready_final)
end)
