-- Initialize your plugin
Plugin = h2m.PluginBase.new()

-- Set up configuration entries
Plugin.config.onGiftMessage = Plugin.config.bind("General", "OnGift message", "Hello gift!",
	"Message to display when pressing the Gift button");
Plugin.config.editMainMenu = Plugin.config.bind("General", "Edit main menu", true,
	"If set to true, edit the main menu's Play button");

function Plugin.awake()
	-- This is your plugin's main entrypoint, called when your plugin is loaded

	-- If your plugin is simple enough, you may want to code directly in here
	-- Example: hooking onto native triggers
	-- Here we display a configurable message when the `Gift` button is pressed
	h2m.game.OnControlPressed({ "Gift", function()
		h2m.game.PrintOverhead(Plugin.config.onGiftMessage)
	end })

	-- If your plugin becomes more complex, you may want to organize it into
	-- submodules, and then load them here
	-- Examples: see `examples` subdirectory
	require("examples.lua_hooks")
	require("examples.edit_sjson")
end
