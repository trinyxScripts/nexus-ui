local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/trinyxScripts/nexus-ui/refs/heads/main/nexuslib.lua"))()

local main = Library:new{
	Name = "Custom Name",
	DockPos = "Bottom",
	Theme = Themes.NexusTheme		,
	KeySystemConfig = {
		KeySystem = true,
		Key = "Key",
		KeyLink = "https://discord.gg/uusn8yjs2z",
		Title = "Text",
		Text = "Text"
	},
}

local Tab = main:CreateTab({Icon = "rbxassetid://83262328821985"})
local Tab1 = main:CreateTab({Icon = "rbxassetid://83262328821985"})
local btn = Tab:Button({
	Name = "GGs", 
	callback = function() print("Hi") end
})
local btn = Tab:Button({
	Name = "GGs", 
	callback = function() print("Hi") end
})
local btn = Tab1:Button({
	Name = "GGs", 
	callback = function() print("Hi") end
})

local label = Tab:Label({
	Name = "1234"
})
local label = Tab1:Label({
	Name = "LOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOLLOL"
})

local Slider = Tab:Slider({
         Name = 'slider',
         min = 0,
         max = 100,
         Default = 50,
         callback = function(v)
              if v > 50 then
                     print(v)
                     end
              end
})
local tg = Tab:Toggle({
          Name = 'ss',
          State = false,
          callback = function (v)
                  print(v)
          end
})

local d = Tab:DropDown({
	Name = "Dp",
	callback = function(option) 
		print(option)
	end
})
d:Add("Bob", 1)
d:Add("Second Bob", 2)
d:Add("Third Bob", 3)

local txtInput = Tab1:TextInput({
	PlaceHolderText = "InputValueHere",
	Text = "",
	Title = "Toilet",
	CallBack = function (v)  Tab:Notification({
 Text = v,
 Title = "Title",
 ActiveTime = 5
 }) end
})

local PopUp = Tab:CreatePopUp({
			ButtonLeftText = "Yeah",
			ButtonRightText = "Nah",
			TitleText = "Confirm",
			Text = "Do you want to continue with the action?",
			callback = function()
				print("Action confirmed!")
				PopUp:Destroy()
			end
	})
