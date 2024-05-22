--[[
Example: editing SJSON data

In this example, we edit the text of the Play button on the main menu, but only
if the `editMainMenu` config entry is set to true.
--]]

if Plugin.config.editMainMenu == true then
  local file = h2m.sjson.load("Game/Text/en/ShellText.en.sjson")
  local playButton = file.get_by_id("MainMenuScreen_PlayGame")
  playButton.set_value("DisplayName", "Hello " .. Plugin.guid)
end
