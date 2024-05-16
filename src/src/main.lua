-- importing our dependencies,
-- these funky (---@) comments are just there
--	 to help VS Code find the definitions of things

---@module 'SGG_Modding-Hades2GameDef-Globals'
local game = rom.game
---@module 'SGG_Modding-Chalk'
local chalk = rom.mods["SGG_Modding-Chalk"]
---@module 'SGG_Modding-SJSON'
local sjson = rom.mods['SGG_Modding-SJSON']
---@module 'SGG_Modding-ModUtil'
local modutil = rom.mods['SGG_Modding-ModUtil']
---@module 'SGG_Modding-ReLoad'
local reload = rom.mods['SGG_Modding-ReLoad']

---@module 'SGG_Modding-ENVY'
local envy = rom.mods['SGG_Modding-ENVY']
---@module 'SGG_Modding-ENVY-auto'
envy.auto() -- this gives us `public`, `private`, and `import`!

-- this allows us to limit certain functions to not be reloaded.
local loader = reload.auto_multiple()

---@module 'config'
local config = chalk.auto_lua_toml() 
-- ^ this updates our config.toml in the config folder!
public.config = config -- so other mods can access our config

local function on_ready_setup()
	-- what to do when we are ready, but not re-do on reload.
	
	-- modutil is not ready at this stage,
	-- so we're going to wait for it when we call `on_ready_final`
	-- but we don't need modutil to mess with the sjson
	
	if not config.enabled then return end
	
	local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/ShellText.en.sjson')

	sjson.hook(file, function(...)
		return private.sjson_ShellText(...)
	end)
end

local function on_ready_final()
	-- what to do when we are ready, but not re-do on reload.
	
	-- now modutil and all of the game's functions are ready
	-- so we can do wraps on those functions!

	if not config.enabled then return end
	
	modutil.mod.Path.Wrap("SetupMap", function(base, ...)
		return private.wrap_SetupMap(base, ...)
	end)
	
	game.OnControlPressed({'Gift', function(...)
		return private.trigger_Gift(...)
	end})
	
	-- these private functions are defined in `on_reload`,
	-- so we can change them and have that change immediately appear in-game.
end

local function on_reload()
	-- what to do when we are ready, but also again on every reload.
	-- only do things that are safe to run over and over.
	
	import 'reload.lua'
	-- ^ this file will be run, and have access to all of `private` still.
end

-- this runs immediately
loader.load('plugin is ready', on_ready_setup, on_reload)

-- this runs only when modutil and the game's lua is ready
modutil.on_ready_final(function()
	loader.load('game is ready', on_ready_final)
end)

-- ^ we need to give these unique (to the file) strings at the front
-- 	so that they know when they've already been run before, detecting reloads