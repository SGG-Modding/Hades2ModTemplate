---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.

-- These are some sample code snippets of what you can do with our modding framework:
local file = rom.path.combine(rom.paths.Content, 'Game/Text/en/ShellText.en.sjson')
sjson.hook(file, function(data)
	return sjson_ShellText(data)
end)

modutil.mod.Path.Wrap("SetupMap", function(base, ...)
	prefix_SetupMap()
	return base(...)
end)

game.OnControlPressed({'Gift', function()
	return trigger_Gift()
end})


-- Everything below this line is part of the example mod creation guide,
-- which you can find on our wiki, replacing Schelemeus portrait:
-- https://sgg-modding.github.io/Hades2ModWiki/docs/category/creating-your-first-mod
-- Note that the custom .pkg files are not included in the template, and you will
-- need to create them yourself if you want to follow the tutorial.

-----------------------------------------------------------
--------------- Step 1: Loading the package ---------------
-----------------------------------------------------------

------- Method 1: Calling the package load function when entering the Hub_PreRun room
-- modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
--   if game.CurrentHubRoom.Name == "Hub_PreRun" then
--     mod.LoadSkellyPackage()
--     end
--   base(source, args)
-- end)


------- Method 2: Adding the package load function to the Schelemeus setup events
-- local loadSkellyPackageCall = { FunctionName = _PLUGIN.guid .. ".LoadSkellyPackage" }
-- table.insert(game.EnemyData.NPC_Skelly_01.SetupEvents, loadSkellyPackageCall)


------- Method 3: Adding the package to the list of packages loaded whenever Schelemeus is spawned
local customPortraitsPackageName = _PLUGIN.guid .. "Portraits"
table.insert(game.EnemyData.NPC_Skelly_01.LoadPackages, customPortraitsPackageName)


-----------------------------------------------------------
----------- Step 2: Modifying the portrait path -----------
-----------------------------------------------------------

-- All packages built by `deppth2 hpk` will have the package name as part of all file paths, to prevent mods from clashing
-- If you added any nested folders in your package, include them here as well
local newPortraitFilePath = _PLUGIN.guid .. "Portraits\\Portraits_Skelly_01"

-- rom.path.combine is provided by Hell2Modding to build file paths correctly across different operating systems
-- rom.paths.Content() will return the path to the Content folder of the current Hades II installation
local guiPortraitsVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Portraits_VFX.sjson")

sjson.hook(guiPortraitsVFXFile, function(data)
  for _, entry in ipairs(data.Animations) do
    if entry.Name == "Portrait_Skelly_Default_01" or entry.Name == "Portrait_Skelly_Default_01_Exit" then
      entry.FilePath = newPortraitFilePath
			entry.CreateAnimations = {}
			entry.OffsetY = 0
    end
  end
end)
