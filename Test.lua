--services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runServices = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

local pl = players.LocalPlayer
local mouse = pl:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)


--did
--toggle buttons tab main ui :()
local Library = {}

local Themes = {
	
	DarkBlue = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(15, 24, 32),

		ButtonColor = Color3.fromRGB(22, 36, 49),
		ButtonInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--dropdown
		DropDownColor = Color3.fromRGB(22, 36, 49),
		DropDownOptionsColor = Color3.fromRGB(46, 77, 104),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(97, 97, 97),
		DropDownInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--label
		LabelColor = Color3.fromRGB(22, 36, 49),
		LabelInputStrokeColor = Color3.fromRGB(10, 91, 97),
		--slider
		SliderColor = Color3.fromRGB(22, 36, 49),
		SliderBackColor = Color3.fromRGB(14, 21, 33),
		SliderFillColor = Color3.fromRGB(39, 59, 91),
		SliderStrokeAll = Color3.fromRGB(97, 97, 97),
		--toggle
		ToggleColor = Color3.fromRGB(22, 36, 49),
		ToggleCheckColorInactive = Color3.fromRGB(15, 24, 33),
		ToggleCheckColor = Color3.fromRGB(42, 128, 136),
		--not naming this shit
		TopBar = Color3.fromRGB(10, 16, 22),
		TopBarInputStrokeColor = Color3.fromRGB(10, 16, 22),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 182, 182),
		DockColor = Color3.fromRGB(15, 24, 32),
		TextColor = Color3.fromRGB(255,255,255),
		--Pops Ups
		PopUpColor = Color3.fromRGB(22, 36, 48),
		PopUpButtonColor = Color3.fromRGB(36, 60, 98),
		PopUpStroke = Color3.fromRGB(86, 86, 86),
		InputStrokeColor = Color3.fromRGB(97, 97, 97),

		TextInputColor = Color3.fromRGB(22, 36, 49),
		TabColor = Color3.fromRGB(134, 134, 134),
		NotificationColor = Color3.fromRGB(22, 36, 48),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(42, 56, 68),
	},
	NexusTheme = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(26, 15, 32),

		ButtonColor = Color3.fromRGB(49, 27, 65),
		ButtonInputStrokeColor = Color3.fromRGB(0, 0, 0),
		--dropdown
		DropDownColor = Color3.fromRGB(49, 27, 65),
		DropDownOptionsColor = Color3.fromRGB(83, 46, 111),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(0,0,0),
		DropDownInputStrokeColor = Color3.fromRGB(0,0,0),
		--label
		LabelColor = Color3.fromRGB(32, 18, 43),
		LabelInputStrokeColor = Color3.fromRGB(66, 18, 138),
		--slider
		SliderColor = Color3.fromRGB(49, 27, 65),
		SliderBackColor = Color3.fromRGB(14, 21, 33),
		SliderFillColor = Color3.fromRGB(105, 59, 141),
		SliderStrokeAll = Color3.fromRGB(120,120,120),
		--toggle
		ToggleColor = Color3.fromRGB(49, 27, 65),
		ToggleCheckColorInactive = Color3.fromRGB(33, 18, 44),
		ToggleCheckColor = Color3.fromRGB(118, 66, 158),
		--not naming this shit
		TopBar = Color3.fromRGB(47, 37, 70),
		TopBarInputStrokeColor = Color3.fromRGB(10, 16, 22),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 182, 182),
		DockColor = Color3.fromRGB(26, 15, 32),
		TextColor = Color3.fromRGB(255,255,255),
		InputStrokeColor = Color3.fromRGB(0, 0, 0),
		--Pops Ups
		PopUpColor = Color3.fromRGB(34, 19, 45),
		PopUpButtonColor = Color3.fromRGB(91, 51, 121),
		PopUpStroke = Color3.fromRGB(120, 103, 140),
		TextInputColor = Color3.fromRGB(49, 27, 65),
		TabColor = Color3.fromRGB(134, 134, 134),

		NotificationColor = Color3.fromRGB(40, 21, 48),
		NotificationInputStrokeColor = Color3.fromRGB(161, 9, 199),
		NotificationSeperatorColor = Color3.fromRGB(60, 41, 68),
	},
	DarkGreen = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(20, 30, 20),

		ButtonColor = Color3.fromRGB(30, 45, 30),
		ButtonInputStrokeColor = Color3.fromRGB(97, 97, 97),
		TextInputColor = Color3.fromRGB(30, 45, 30),
		InputStrokeColor = Color3.fromRGB(97, 97, 97),
		--dropdown
		DropDownColor = Color3.fromRGB(30, 45, 30),
		DropDownOptionsColor = Color3.fromRGB(50, 80, 50),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(90, 90, 90),
		DropDownInputStrokeColor = Color3.fromRGB(97, 97, 97),
		--label
		LabelColor = Color3.fromRGB(30, 45, 30),
		LabelInputStrokeColor = Color3.fromRGB(20, 80, 20),
		--slider
		SliderColor = Color3.fromRGB(30, 45, 30),
		SliderBackColor = Color3.fromRGB(20, 30, 20),
		SliderFillColor = Color3.fromRGB(40, 60, 40),
		SliderStrokeAll = Color3.fromRGB(97, 97, 97),
		--toggle
		ToggleColor = Color3.fromRGB(30, 45, 30),
		ToggleCheckColorInactive = Color3.fromRGB(20, 30, 20),
		ToggleCheckColor = Color3.fromRGB(50, 150, 50),
		--not naming this shit
		TopBar = Color3.fromRGB(10, 20, 10),
		TopBarInputStrokeColor = Color3.fromRGB(10, 20, 10),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 182, 182),
		DockColor = Color3.fromRGB(20, 30, 20),
		TextColor = Color3.fromRGB(255,255,255),
		PopUpColor = Color3.fromRGB(25, 39, 18),
		PopUpButtonColor = Color3.fromRGB(35, 98, 40),PopUpStroke = Color3.fromRGB(70, 86, 60),
		TabColor = Color3.fromRGB(134, 134, 134),

		NotificationColor = Color3.fromRGB(34, (72-5), 30),
		NotificationInputStrokeColor = Color3.fromRGB(159, 199, 16),
		NotificationSeperatorColor = Color3.fromRGB(54, 87, 50),
	},
	DarkRed = {
		isDark = true,
		BackgroundColor = Color3.fromRGB(32, 15, 15),

		ButtonColor = Color3.fromRGB(49, 22, 22),
		TextInputColor = Color3.fromRGB(49, 22, 22),
		ButtonInputStrokeColor = Color3.fromRGB(97, 50, 50),
		InputStrokeColor = Color3.fromRGB(97, 50, 50),
		--dropdown
		DropDownColor = Color3.fromRGB(49, 22, 22),
		DropDownOptionsColor = Color3.fromRGB(104, 46, 46),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(97, 50, 50),
		DropDownInputStrokeColor = Color3.fromRGB(97, 50, 50),
		--label
		LabelColor = Color3.fromRGB(49, 22, 22),
		LabelInputStrokeColor = Color3.fromRGB(97, 50, 50),
		--slider
		SliderColor = Color3.fromRGB(49, 22, 22),
		SliderBackColor = Color3.fromRGB(33, 14, 14),
		SliderFillColor = Color3.fromRGB(91, 39, 39),
		SliderStrokeAll = Color3.fromRGB(97, 50, 50),
		--toggle
		ToggleColor = Color3.fromRGB(49, 22, 22),
		ToggleCheckColorInactive = Color3.fromRGB(33, 15, 15),
		ToggleCheckColor = Color3.fromRGB(136, 42, 42),
		--not naming this shit
		TopBar = Color3.fromRGB(22, 10, 10),
		TopBarInputStrokeColor = Color3.fromRGB(22, 10, 10),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(182, 150, 150),
		DockColor = Color3.fromRGB(32, 15, 15),
		TextColor = Color3.fromRGB(255,255,255),
		PopUpColor = Color3.fromRGB(56, 26, 26),
		PopUpButtonColor = Color3.fromRGB(130, 38, 38),
		PopUpStroke = Color3.fromRGB(148, 33, 33),
		TabColor = Color3.fromRGB(134, 134, 134),
		NotificationColor = Color3.fromRGB(32, 15, 15),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(32+20, 15+20, 15+20),
	},
	LightYellow = {
		isDark = false,
		BackgroundColor = Color3.fromRGB(234, 234, 173),

		ButtonColor = Color3.fromRGB(240, 240, 200),
		TextInputColor = Color3.fromRGB(240, 240, 200),
		ButtonInputStrokeColor = Color3.fromRGB(210, 210, 170),
		InputStrokeColor = Color3.fromRGB(210, 210, 170),
		--dropdown
		DropDownColor = Color3.fromRGB(240, 240, 200),
		DropDownOptionsColor = Color3.fromRGB(220, 220, 190),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(210, 210, 170),
		DropDownInputStrokeColor = Color3.fromRGB(210, 210, 170),
		--label
		LabelColor = Color3.fromRGB(240, 240, 200),
		LabelInputStrokeColor = Color3.fromRGB(210, 210, 170),
		--slider
		SliderColor = Color3.fromRGB(240, 240, 200),
		SliderBackColor = Color3.fromRGB(255, 255, 220),
		SliderFillColor = Color3.fromRGB(230, 230, 190),
		SliderStrokeAll = Color3.fromRGB(210, 210, 170),
		--toggle
		ToggleColor = Color3.fromRGB(240, 240, 200),
		ToggleCheckColorInactive = Color3.fromRGB(255, 255, 220),
		ToggleCheckColor = Color3.fromRGB(200, 200, 160),
		--not naming this shit
		TopBar = Color3.fromRGB(220, 220, 180),
		TopBarInputStrokeColor = Color3.fromRGB(220, 220, 180),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(182, 182, 150),
		DockColor = Color3.fromRGB(255, 255, 220),
		TextColor = Color3.fromRGB(0,0,0),
		PopUpColor = Color3.fromRGB(218, 218, 162),
		PopUpButtonColor = Color3.fromRGB(158, 156, 132),
		PopUpStroke = Color3.fromRGB(182, 175, 76),
		TabColor = Color3.fromRGB(67, 67, 67),
		NotificationColor = Color3.fromRGB(234, 234, 173),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(254, 254, 193),
	},
	LightBlue = {
		isDark = false,
		BackgroundColor = Color3.fromRGB(194, 227, 255),

		ButtonColor = Color3.fromRGB(200, 220, 240),
		TextInputColor = Color3.fromRGB(200, 220, 240),
		ButtonInputStrokeColor = Color3.fromRGB(170, 190, 210),
		InputStrokeColor = Color3.fromRGB(170, 190, 210),
		--dropdown
		DropDownColor = Color3.fromRGB(200, 220, 240),
		DropDownOptionsColor = Color3.fromRGB(190, 210, 230),
		DropDownOptionsInputStrokeColor = Color3.fromRGB(140, 160, 180),
		DropDownInputStrokeColor = Color3.fromRGB(140, 160, 180),
		--label
		LabelColor = Color3.fromRGB(200, 220, 240),
		LabelInputStrokeColor = Color3.fromRGB(150, 170, 190),
		--slider
		SliderColor = Color3.fromRGB(200, 220, 240),
		SliderBackColor = Color3.fromRGB(220, 230, 255),
		SliderFillColor = Color3.fromRGB(190, 210, 230),
		SliderStrokeAll = Color3.fromRGB(130,150,170),
		--toggle
		ToggleColor = Color3.fromRGB(200, 220, 240),
		ToggleCheckColorInactive = Color3.fromRGB(220, 230, 255),
		ToggleCheckColor = Color3.fromRGB(160, 180, 200),
		--not naming this shit
		TopBar = Color3.fromRGB(180, 200, 220),
		TopBarInputStrokeColor = Color3.fromRGB(180, 200, 220),

		TabButtonActive = Color3.fromRGB(255, 255, 255),
		TabButtonInactive = Color3.fromRGB(150, 150, 182),
		DockColor = Color3.fromRGB(220, 230, 255),
		TextColor = Color3.fromRGB(0,0,0),
		PopUpColor = Color3.fromRGB(194, 218, 255),
		PopUpButtonColor = Color3.fromRGB(175, 199, 255),
		PopUpStroke = Color3.fromRGB(176, 176, 176),
		TabColor = Color3.fromRGB(67, 67, 67),
		NotificationColor = Color3.fromRGB(194, 227, 255),
		NotificationInputStrokeColor = Color3.fromRGB(199, 138, 16),
		NotificationSeperatorColor = Color3.fromRGB(194-20, 227-20, 255-20),
	}
}

--Library.Theme = Themes

local Theme = Themes.DarkBlue

function Library:Validate(defaults,options)

	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end
function Library:tween(object, goal, time, easeStyle,EaseDirection, callback)
	local tweenInfo = TweenInfo.new(
		time or 0.15,
		easeStyle or Enum.EasingStyle.Back,
		EaseDirection or Enum.EasingDirection.Out
	)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
	return tween
end



function Library:new(options)
	options = Library:Validate({
		name = "Default",
		DockPos = "Bottom",
		Theme = nil,
		KeySystemConfig = {
			KeySystem = true,
			Key = "",
			KeyLink = "https://discord.gg/uusn8yjs2z"
		},
	},options or {})

	
local GUI = {
		Active = false,
		CurrentTab = nil,
		Visibility = not options.KeySystemConfig.KeySystem,
		HasKeyBeenInputed = not options.KeySystemConfig.KeySystem,
	}
	Theme = Themes.LightBlue
	if options.Theme == nil then
		Theme = Themes.DarkBlue
		local CurrentTheme = Themes.DarkBlue
	else
		Theme = options.Theme
		local CurrentTheme = options.Theme
	end

	local function addColors(color1, color2)
		return Color3.new(
			math.min(color1.R + color2.R, 1),
			math.min(color1.G + color2.G, 1),
			math.min(color1.B + color2.B, 1)
		)
	end
	--logic

	--All Ui	
	
	GUI["1"] = Instance.new("ScreenGui", runServices:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
	GUI["1"]["Name"] = [[UxiLib]];
	GUI["1"]["IgnoreGuiInset"] = true
	GUI["2"] = Instance.new("Frame", GUI["1"]);
	GUI["2"]["BorderSizePixel"] = 0;
	GUI["2"]["BackgroundColor3"] = Theme.BackgroundColor;
	GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["2"]["Size"] = UDim2.new(0, 401, 0, 300);
	GUI.Visibility =  options.KeySystemConfig.KeySystem
	GUI["2"]["Position"] = UDim2.new(0.5,0,2,0)


	local Pos = UDim2.new(0.5,0,0.5,0)

	Library:tween(GUI["2"], {Position = Pos}, 1.7,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)

	function GUI:Move()

		GUI["2"]["Position"] = UDim2.new(0.5,0,2,0)

		local Pos = UDim2.new(0.5,0,0.5,0)

		Library:tween(GUI["2"], {Position = Pos}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
	end

	GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["2"]["Name"] = [[Main]];



	GUI["3"] = Instance.new("UICorner", GUI["2"]);
	GUI["3"]["CornerRadius"] = UDim.new(0, 9);

	GUI["54"] = Instance.new("Frame", GUI["2"]);
	GUI["54"]["ZIndex"] = 0;
	GUI["54"]["BorderSizePixel"] = 0;
	GUI["54"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["54"]["Name"] = [[DropShadowHolder]];
	GUI["54"]["BackgroundTransparency"] = 1;

	local Transparency = GUI["2"].Transparency

	local isAnimating = false

	function GUI:_ToggleVisibility()
		if not GUI.HasKeyBeenInputed then
			GUI["2"]["Visible"] = false 
			GUI.Visibility = false
			
		elseif GUI.Visibility == true and GUI.HasKeyBeenInputed and not isAnimating then
			isAnimating = true
			GUI["2"].ClipsDescendants = true
			GUI.Visibility = not GUI.Visibility
			Library:tween(GUI["2"], {Size = UDim2.new(0,0,0,0)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In,function()
				GUI["2"]["Visible"] = false
				isAnimating = false
			end)
		elseif GUI.Visibility == false and GUI.HasKeyBeenInputed and not isAnimating then
			isAnimating = true
			GUI["2"]["Visible"] = true 
			GUI.Visibility = not GUI.Visibility
			Library:tween(GUI["2"], {Size = UDim2.new(0,401,0,300)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out,function()
				GUI["2"].ClipsDescendants = false
				isAnimating = false
			end)
		end
		
	end
	GUI:_ToggleVisibility()

	uis.InputBegan:Connect(function(input, gameProcessed)
		if input.KeyCode == Enum.KeyCode.K and not gameProcessed and not GUI.IsKeySystemOn then
			GUI:_ToggleVisibility()
			print(tostring(GUI.FirstTime).. " first time")
			print(tostring(GUI.HasKeyBeenInputed).. " hasbeeninputed")
			print(tostring(GUI.Visibility).. " vis")
		end
	end)

	function GUI:_Destroy()
		local currentPos = GUI["2"].Position
		local viewport = workspace.CurrentCamera.ViewportSize

		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Library:tween(GUI["2"], {Position = UDim2.new(GUI["2"].Position.X.Scale,0,1.7,0)}, 1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)


		local sound = Instance.new("Sound")  -- its SoundId not soundID
		sound.Volume = 1 -- add volume property
		sound.Parent = game:GetService("SoundService")
		sound.SoundId = "rbxassetid://1524543584"

		sound:Play()

		sound.Ended:Connect(function()
			GUI["2"]:Destroy()
			GUI["1"]:Destroy()
			script:Destroy()
		end)
	end

	--shadow
	do
		GUI["55"] = Instance.new("ImageLabel", GUI["54"]);
		GUI["55"]["ZIndex"] = 0;
		GUI["55"]["BorderSizePixel"] = 0;
		GUI["55"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["55"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["55"]["ImageTransparency"] = 0.5;
		GUI["55"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["55"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["55"]["Image"] = [[rbxassetid://6014261993]];
		GUI["55"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["55"]["BackgroundTransparency"] = 1;
		GUI["55"]["Name"] = [[DropShadow]];
		GUI["55"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		GUI["55"]["ImageColor3"] = Theme.TextColor;


	end

	--Top Bar
	do
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Theme.TopBar;
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["Name"] = [[TopBar]];

		GUI["5"] = Instance.new("UICorner", GUI["4"]);
		GUI["5"]["CornerRadius"] = UDim.new(0, 9);


		-- StarterGui.UxiLib.Main.TopBar.Extention
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Theme.TopBar;
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[Extention]];


		-- StarterGui.UxiLib.Main.TopBar.Title
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["TextSize"] = 20;
		GUI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		GUI["7"]["TextColor3"] = Theme.TextColor;
		GUI["7"]["BackgroundTransparency"] = 1;
		GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Text"] = options["Name"];
		GUI["7"]["Name"] = [[Title]];


		-- StarterGui.UxiLib.Main.TopBar.Title.UIPadding
		GUI["8"] = Instance.new("UIPadding", GUI["7"]);
		GUI["8"]["PaddingTop"] = UDim.new(0, 1);
		GUI["8"]["PaddingLeft"] = UDim.new(0, 8);


		-- StarterGui.UxiLib.Main.TopBar.Exit


		-- StarterGui.UxiLib.Main.TopBar.line
		GUI["a"] = Instance.new("Frame", GUI["4"]);
		GUI["a"]["ZIndex"] = 2;
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Theme.TopBarInputStrokeColor;
		GUI["a"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["a"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["a"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["a"]["Name"] = [[line]];
	end

	--topbar logic
	do
		local topbar = GUI["4"]
		local draggableFrame = GUI["2"]

		local isDragging = false
		local dragStart = nil
		local startPos = nil
		local currentTween = nil

		local function smoothMove(targetPosition)
			if currentTween then currentTween:Cancel() end
			currentTween = Library:tween(draggableFrame, {Position = targetPosition}, 0.80, Enum.EasingStyle.Exponential)
		end

		topbar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = true
				dragStart = input.Position
				startPos = draggableFrame.Position
			end
		end)

		uis.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isDragging = false
			end
		end)

		uis.InputChanged:Connect(function(input)
			if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				local mouseOffset = input.Position - dragStart
				local targetPosition = UDim2.new(
					startPos.X.Scale, startPos.X.Offset + mouseOffset.X,
					startPos.Y.Scale, startPos.Y.Offset + mouseOffset.Y
				)
				smoothMove(targetPosition)
			end
		end)
	end
	--main content
	do
		GUI["14"] = Instance.new("Frame", GUI["2"]);
		GUI["14"]["BorderSizePixel"] = 0;
		GUI["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["14"]["Size"] = UDim2.new(0, 400, 0, 270);
		GUI["14"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["14"]["Name"] = [[MainContent]];
		GUI["14"]["BackgroundTransparency"] = 1;
	end


	local Position = nil

	if options.DockPos == "Bottom" then
		Position = UDim2.new(0, 0,0, 350)
	elseif options.DockPos == "Top" then
		Position = UDim2.new(0, 0,0,-100)
	else
		Position = UDim2.new(0, 0,0, 350)
	end

	-- Navigation
	do
		GUI["b"] = Instance.new("Frame", GUI["2"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Theme.DockColor;
		GUI["b"]["Size"] = UDim2.new(1, 0, 0, 60);
		GUI["b"]["Position"] = Position;
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["Name"] = [[Navigation]];
		GUI["b"]["BackgroundTransparency"] = 0.05


		-- StarterGui.UxiLib.Main.Navigation.Button Holder
		GUI["c"] = Instance.new("Frame", GUI["b"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["Size"] = UDim2.new(0, 400, 0, 60);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Name"] = [[Button Holder]];
		GUI["c"]["BackgroundTransparency"] = 1;


		-- StarterGui.UxiLib.Main.Navigation.Button Holder.UIPadding
		GUI["d"] = Instance.new("UIPadding", GUI["c"]);
		GUI["d"]["PaddingTop"] = UDim.new(0, 7);
		GUI["d"]["PaddingLeft"] = UDim.new(0, 10);
		GUI["d"]["PaddingBottom"] = UDim.new(0, 5);


		-- StarterGui.UxiLib.Main.Navigation.Button Holder.UIListLayout
		GUI["e"] = Instance.new("UIListLayout", GUI["c"]);
		GUI["e"]["Padding"] = UDim.new(0, 10);
		GUI["e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		GUI["e"]["FillDirection"] = Enum.FillDirection.Horizontal;

		--Ui corner
		GUI["13"] = Instance.new("UICorner", GUI["b"]);
		GUI["13"]["CornerRadius"] = UDim.new(1, 0);

	end

	function GUI:CreateTab(options)
		options = Library:Validate({
			Icon = "rbxassetid://121088157314410"
		},options or {})

		local Tab = {
			Hover = false,
			Active = false,

		}

		--render
		do
			-- StarterGui.UxiLib.Main.Navigation.Button Holder.Inactive
			Tab["11"] = Instance.new("ImageLabel",GUI["c"]);
			Tab["11"]["BorderSizePixel"] = 0;
			Tab["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["11"]["ImageColor3"] = addColors(Theme.TextColor, Color3.fromRGB(-50,-50,-50));
			Tab["11"]["Image"] = options.Icon;
			Tab["11"]["Size"] = UDim2.new(0, 45, 0, 45);
			Tab["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["11"]["BackgroundTransparency"] = 1;
			Tab["11"]["Name"] = [[Inactive]];


			-- StarterGui.UxiLib.Main.Navigation.Button Holder.Inactive.UICorner
			Tab["12"] = Instance.new("UICorner", Tab["11"]);
			Tab["12"]["CornerRadius"] = UDim.new(0, 20);



			Tab["15"] = Instance.new("ScrollingFrame", GUI["14"]);
			Tab["15"]["BorderSizePixel"] = 0;
			Tab["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["15"]["Name"] = [[HomeTab]];
			Tab["15"]["Selectable"] = false;
			Tab["15"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["15"]["ScrollBarThickness"] = 0;
			Tab["15"]["BackgroundTransparency"] = 1;
			Tab["15"]["Visible"] = true;

			Tab["99"] = Instance.new("UIPadding", Tab["15"]);
			Tab["99"]["PaddingTop"] = UDim.new(0, 6);
			Tab["99"]["PaddingRight"] = UDim.new(0, 10);
			Tab["99"]["PaddingLeft"] = UDim.new(0, 10);
			Tab["99"]["PaddingBottom"] = UDim.new(0, 6);

			Tab["88"] = Instance.new("UIListLayout", Tab["15"]);
			Tab["88"]["Padding"] = UDim.new(0, 8);
			Tab["88"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		do
			local ActivatedColor = Theme.TextColor
			local HoveredColor = Theme.TextColor
			local InactivatedColor = Theme.TextColor

			--methods
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end
					Tab.Active = true
					Library:tween(Tab["11"], {ImageColor3 = ActivatedColor},0.1)
					Tab["15"].Visible = true

					GUI.CurrentTab = Tab
				end
			end

			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab.Hover = false
					if Theme.isDark == false then Library:tween(Tab["11"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(80,80,80))},0.1) else Library:tween(Tab["11"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-80,-80,-80))},0.1)end

					Tab["15"].Visible = false
				end
			end

			Tab:Activate()

			--logic
			do
				Tab["11"].MouseEnter:Connect(function()
					Tab.Hover = true
					if not Tab.Active then
						if Theme.isDark == false then Library:tween(Tab["11"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(40,40,40))},0.1) else Library:tween(Tab["11"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-40,-40,-40))},0.1)end
					end


				end)

				Tab["11"].MouseLeave:Connect(function()
					Tab.Hover = false

					if not Tab.Active then
						if Theme.isDark == false then Library:tween(Tab["11"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(80,80,80))},0.1) else Library:tween(Tab["11"], {ImageColor3 = addColors(InactivatedColor, Color3.fromRGB(-80,-80,-80))},0.1)end
					end

				end)

				uis.InputBegan:Connect(function(input,gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Tab.Hover then
							Tab:Activate()
						end
					end
				end)


			end

			--Exit


			if GUI.CurrentTab == nil then
				Tab:Activate()
			end


			function Tab:Button(options)
				options = Library:Validate({
					Name = "Button",
					callback = function() end
				},options or {})

				local Button = {
					Hover = false,
					MouseDown = false
				}

				--make button
				do

					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button
					Button["16"] = Instance.new("TextButton", Tab["15"])
					Button["16"]["BorderSizePixel"] = 0
					Button["16"]["BackgroundColor3"] = Theme.ButtonColor
					Button["16"]["AnchorPoint"] = Vector2.new(0.5, 0)
					Button["16"]["Size"] = UDim2.new(1, 0, 0, 40)
					Button["16"]["Position"] = UDim2.new(0.5, 0, 0, 0)
					Button["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
					Button["16"]["Name"] = "Button"
					Button["16"].AutoButtonColor = false
					Button["16"].TextTransparency = 1


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UICorner
					Button["X"] = Instance.new("UICorner", Button["16"]);



					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UIStroke
					Button["18"] = Instance.new("UIStroke", Button["16"]);
					Button["18"]["Color"] = Theme.ButtonInputStrokeColor;
					Button["18"]["Thickness"] = 2
					Button["18"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.Title
					Button["19"] = Instance.new("TextLabel", Button["16"]);
					Button["19"]["BorderSizePixel"] = 0;
					Button["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Button["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["19"]["TextSize"] = 20;
					Button["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Button["19"]["TextColor3"] = Theme.TextColor;
					Button["19"]["BackgroundTransparency"] = 1;
					Button["19"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["19"]["Text"] = options.Name;
					Button["19"]["Name"] = [[Title]];


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UIPadding
					Button["1x"] = Instance.new("UIPadding", Button["16"]);
					Button["1x"]["PaddingTop"] = UDim.new(0, 6);
					Button["1x"]["PaddingRight"] = UDim.new(0, 8);
					Button["1x"]["PaddingLeft"] = UDim.new(0, 6);
					Button["1x"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.Icon
					Button["1b"] = Instance.new("ImageLabel", Button["16"]);
					Button["1b"]["BorderSizePixel"] = 0;
					Button["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["1b"]["AnchorPoint"] = Vector2.new(1, 1);
					Button["1b"]["Image"] = [[rbxassetid://80129646188870]];
					Button["1b"]["ImageColor3"] = Theme.TextColor;
					Button["1b"]["Size"] = UDim2.new(0, 25, 0, 25);
					Button["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["1b"]["BackgroundTransparency"] = 1;
					Button["1b"]["Name"] = [[Icon]];
					Button["1b"]["Position"] = UDim2.new(1, 0, 1, 0);
				end

				Button["16"].MouseEnter:Connect(function()
					if Theme.isDark then
						Library:tween(Button["18"], {Color = addColors(Theme.ButtonInputStrokeColor, Color3.fromRGB(15,15,15))},0.3)
					else
						Library:tween(Button["18"], {Color = addColors(Theme.ButtonInputStrokeColor, Color3.fromRGB(-15,-15,-15))},0.3)
					end


				end)

				Button["16"].MouseLeave:Connect(function()

					if not Button.MouseDown then
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor})
					end
				end)

				Button["16"].MouseButton1Down:Connect(function()
					Button.MouseDown = true
					Library:tween(Button["16"], {BackgroundColor3 = addColors(Theme.ButtonColor, Color3.fromRGB(30,30,30))},0.3)
					Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.5)
					options.callback()
				end)

				Button["16"].MouseButton1Up:Connect(function()
					Button.MouseDown = false
					if Button.Hover then
						Library:tween(Button["16"], {BackgroundColor3 = Theme.ButtonColor},0.3)
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.3)
					else
						Library:tween(Button["16"], {BackgroundColor3 = Theme.ButtonColor},0.3)
						Library:tween(Button["18"], {Color = Theme.ButtonInputStrokeColor},0.3)
					end
				end)

				--Methods
				do
					function Button:SetText(text)
						Button["19"].Text = text
					end

					function Button:SetCallBack(fn)
						options.callback = fn
					end
				end

				return Button

			end

			function Tab:Toggle(options)
				options = Library:Validate({
					Name = "Toogle",
					callback = function() end
				},options or {})

				local Toggle = {
					Hover = false,
					MouseDown = false,
					State = false
				}

				do
					Toggle["1t"] = Instance.new("Frame", Tab["15"]);
					Toggle["1t"]["BorderSizePixel"] = 0;
					Toggle["1t"]["BackgroundColor3"] = Theme.ToggleColor;
					Toggle["1t"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Toggle["1t"]["Size"] = UDim2.new(1, 0, 0, 40);
					Toggle["1t"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Toggle["1t"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1t"]["Name"] = [[ToggleInactive]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UICorner
					Toggle["dx"] = Instance.new("UICorner", Toggle["1t"]);

					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UIStroke
					Toggle["3x"] = Instance.new("UIStroke", Toggle["1t"]);
					Toggle["3x"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					Toggle["3x"]["Color"] = Theme.ButtonInputStrokeColor;
					Toggle["3x"]["Thickness"] = 2;


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.Title
					Toggle["2x"] = Instance.new("TextLabel", Toggle["1t"]);
					Toggle["2x"]["BorderSizePixel"] = 0;
					Toggle["2x"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["2x"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2x"]["TextSize"] = 20;
					Toggle["2x"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["2x"]["TextColor3"] = Theme.TextColor;
					Toggle["2x"]["BackgroundTransparency"] = 1;
					Toggle["2x"]["Size"] = UDim2.new(1, -120, 1, 0);
					Toggle["2x"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["2x"]["Text"] = options.Name;
					Toggle["2x"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.UIPadding
					Toggle["4x"] = Instance.new("UIPadding", Toggle["1t"]);
					Toggle["4x"]["PaddingTop"] = UDim.new(0, 6);
					Toggle["4x"]["PaddingRight"] = UDim.new(0, 8);
					Toggle["4x"]["PaddingLeft"] = UDim.new(0, 6);
					Toggle["4x"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder
					Toggle["1z"] = Instance.new("Frame", Toggle["1t"]);
					Toggle["1z"]["BorderSizePixel"] = 0;
					Toggle["1z"]["BackgroundColor3"] = Theme.ToggleCheckColorInactive;
					Toggle["1z"]["AnchorPoint"] = Vector2.new(1, 0);
					Toggle["1z"]["Size"] = UDim2.new(0, 20, 0, 20);
					Toggle["1z"]["Position"] = UDim2.new(1, -5, 0, 5);
					Toggle["1z"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1z"]["Name"] = [[CheckMarkHolder]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.checkmark
					Toggle["1e"] = Instance.new("ImageLabel", Toggle["1z"]);
					Toggle["1e"]["BorderSizePixel"] = 0;
					Toggle["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["1e"]["ImageTransparency"] = 1;
					Toggle["1e"]["Image"] = [[rbxassetid://129387373527527]];
					Toggle["1e"]["ImageColor3"]  = Theme.TextColor;
					Toggle["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
					Toggle["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["1e"]["BackgroundTransparency"] = 1;
					Toggle["1e"]["Name"] = [[checkmark]];


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.UIStroke
					Toggle["1v"] = Instance.new("UIStroke", Toggle["1z"]);
					Toggle["1v"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.CheckMarkHolder.UICorner
					Toggle["1r"] = Instance.new("UICorner", Toggle["1z"]);
					Toggle["1r"]["CornerRadius"] = UDim.new(0, 4);
				end
				--methods
				do
					function Toggle:UpdateToggle(b)
						if b == nil then
							Toggle.State = not Toggle.State
						else
							Toggle.State = b
						end

						if Toggle.State then
							Library:tween(Toggle["1z"], {BackgroundColor3 = Theme.ToggleCheckColor},0.1)
							Library:tween(Toggle["1e"], {ImageTransparency = 0},0.1)
						else
							Library:tween(Toggle["1z"], {BackgroundColor3 = Theme.ToggleCheckColorInactive},0.1)
							Library:tween(Toggle["1e"], {ImageTransparency = 1},0.1)
						end

						options.callback(Toggle.State)
					end



				end
				--logic
				do
					Toggle["1t"].MouseEnter:Connect(function()
						Toggle.Hover = true

						Library:tween(Toggle["3x"], {Color =Theme.ButtonInputStrokeColor},0.5)

					end)

					Toggle["1t"].MouseLeave:Connect(function()
						Toggle.Hover = false

						if not Toggle.MouseDown then
							Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Toggle.MouseDown = true
							Library:tween(Toggle["1t"], {BackgroundColor3 =  addColors(Theme.ToggleColor, Color3.fromRGB(30,30,30))},0.5)
							Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
							Toggle:UpdateToggle()
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Toggle.MouseDown = false
							if Toggle.Hover then
								Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
								Library:tween(Toggle["1t"], {BackgroundColor3 = Theme.ToggleColor},0.5)
							else
								Library:tween(Toggle["1t"], {BackgroundColor3 = Theme.ToggleColor},0.5)
								Library:tween(Toggle["3x"], {Color = Theme.ButtonInputStrokeColor},0.5)
							end
						end

					end)

				end
				return Toggle
			end

			function Tab:Label(options)
				options = Library:Validate({
					Name = "Label"
				},options or {})

				local Label = {}

				--render
				do
					Label["36"] = Instance.new("Frame", Tab["15"]);
					Label["36"]["BorderSizePixel"] = 0;
					Label["36"]["BackgroundColor3"] = Theme.LabelColor;
					Label["36"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Label["36"]["Size"] = UDim2.new(1, 0, 0, 40);
					Label["36"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Label["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["36"]["Name"] = [[Label]];


					-- StarterGui.s.Main.MainContent.HomeTab.Label.UICorner
					Label["37"] = Instance.new("UICorner", Label["36"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Label.UIStroke
					Label["38"] = Instance.new("UIStroke", Label["36"]);
					Label["38"]["Thickness"] = 2;
					Label["38"]["Color"] = Theme.LabelInputStrokeColor;


					-- StarterGui.s.Main.MainContent.HomeTab.Label.Title
					Label["39"] = Instance.new("TextLabel", Label["36"]);
					Label["39"]["BorderSizePixel"] = 0;
					Label["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Label["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["39"]["TextSize"] = 20;
					Label["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Label["39"]["TextColor3"] = Theme.TextColor;
					Label["39"]["BackgroundTransparency"] = 1;
					Label["39"]["Size"] = UDim2.new(1, 0, 1, 0);
					Label["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["39"]["Text"] = options.Name;
					Label["39"]["Name"] = [[Title]];
					Label["39"]["TextWrapped"] = true;
					Label["39"]["TextYAlignment"] = Enum.TextYAlignment.Top;

					-- StarterGui.s.Main.MainContent.HomeTab.Label.UIPadding
					Label["3a"] = Instance.new("UIPadding", Label["36"]);
					Label["3a"]["PaddingTop"] = UDim.new(0, 6);
					Label["3a"]["PaddingRight"] = UDim.new(0, 8);
					Label["3a"]["PaddingLeft"] = UDim.new(0, 6);
					Label["3a"]["PaddingBottom"] = UDim.new(0, 8);
				end


				--methods
				function Label:SetText(text)
					options.Name = text
					Label:_update()
				end

				function Label:_update()
					Label["39"]["Text"] = options.Name

					Label["39"].Size = UDim2.new(Label["39"].Size.X.Scale, Label["39"].Size.X.Offset, 0, math.huge)
					Label["39"].Size = UDim2.new(Label["39"].Size.X.Scale, Label["39"].Size.X.Offset, 0, Label["39"].TextBounds.Y)
					Library:tween(Label["36"], {Size = UDim2.new(Label["36"].Size.X.Scale, Label["36"].Size.X.Offset, 0,Label["39"].TextBounds.Y + 14)},0.5)

				end


				Label:_update()
				return Label
			end

			function Tab:Slider(options)
				options = Library:Validate({
					Name = "Slider",
					min = 0,
					max = 100,
					Default = 50,
					callback = function(v) end
				},options or {})

				local Slider = {
					MouseDown = false,
					Hover = false,
					Connection = nil

				}
				--make slider
				do

					Slider["2a"] = Instance.new("Frame", Tab["15"]);
					Slider["2a"]["BorderSizePixel"] = 0;
					Slider["2a"]["BackgroundColor3"] = Theme.SliderColor;
					Slider["2a"]["AnchorPoint"] = Vector2.new(0.5, 0);
					Slider["2a"]["Size"] = UDim2.new(1, 0, 0, 50);
					Slider["2a"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					Slider["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["2a"]["Name"] = [[Slider]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.UICorner
					Slider["2b"] = Instance.new("UICorner", Slider["2a"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Slider.UIStroke
					Slider["2c"] = Instance.new("UIStroke", Slider["2a"]);
					Slider["2c"].Color = Color3.fromRGB(82,82,82)
					Slider["2c"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					Slider["2c"].Thickness = 2

					-- StarterGui.s.Main.MainContent.HomeTab.Slider.Title
					Slider["2d"] = Instance.new("TextLabel", Slider["2a"]);
					Slider["2d"]["BorderSizePixel"] = 0;
					Slider["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["2d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["2d"]["TextSize"] = 20;
					Slider["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["2d"]["TextColor3"] =Theme.TextColor;
					Slider["2d"]["BackgroundTransparency"] = 1;
					Slider["2d"]["Size"] = UDim2.new(0, 310, 1, -5);
					Slider["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["2d"]["Text"] = options.Name;
					Slider["2d"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.UIPadding
					Slider["2e"] = Instance.new("UIPadding", Slider["2a"]);
					Slider["2e"]["PaddingTop"] = UDim.new(0, 6);
					Slider["2e"]["PaddingRight"] = UDim.new(0, 8);
					Slider["2e"]["PaddingLeft"] = UDim.new(0, 6);
					Slider["2e"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.Value
					Slider["2f"] = Instance.new("TextLabel", Slider["2a"]);
					Slider["2f"]["BorderSizePixel"] = 0;
					Slider["2f"]["TextYAlignment"] = Enum.TextYAlignment.Center;
					Slider["2f"]["TextScaled"] = true;
					Slider["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["2f"]["TextSize"] = 20;
					Slider["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["2f"]["TextColor3"] = Theme.TextColor;
					Slider["2f"]["BackgroundTransparency"] = 1;
					Slider["2f"]["AnchorPoint"] = Vector2.new(1, 0);
					Slider["2f"]["Size"] = UDim2.new(0, 44, 0, 24);
					Slider["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["2f"]["Text"] = tostring(options.Default);
					Slider["2f"]["Name"] = [[Value]];
					Slider["2f"]["Position"] = UDim2.new(1, 0, 0, 0);


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack
					Slider["30"] = Instance.new("Frame", Slider["2a"]);
					Slider["30"]["BorderSizePixel"] = 0;
					Slider["30"]["BackgroundColor3"] = Theme.SliderBackColor;
					Slider["30"]["AnchorPoint"] = Vector2.new(0, 1);
					Slider["30"]["Size"] = UDim2.new(1, 0, 0, 13);
					Slider["30"]["Position"] = UDim2.new(0, 0, 1, 0);
					Slider["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["30"]["Name"] = [[SliderBack]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.UICorner
					Slider["31"] = Instance.new("UICorner", Slider["30"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.UIStroke
					Slider["32"] = Instance.new("UIStroke", Slider["30"]);
					Slider["32"]["Color"] = Color3.fromRGB(73, 73, 73);


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.Fill
					Slider["33"] = Instance.new("Frame", Slider["30"]);
					Slider["33"]["BorderSizePixel"] = 0;
					Slider["33"]["BackgroundColor3"] = Theme.SliderFillColor;
					Slider["33"]["Size"] = UDim2.new(0.5, 0, 1, 0);
					Slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["33"]["Name"] = [[Fill]];


					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.Fill.UICorner
					Slider["34"] = Instance.new("UICorner", Slider["33"]);



					-- StarterGui.s.Main.MainContent.HomeTab.Slider.SliderBack.Fill.UIStroke
					Slider["35"] = Instance.new("UIStroke", Slider["33"]);
					Slider["35"]["Color"] = Color3.fromRGB(73, 73, 73);
				end


				do  --Methods

					function Slider:SetValue(v)
						if v ==  nil then
							local precentage = math.clamp((mouse.X - Slider["30"].AbsolutePosition.X) / (Slider["30"].AbsoluteSize.X), 0, 1)
							local value = math.floor(((options.max - options.min) * precentage) + options.min)

							Slider["2f"].Text = tostring(value)
							Library:tween(Slider["33"], {Size =UDim2.fromScale(precentage,1)},.6, Enum.EasingStyle.Back,Enum.EasingDirection.Out)
						else
							Slider["2f"].Text = tostring(v)

							Library:tween(Slider["33"], {Size =UDim2.fromScale(((v -options.min) / (options.max - options.min)),1) },1)
						end
						options.callback(Slider:GetValue())
					end

					function Slider:GetValue()
						return tonumber(Slider["2f"].Text)
					end

					--function Slider:_Checkvalue()
					--	if options.Default > options.max  then
					--		Slider:SetValue()
					--	end
					--end	

				end

				do -- logic
					Slider["2a"].MouseEnter:Connect(function()
						Slider.Hover = true

						Library:tween(Slider["2c"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
						Library:tween(Slider["32"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
						Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
					end)

					Slider["2a"].MouseLeave:Connect(function()
						Slider.Hover = false

						if not Slider.MouseDown then
							Library:tween(Slider["2c"], {Color = Theme.SliderStrokeAll},0.5)
							Library:tween(Slider["32"], {Color = Theme.SliderStrokeAll},0.5)
							Library:tween(Slider["35"], {Color = Theme.SliderStrokeAll},0.5)
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
							Slider.MouseDown = true


							Library:tween(Slider["2a"], {BackgroundColor3 = addColors(Theme.SliderColor, Color3.fromRGB(20,20,20))},0.5)
							Library:tween(Slider["2c"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(68,68,68))},0.5)
							Library:tween(Slider["32"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(68,68,68))},0.5)
							Library:tween(Slider["35"], {Color = addColors(Theme.SliderStrokeAll,Color3.fromRGB(68,68,68))},0.5)

							if  not Slider.Connection then
								Slider.Connection = runServices.RenderStepped:Connect(function()
									Slider:SetValue()
								end)
							end
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Slider.MouseDown = false
							if Slider.Hover then
								Library:tween(Slider["2a"], {BackgroundColor3 = Theme.SliderColor},0.5)
								Library:tween(Slider["2c"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
								Library:tween(Slider["32"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
								Library:tween(Slider["35"], {Color =  addColors(Theme.SliderStrokeAll,Color3.fromRGB(38,38,38))},0.5)
							else
								Library:tween(Slider["2a"], {BackgroundColor3 = Theme.SliderColor},0.5)
								Library:tween(Slider["2c"], {Color = Theme.SliderStrokeAll},0.5)
								Library:tween(Slider["32"], {Color = Theme.SliderStrokeAll},0.5)
								Library:tween(Slider["35"], {Color = Theme.SliderStrokeAll},0.5)
							end


							if Slider.Connection then Slider.Connection:Disconnect() end
							Slider.Connection = nil
						end

					end)


				end
				return Slider
			end

			function Tab:DropDown(options)

				options = Library:Validate({
					Name = "DropDown",
					callback = function(v) end,
					items = {}
				},options or {})

				local DropDown = {
					Items = {
						["id"] = {
							--instance = {},
							"value"
						},

					},
					open = false,
					MouseDown = false,
					Hover = false,
					hoveringItem = false,
					--Connection = nil

				}
				--make Dropdown
				do
					DropDown["3b"] = Instance.new("TextButton", Tab["15"]);
					DropDown["3b"]["BorderSizePixel"] = 0;
					DropDown["3b"]["BackgroundColor3"] = Theme.DropDownColor;
					DropDown["3b"]["AnchorPoint"] = Vector2.new(0.5, 0);
					DropDown["3b"]["ClipsDescendants"] = true;
					DropDown["3b"]["Size"] = UDim2.new(1, 0, 0, 40);
					DropDown["3b"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					DropDown["3b"]["BorderColor3"] = Theme.DropDownColor
					DropDown["3b"]["Name"] = [[DropDown]];
					DropDown["3b"]["TextTransparency"] = 1
					DropDown["3b"]["TextStrokeTransparency"] = 1
					DropDown["3b"]["AutoButtonColor"] = false


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UICorner
					DropDown["3c"] = Instance.new("UICorner", DropDown["3b"]);



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIStroke
					DropDown["3d"] = Instance.new("UIStroke", DropDown["3b"]);
					DropDown["3d"].Color = Theme.DropDownInputStrokeColor;
					DropDown["3d"].Thickness = 2;
					DropDown["3d"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					--DropDown["3d"].Thickness = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Title
					DropDown["3e"] = Instance.new("TextLabel", DropDown["3b"]);
					DropDown["3e"]["BorderSizePixel"] = 0;
					DropDown["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					DropDown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["3e"]["TextSize"] = 20;
					DropDown["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					DropDown["3e"]["TextColor3"] = Theme.TextColor;
					DropDown["3e"]["BackgroundTransparency"] = 1;
					DropDown["3e"]["Size"] = UDim2.new(1, -26, 0, 25);
					DropDown["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["3e"]["Text"] = options.Name;
					DropDown["3e"]["Name"] = [[Title]];


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIPadding
					DropDown["3f"] = Instance.new("UIPadding", DropDown["3b"]);
					DropDown["3f"]["PaddingTop"] = UDim.new(0, 6);
					DropDown["3f"]["PaddingRight"] = UDim.new(0, 8);
					DropDown["3f"]["PaddingLeft"] = UDim.new(0, 6);
					DropDown["3f"]["PaddingBottom"] = UDim.new(0, 6);


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Icon
					DropDown["40"] = Instance.new("ImageLabel", DropDown["3b"]);
					DropDown["40"]["BorderSizePixel"] = 0;
					DropDown["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["40"]["ScaleType"] = Enum.ScaleType.Fit;
					DropDown["40"]["AnchorPoint"] = Vector2.new(1, 1);
					DropDown["40"]["Image"] = [[rbxassetid://136506872237179]];
					DropDown["40"]["ImageColor3"]  = Theme.TextColor;
					DropDown["40"]["Size"] = UDim2.new(0, 30, 0, 30);
					DropDown["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["40"]["BackgroundTransparency"] = 1;
					DropDown["40"]["Name"] = [[Icon]];
					DropDown["40"]["Position"] = UDim2.new(1, 0, 0, 30);


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder
					DropDown["41"] = Instance.new("Frame", DropDown["3b"]);
					DropDown["41"]["Visible"] = false;
					DropDown["41"]["BorderSizePixel"] = 0;
					DropDown["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["41"]["Size"] = UDim2.new(1, 0, 1, -24);
					DropDown["41"]["Position"] = UDim2.new(0, 0, 0, 30);
					DropDown["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["41"]["Name"] = [[OptionHolder]];
					DropDown["41"]["BackgroundTransparency"] = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.UIListLayout
					DropDown["42"] = Instance.new("UIListLayout", DropDown["41"]);
					DropDown["42"]["Padding"] = UDim.new(0, 9);
					DropDown["42"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption	

				end
				--logic
				do
					function DropDown:Add(id,value)

						local item = {
							Hover = false,
							MouseDown = false
						}
						DropDown.Items[id] = {
							instance = {},
							value = value
						}
						DropDown.Items[id].instance["43"] = Instance.new("TextButton", DropDown["41"]);
						DropDown.Items[id].instance["43"]["TextWrapped"] = true;
						DropDown.Items[id].instance["43"]["BorderSizePixel"] = 0;
						DropDown.Items[id].instance["43"]["BackgroundColor3"] = Theme.DropDownOptionsColor;
						DropDown.Items[id].instance["43"]["TextSize"] = 18;
						DropDown.Items[id].instance["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						DropDown.Items[id].instance["43"]["TextColor3"] = Theme.TextColor;
						DropDown.Items[id].instance["43"]["Size"] = UDim2.new(1, 0, 0, 28);
						DropDown.Items[id].instance["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						DropDown.Items[id].instance["43"]["Text"] = id;
						DropDown.Items[id].instance["43"]["Name"] = [[inactiveOption]];
						DropDown.Items[id].instance["43"]["AutoButtonColor"] = false;

						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UIStroke
						DropDown.Items[id].instance["44"] = Instance.new("UIStroke", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						DropDown.Items[id].instance["44"]["Color"] = Theme.DropDownOptionsInputStrokeColor;


						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UICorner
						DropDown.Items[id].instance["45"] = Instance.new("UICorner", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["45"]["CornerRadius"] = UDim.new(0, 10);						


						DropDown.Items[id].instance["43"].MouseEnter:Connect(function()
							if Theme.isDark then
								Library:tween(DropDown.Items[id].instance["44"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(20,20,20))}, 0.3, Enum.EasingStyle.Quint)
							else
								Library:tween(DropDown.Items[id].instance["44"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(-20,-20,-20))}, 0.3, Enum.EasingStyle.Quint)
							end

						end)

						DropDown.Items[id].instance["43"].MouseLeave:Connect(function()
							Library:tween(DropDown.Items[id].instance["44"], {Color = Theme.DropDownInputStrokeColor}, 0.3, Enum.EasingStyle.Quint)
						end)

						DropDown.Items[id].instance["43"].MouseButton1Down:Connect(function()
							Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = addColors(Theme.DropDownColor, Color3.fromRGB(20,20,20))}, 0.2, Enum.EasingStyle.Quint)
							options.callback()
							DropDown:Toggle()
						end)

						DropDown.Items[id].instance["43"].MouseButton1Up:Connect(function()
							Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = Theme.DropDownColor}, 0.2, Enum.EasingStyle.Quint)
						end)

					end

					function DropDown:Remove(id)
						if DropDown.Items[id] ~= nil then
							if DropDown.Items[id].instance ~= nil then
								for i, v in pairs(DropDown.Items[id].instance) do
									v:Destroy()
								end
							end
							DropDown.Items[id] = nil
						end
					end
					function DropDown:Clear()
						for i, v in pairs(DropDown.Items) do
							DropDown:Remove(i)
						end
					end

					function DropDown:Toggle()
						if DropDown.debounce then return end
						DropDown.debounce = true

						if DropDown.open then
							Library:tween(DropDown["3b"], {Size = UDim2.new(1,0,0,40)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, function()
								DropDown.open = false
								
								DropDown.debounce = false
							end)
							wait(0.25)
							DropDown["41"].Visible = false
						else
							local count = 0
							for i,v in pairs(DropDown.Items) do
								if v ~= nil then
									count += 1
								end
							end
							
							Library:tween(DropDown["3b"], {Size = UDim2.new(1,0,0,40 +(count *(68-40)) + 14)}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, function()
								DropDown.open = true
								DropDown.debounce = false
							end)
							DropDown["41"].Visible = true
						end
					end
				end

				--METHODS
				do


					DropDown["3b"].MouseEnter:Connect(function()
						if Theme.isDark then
							Library:tween(DropDown["3d"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(20,20,20))}, 0.3, Enum.EasingStyle.Quint)
						else
							Library:tween(DropDown["3d"], {Color = addColors(Theme.DropDownInputStrokeColor, Color3.fromRGB(-20,-20,-20))}, 0.3, Enum.EasingStyle.Quint)
						end

					end)

					DropDown["3b"].MouseLeave:Connect(function()
						Library:tween(DropDown["3d"], {Color = Theme.DropDownInputStrokeColor}, 0.3, Enum.EasingStyle.Quint)
					end)

					DropDown["3b"].MouseButton1Down:Connect(function()
						Library:tween(DropDown["3b"], {BackgroundColor3 = addColors(Theme.DropDownColor, Color3.fromRGB(20,20,20))}, 0.2, Enum.EasingStyle.Quint)

					end)

					DropDown["3b"].MouseButton1Up:Connect(function()
						Library:tween(DropDown["3b"], {BackgroundColor3 = Theme.DropDownColor}, 0.2, Enum.EasingStyle.Quint)
						options.callback()
						if not DropDown.hoveringItem then
							DropDown:Toggle()
						end
					end)


				end
				return DropDown
			end

			function Tab:CreatePopUp(options)
				options = Library:Validate({
					ButtonLeftText = "Left_Button",
					ButtonRightText = "Right_Button",
					TitleText = "Tilte",
					Text = "Text",
					callbackButtonRight = function() end,
					callbackButtonLeft = function() end,

				},options or {})

				do
					local PopUp = Instance.new("Frame")
					local PopUpUiCorner = Instance.new("UICorner")
					local PopUpUIStroke = Instance.new("UIStroke")
					local ButtonHolder = Instance.new("Frame")
					local Button1 = Instance.new("TextButton")
					local Button1UICorner = Instance.new("UICorner")
					local UIListLayout = Instance.new("UIListLayout")
					local Button2 = Instance.new("TextButton")
					local UICorner = Instance.new("UICorner")
					local TextHolder = Instance.new("Frame")
					local Maintext = Instance.new("TextLabel")
					local MainTextUICorner = Instance.new("UICorner")
					local MainTextUIPadding = Instance.new("UIPadding")
					local Title = Instance.new("TextLabel")
					local TitleUICorner = Instance.new("UICorner")
					local TitleUIPadding = Instance.new("UIPadding")
					local Seperator = Instance.new("Frame")

					-- Properties

					PopUp.Name = "PopUp"
					PopUp.Parent = GUI["14"]
					PopUp.AnchorPoint = Vector2.new(0.5, 0.5)
					PopUp.BackgroundColor3 = Theme.PopUpColor
					PopUp.BorderColor3 = Color3.fromRGB(0, 0, 0)
					PopUp.BorderSizePixel = 0
					PopUp.Position = UDim2.new(0.5, 0, 0.5, 0)
					PopUp.Size = UDim2.new(0, 350, 0, 225)
					PopUp.Transparency = 1
					Library:tween(PopUp, {Transparency = 0.02})

					PopUpUIStroke.Name = "PopUpUIPadding"
					PopUpUIStroke.Parent = PopUp
					PopUpUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					PopUpUIStroke.Color = addColors(Theme.PopUpColor, Color3.fromRGB(20,20,20))
					PopUpUIStroke.LineJoinMode = Enum.LineJoinMode.Round
					PopUpUIStroke.Thickness = 0
					Library:tween(PopUpUIStroke, {Thickness = 2})

					Seperator.Name = "Seperator"
					Seperator.Parent = PopUp
					Seperator.AnchorPoint = Vector2.new(0, 1)
					Seperator.BackgroundColor3 = addColors(Theme.PopUpColor, Color3.fromRGB(10,10,10))
					Seperator.BackgroundTransparency = 1.000
					Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Seperator.BorderSizePixel = 0
					Seperator.Position = UDim2.new(0, 0, 0, 40)
					Seperator.Size = UDim2.new(1, 0, 0, 5)
					Seperator.Transparency = 1

					Library:tween(Seperator, {Transparency = 0})

					PopUpUiCorner.CornerRadius = UDim.new(0.1, 10)
					PopUpUiCorner.Name = "PopUpUiCorner"
					PopUpUiCorner.Parent = PopUp

					ButtonHolder.Name = "Button Holder"
					ButtonHolder.Parent = PopUp
					ButtonHolder.AnchorPoint = Vector2.new(0, 1)
					ButtonHolder.BackgroundColor3 = Theme.PopUpButtonColor
					ButtonHolder.BackgroundTransparency = 1.000
					ButtonHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
					ButtonHolder.BorderSizePixel = 0
					ButtonHolder.Position = UDim2.new(0, 0, 1, -10)
					ButtonHolder.Size = UDim2.new(1, 0, 0.25999999, 0)

					Button1.Name = "Button1"
					Button1.Parent = ButtonHolder
					Button1.AnchorPoint = Vector2.new(0.5, 1)
					Button1.BackgroundColor3 = Theme.PopUpButtonColor
					Button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button1.BorderSizePixel = 0
					Button1.Position = UDim2.new(0.5, -30, 1, -10)
					Button1.Size = UDim2.new(0, 50, 0, 50)
					Button1.Font = Enum.Font.Ubuntu
					Button1.Text = options.ButtonLeftText
					Button1.TextColor3 = Theme.TextColor
					Button1.TextSize = 20.000
					Button1.TextWrapped = true
					Button1.Transparency = 1
					Library:tween(Button1, {Transparency = 0})

					Button1UICorner.CornerRadius = UDim.new(0.100000001, 8)
					Button1UICorner.Name = "Button1UICorner"
					Button1UICorner.Parent = Button1

					UIListLayout.Parent = ButtonHolder
					UIListLayout.FillDirection = Enum.FillDirection.Horizontal
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					UIListLayout.Padding = UDim.new(0, 10)

					Button2.Name = "Button2"
					Button2.Parent = ButtonHolder
					Button2.AnchorPoint = Vector2.new(0.5, 1)
					Button2.BackgroundColor3 = Theme.PopUpButtonColor
					Button2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Button2.BorderSizePixel = 0
					Button2.Position = UDim2.new(0.5, -30, 1, -10)
					Button2.Size = UDim2.new(0, 50, 0, 50)
					Button2.Font = Enum.Font.Ubuntu
					Button2.Text = options.ButtonRightText
					Button2.TextColor3 = Theme.TextColor
					Button2.TextSize = 20.000
					Button2.TextWrapped = true
					Button2.Transparency = 1
					Library:tween(Button2, {Transparency = 0})

					UICorner.CornerRadius = UDim.new(0.100000001, 8)
					UICorner.Parent = Button2

					TextHolder.Name = "TextHolder"
					TextHolder.Parent = PopUp
					TextHolder.BackgroundColor3 = Color3.fromRGB(12, 20, 27)
					TextHolder.BackgroundTransparency = 1.000
					TextHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextHolder.BorderSizePixel = 0
					TextHolder.Size = UDim2.new(1, 0, 0.649999976, 0)

					Maintext.Name = "Main text"
					Maintext.Parent = TextHolder
					Maintext.BackgroundColor3 = Theme.TextColor
					Maintext.BackgroundTransparency = 1.000
					Maintext.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Maintext.BorderSizePixel = 0
					Maintext.Position = UDim2.new(0, 0, 0.289999992, 0)
					Maintext.Size = UDim2.new(1, 0, 1.18461537, -50)
					Maintext.Font = Enum.Font.Ubuntu
					Maintext.Text = options.Text
					Maintext.TextColor3 = Theme.TextColor
					Maintext.TextSize = 21.000
					Maintext.TextWrapped = true
					Maintext.TextXAlignment = Enum.TextXAlignment.Left
					Maintext.TextYAlignment = Enum.TextYAlignment.Top

					MainTextUICorner.CornerRadius = UDim.new(0.100000001, 8)
					MainTextUICorner.Name = "MainTextUICorner"
					MainTextUICorner.Parent = Maintext

					MainTextUIPadding.Name = "MainTextUIPadding"
					MainTextUIPadding.Parent = Maintext
					MainTextUIPadding.PaddingBottom = UDim.new(0, 20)
					MainTextUIPadding.PaddingLeft = UDim.new(0, 20)
					MainTextUIPadding.PaddingRight = UDim.new(0, 20)
					MainTextUIPadding.PaddingTop = UDim.new(0, 20)

					Title.Name = "Title"
					Title.Parent = TextHolder
					Title.BackgroundColor3 = Theme.TextColor
					Title.BackgroundTransparency = 1.000
					Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Title.BorderSizePixel = 0
					Title.Size = UDim2.new(1, 0, 0, 40)
					Title.Font = Enum.Font.Ubuntu
					Title.Text = options.TitleText
					Title.TextColor3 = Theme.TextColor
					Title.TextSize = 30.000
					Title.TextWrapped = true

					TitleUICorner.CornerRadius = UDim.new(0.100000001, 8)
					TitleUICorner.Name = "TitleUICorner"
					TitleUICorner.Parent = Title

					TitleUIPadding.Name = "TitleUIPadding"
					TitleUIPadding.Parent = Title
					TitleUIPadding.PaddingBottom = UDim.new(0, 20)
					TitleUIPadding.PaddingLeft = UDim.new(0, 20)
					TitleUIPadding.PaddingRight = UDim.new(0, 20)
					TitleUIPadding.PaddingTop = UDim.new(0, 20)

					local function Destroy()
						Library:tween(PopUp, {Transparency = 1})
						Library:tween(Button1, {Transparency = 1})
						Library:tween(Button2, {Transparency = 1})
						Library:tween(Title, {Transparency = 1})
						Library:tween(Maintext, {Transparency = 1})
						Library:tween(PopUpUIStroke, {Thickness = 0})
						Library:tween(Seperator, {Transparency = 1})
						task.wait(0.3)
						PopUp:Destroy()
					end


					Button1.MouseButton1Click:Connect(function()
						options.callbackButtonLeft()
						Destroy()
					end)

					Button2.MouseButton1Click:Connect(function()
						Destroy()
						options.callbackButtonRight()
					end)

					-- Button event listeners

				end
			end
			--[[ 
			
			function Tab:TextInput(options)
				options = Library:Validate({
					PlaceHolderText = "",
					Text = "",
					Title = "",
					CallBack = function(v) print(v) end -- Default callback
				}, options or {})

				-- Create a table to store the components
				local TextInput = {}

				-- Create instances
				local TextBox = Instance.new("TextBox")
				local UICorner = Instance.new("UICorner")
				local UIPadding = Instance.new("UIPadding")
				local UiStroke = Instance.new("UIStroke")
				local Title = Instance.new("TextLabel")
				local Icon = Instance.new("ImageLabel")

				-- Properties for TextBox
				TextBox.Name = "TextInput"
				TextBox.Parent = Tab["15"]
				TextBox.BackgroundColor3 = Theme.TextInputColor
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Size = UDim2.new(1, 0, 0, 60)
				TextBox.Font = Enum.Font.Ubuntu
				TextBox.PlaceholderColor3 = addColors(Theme.TextColor, Color3.fromRGB(-50,-50,-50))
				TextBox.PlaceholderText = options.PlaceHolderText
				TextBox.Text = options.Text
				TextBox.TextColor3 = Theme.TextColor
				TextBox.TextSize = 20.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Right
				TextBox.TextYAlignment = Enum.TextYAlignment.Bottom
				TextBox.TextTruncate = Enum.TextTruncate.SplitWord

				UiStroke.Name = "PopUpUIPadding"
				UiStroke.Parent = TextBox
				UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UiStroke.Color = Theme.ButtonInputStrokeColor
				UiStroke.LineJoinMode = Enum.LineJoinMode.Round
				UiStroke.Thickness = 2

				UICorner.Parent = TextBox

				UIPadding.Parent = TextBox
				UIPadding.PaddingBottom = UDim.new(0, 8)
				UIPadding.PaddingLeft = UDim.new(0, 10)
				UIPadding.PaddingRight = UDim.new(0, 10)
				UIPadding.PaddingTop = UDim.new(0, 22)

				-- Properties for Title
				Title.Name = "Title"
				Title.Parent = TextBox
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0, 0, 0, -15)
				Title.Size = UDim2.new(0, 310, 1, -5)
				Title.Font = Enum.Font.Ubuntu
				Title.TextColor3 = Theme.TextColor
				Title.TextSize = 20.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top
				Title.Text = options.Title

				-- Properties for Icon
				Icon.Name = "Icon"
				Icon.Parent = TextBox
				Icon.BackgroundColor3 = Theme.TextColor
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(1, -23, 0, -22)
				Icon.Size = UDim2.new(0, 30, 0, 30)
				Icon.Image = "rbxassetid://138353157704539"
				Icon.ImageColor3 = Theme.TextColor

				-- Store components in the TextInput table
				TextInput.TextBox = TextBox
				TextInput.UICorner = UICorner
				TextInput.UIPadding = UIPadding
				TextInput.Title = Title
				TextInput.Icon = Icon

				-- Add the SetText function to the table
				function TextInput:SetText(Txt)
					TextBox.Text = Txt
					options.CallBack(TextBox.Text)
				end

				-- Set up the callback for text change
				TextBox.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						if TextBox.Text == nil then
							return
						else
							options.CallBack(TextBox.Text)
						end
					end
				end)
				
				return TextInput
			end
			
			]]

			function Tab:TextInput(options)
				options = Library:Validate({
					PlaceHolderText = "",
					Title = "",
					CallBack = function(v) print(v) end -- Default callback
				}, options or {})

				-- Create a table to store the components
				local TextInput = {}
				do
					TextInput["2"] = Instance.new("TextLabel", Tab["15"]);
					TextInput["2"]["Active"] = true;
					TextInput["2"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					TextInput["2"]["BorderSizePixel"] = 0;
					TextInput["2"]["BackgroundColor3"] = Theme.TextInputColor
					TextInput["2"]["TextSize"] = 20;
					TextInput["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextInput["2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextInput["2"]["Size"] = UDim2.new(1, 0, 0, 60);
					TextInput["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["2"]["Text"] = [[]];
					TextInput["2"]["Selectable"] = true;
					TextInput["2"]["Name"] = [[TextInput]];

					-- StarterGui.ScreenGui.TextInput.UICorner
					TextInput["3"] = Instance.new("UICorner", TextInput["2"]);



					-- StarterGui.ScreenGui.TextInput.UIPadding
					TextInput["4"] = Instance.new("UIPadding", TextInput["2"]);
					TextInput["4"]["PaddingTop"] = UDim.new(0, 22);
					TextInput["4"]["PaddingRight"] = UDim.new(0, 10);
					TextInput["4"]["PaddingLeft"] = UDim.new(0, 10);
					TextInput["4"]["PaddingBottom"] = UDim.new(0, 8);


					-- StarterGui.ScreenGui.TextInput.UIStroke
					TextInput["5"] = Instance.new("UIStroke", TextInput["2"]);
					TextInput["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
					TextInput["5"]["Color"] = Theme.InputStrokeColor
					TextInput["5"]["Thickness"] = 2


					-- StarterGui.ScreenGui.TextInput.Title
					TextInput["6"] = Instance.new("TextLabel", TextInput["2"]);
					TextInput["6"]["BorderSizePixel"] = 0;
					TextInput["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextInput["6"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					TextInput["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextInput["6"]["TextSize"] = 20;
					TextInput["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextInput["6"]["TextColor3"] = Theme.TextColor;
					TextInput["6"]["BackgroundTransparency"] = 1;
					TextInput["6"]["Size"] = UDim2.new(0, 310, 1, -5);
					TextInput["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["6"]["Name"] = ("TextInput " .. options.Title);
					TextInput["6"]["Position"] = UDim2.new(0, 0, 0, -15);
					TextInput["6"]["Text"] = options.Title


					-- StarterGui.ScreenGui.TextInput.Icon
					TextInput["7"] = Instance.new("ImageLabel", TextInput["2"]);
					TextInput["7"]["BorderSizePixel"] = 0;
					TextInput["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextInput["7"]["Image"] = [[rbxassetid://138353157704539]];
					TextInput["7"]["Size"] = UDim2.new(0, 30, 0, 30);
					TextInput["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["7"]["BackgroundTransparency"] = 1;
					TextInput["7"]["Name"] = [[Icon]];
					TextInput["7"]["Position"] = UDim2.new(1, -25, 0, -25);
					TextInput["7"]["ImageColor3"] = Theme.TextColor


					-- StarterGui.ScreenGui.TextInput.TextBox
					TextInput["8"] = Instance.new("TextBox", TextInput["2"]);
					TextInput["8"]["TextColor3"] = Theme.TextColor;
					TextInput["8"]["BorderSizePixel"] = 0;
					TextInput["8"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					TextInput["8"]["TextSize"] = 20;
					if Theme.isDark then
						TextInput["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(15,15,15));
					else
						TextInput["8"]["BackgroundColor3"] = addColors(Theme.TextInputColor, Color3.fromRGB(-15,-15,-15));
					end

					TextInput["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					TextInput["8"]["AutomaticSize"] = Enum.AutomaticSize.X;
					TextInput["8"]["AnchorPoint"] = Vector2.new(1, 0);
					TextInput["8"]["Size"] = UDim2.new(0, 10, 0, 25);
					TextInput["8"]["Position"] = UDim2.new(0.99, 0, 0, 10);
					TextInput["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					TextInput["8"]["Text"] = [[]];
					TextInput["8"]["PlaceholderText"] = options.PlaceHolderText
					if Theme.isDark then
						TextInput["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(-70,-70,-70));
					else
						TextInput["8"]["PlaceholderColor3"] = addColors(Theme.TextColor, Color3.fromRGB(70,70,70));
					end

					-- StarterGui.ScreenGui.TextInput.TextBox.UICorner
					TextInput["9"] = Instance.new("UICorner", TextInput["8"]);



					-- StarterGui.ScreenGui.TextInput.TextBox.UIPadding
					TextInput["a"] = Instance.new("UIPadding", TextInput["8"]);
					TextInput["a"]["PaddingTop"] = UDim.new(0, 7);
					TextInput["a"]["PaddingRight"] = UDim.new(0, 7);
					TextInput["a"]["PaddingLeft"] = UDim.new(0, 7);
					TextInput["a"]["PaddingBottom"] = UDim.new(0, 7);

				end

				function TextInput:SetText(Txt)
					TextInput["8"].Text = Txt
					options.CallBack(TextInput["8"].Text)
				end

				-- Set up the callback for text change
				TextInput["8"].FocusLost:Connect(function(enterPressed)
					if enterPressed then
						if TextInput["8"].Text == nil then
							return
						else
							options.CallBack(TextInput["8"].Text)
						end
					end
				end)

				return TextInput
			end

			local NotificationHolder = Instance.new("Frame")

			do
				NotificationHolder.Name = "NotificationHolder"
				NotificationHolder.Parent = GUI["1"]
				NotificationHolder.AnchorPoint = Vector2.new(1, 1)
				NotificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationHolder.BackgroundTransparency = 1.000
				NotificationHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				NotificationHolder.BorderSizePixel = 0
				NotificationHolder.Position = UDim2.new(1, 0, 1, 0)
				NotificationHolder.Size = UDim2.new(0.22, 0, 1, 0)

				local UIPadding = Instance.new("UIPadding")

				UIPadding.Parent = NotificationHolder
				UIPadding.PaddingBottom = UDim.new(0, 40)
				UIPadding.PaddingRight = UDim.new(0, 40)
				UIPadding.PaddingTop = UDim.new(0, 40)
			end

			function Tab:Notification(options)
				options = Library:Validate({
					Text = "Text",
					Title = "Title",
					ActiveTime = 5
				},options or {})

				local Notificaton = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local MainText = Instance.new("TextLabel")
				local UICorner_2 = Instance.new("UICorner")
				local Seperator = Instance.new("Frame")
				local UiAll = Instance.new("Frame")
				local UIPadding = Instance.new("UIPadding")
				local UIStrokeNotif = Instance.new("UIStroke")
				local Title = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local UICorner_3 = Instance.new("UICorner")
				local Icon = Instance.new("ImageLabel")
				local UIPadding_3 = Instance.new("UIPadding")

				if not _G.ActiveNotifications then
					_G.ActiveNotifications = {}
				end

				local offset = 0
				for _, notification in ipairs(_G.ActiveNotifications) do
					if notification.Parent then
						offset = offset + 100
					end
				end

				Notificaton.Size = UDim2.new(0, (350/1.2), 0, (100/1.2))
				Notificaton.Name = "Notification " .. options.Title
				Notificaton.Parent = NotificationHolder
				Notificaton.BackgroundColor3 = Theme.NotificationColor
				Notificaton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Notificaton.BorderSizePixel = 0
				Notificaton.AnchorPoint = Vector2.new(1, 1)
				Notificaton.Position = UDim2.new(1, -30, 1, 120 + offset)
				table.insert(_G.ActiveNotifications, Notificaton)
				Notificaton.Transparency = .3
				-- animate to final position
				Library:tween(Notificaton, {Position = UDim2.new(1, -30, 1, -10 - offset)}, 1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)


				UIStrokeNotif.Name = "PopUpUIPadding"
				UIStrokeNotif.Parent = Notificaton
				UIStrokeNotif.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStrokeNotif.Color = Theme.NotificationInputStrokeColor
				UIStrokeNotif.LineJoinMode = Enum.LineJoinMode.Round
				UIStrokeNotif.Thickness = 2

				UiAll.Name = "UiAll"
				UiAll.Parent = Notificaton
				UiAll.BorderColor3 = Color3.fromRGB(0, 0, 0)
				UiAll.BorderSizePixel = 0
				UiAll.Transparency = 1
				UiAll.AnchorPoint = Vector2.new(0, 0)
				UiAll.Position = UDim2.new(0,0,0,0)
				UiAll.Size = UDim2.new(1,0,1,0)

				UICorner.CornerRadius = UDim.new(0.100000001, 8)
				UICorner.Parent = Notificaton

				MainText.Name = "Main Text"
				MainText.Parent = UiAll
				MainText.Active = true
				MainText.AnchorPoint = Vector2.new(1, 1)
				MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				MainText.BackgroundTransparency = 1.000
				MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
				MainText.BorderSizePixel = 0
				MainText.Position = UDim2.new(1, 0, 1.07000005, 0)
				MainText.Selectable = true
				MainText.Size = UDim2.new(1, 0, 0.99000001, -20)
				MainText.Font = Enum.Font.Ubuntu
				MainText.Text = options.Text
				MainText.TextColor3 = Theme.TextColor
				MainText.TextSize = 20.000
				MainText.TextWrapped = true
				MainText.TextXAlignment = Enum.TextXAlignment.Left
				MainText.TextYAlignment = Enum.TextYAlignment.Top

				Seperator.Name = "Seperator"
				Seperator.Parent = Notificaton
				Seperator.BackgroundColor3 = Theme.NotificationSeperatorColor
				Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Seperator.BorderSizePixel = 0
				Seperator.Position = UDim2.new(0, 0,0.3, 0)
				Seperator.AnchorPoint = Vector2.new(0,0)
				Seperator.Size = UDim2.new(1, 0, 0,3)
				Seperator.Visible = false

				Seperator.BackgroundColor3 = Theme.NotificationSeperatorColor
				Seperator.BorderColor3 = Color3.fromRGB(42, 56, 68)
				Seperator.BorderSizePixel = 0
				Seperator.Position = UDim2.new(0, 0, 0.3, 0)
				Seperator.Size = UDim2.new(1, 0, 0, 3)

				UICorner_2.CornerRadius = UDim.new(0.100000001, 8)
				UICorner_2.Parent = MainText

				UIPadding.Parent = UiAll
				UIPadding.PaddingBottom = UDim.new(0, 5)
				UIPadding.PaddingLeft = UDim.new(0, 1)
				UIPadding.PaddingRight = UDim.new(0, 1)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Title.Name = "Title"
				Title.Parent = UiAll
				Title.Active = true
				Title.AnchorPoint = Vector2.new(1, 0)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(1, 0, 0, 0)
				Title.Selectable = true
				Title.Size = UDim2.new(1, 0, 0.100000001, 20)
				Title.Font = Enum.Font.Ubuntu
				Title.Text = options.Title
				Title.TextColor3 = Theme.TextColor
				Title.TextSize = 30.000
				Title.TextWrapped = true
				Title.TextYAlignment = Enum.TextYAlignment.Bottom

				UIPadding_2.Parent = Title
				UIPadding_2.PaddingBottom = UDim.new(0, 10)
				UIPadding_2.PaddingLeft = UDim.new(0, 10)
				UIPadding_2.PaddingRight = UDim.new(0, 10)
				UIPadding_2.PaddingTop = UDim.new(0, 30)

				UICorner_3.CornerRadius = UDim.new(0.100000001, 8)
				UICorner_3.Parent = Title

				Icon.Name = "Icon"
				Icon.Parent = UiAll
				Icon.AnchorPoint = Vector2.new(1, 0)
				Icon.BackgroundTransparency = 1.000
				Icon.Position = UDim2.new(0, 20,0, 0)
				Icon.Size = UDim2.new(0, 25, 0, 25)
				Icon.Image = "rbxassetid://137847593094125"
				Icon.ImageColor3 = Theme.TextColor

				UIPadding_3.Parent = Notificaton
				UIPadding_3.PaddingBottom = UDim.new(0, 4)
				UIPadding_3.PaddingLeft = UDim.new(0, 15)
				UIPadding_3.PaddingRight = UDim.new(0, 15)
				UIPadding_3.PaddingTop = UDim.new(0, 4)



				--logic
				local function Notif()
					local sound = Instance.new("Sound")
					sound.SoundId = "rbxassetid://6518811702"
					-- replace with your sound id
					sound.Parent = game:GetService("SoundService")
					sound:Play()
					task.wait(options.ActiveTime)
					Library:tween(Notificaton, {Position = UDim2.new(2, 0, 1, -10 - offset)}, 1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
					task.wait(0.5)
					Notificaton:Destroy()
				end
				Notif()
			end
			
			--Exit
			do
				local Minimise = Instance.new("ImageButton")

				--Properties:

				Minimise.Name = "Exit"
				Minimise.Parent = GUI["4"]
				Minimise.Active = false
				Minimise.AnchorPoint = Vector2.new(1, 0.5)
				Minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Minimise.BackgroundTransparency = 1.000
				Minimise.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Minimise.BorderSizePixel = 0
				Minimise.Position = UDim2.new(1, -6, 0.5, 0)
				Minimise.Selectable = false
				Minimise.Size = UDim2.new(0, 22, 0, 22)
				Minimise.Image = "rbxassetid://101632078875960"
				Minimise.ImageColor3 = Theme.TextColor



				local Hover = false
				local IsClicked = false
				Minimise.MouseButton1Click:Connect(function()
					if not IsClicked then
						IsClicked = true
						Tab:CreatePopUp({
							ButtonLeftText = "Confirm",
							ButtonRightText = "Go Back",
							TitleText = "Warning",
							Text = "Do you Want to UnLoad The Library",
							callbackButtonLeft = function()
								GUI:_Destroy()
							end,
							callbackButtonRight = function()
								IsClicked = false
							end
						})
					end

				end)
			end

			return Tab
		end

	end


	function GUI:KeySystem() 
		do
			local KeySystem = Instance.new("Frame")
			local ImageButton = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local TextHolder = Instance.new("Frame")
			local MainName = Instance.new("TextLabel")
			local MainText = Instance.new("TextLabel")
			local SmallTitle = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local TextButton = Instance.new("TextButton")


			local UICorner_3 = Instance.new("UICorner")
			local UIPadding_2 = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")
			--Properties:

			KeySystem.Name = "KeySystem"
			KeySystem.Parent = GUI["1"]
			KeySystem.AnchorPoint = Vector2.new(0.5, 0.5)
			KeySystem.BackgroundColor3 = Color3.fromRGB(17, 11, 26)
			KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
			KeySystem.BorderSizePixel = 0
			KeySystem.Size = UDim2.new(0, 400, 0, 180)
			KeySystem.Position = UDim2.new(0.5,0,1,75)

			local Pos = UDim2.new(0.5,0,0.5,0)
			Library:tween(KeySystem, {Position = Pos}, 1.5,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)

			ImageButton.Parent = KeySystem
			ImageButton.AnchorPoint = Vector2.new(1, 0)
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(1, -8, 0, 8)
			ImageButton.Size = UDim2.new(0.0560000017, 0, 0.143999994, 0)
			ImageButton.Image = "rbxassetid://101632078875960"

			UICorner.CornerRadius = UDim.new(0, 15)
			UICorner.Parent = KeySystem

			TextHolder.Name = "TextHolder"
			TextHolder.Parent = KeySystem
			TextHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextHolder.BackgroundTransparency = 1.000
			TextHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextHolder.BorderSizePixel = 0
			TextHolder.Size = UDim2.new(1, 0, 1, 0)

			MainName.Name = "Main Name"
			MainName.Parent = TextHolder
			MainName.AnchorPoint = Vector2.new(0.5, 0)
			MainName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainName.BackgroundTransparency = 1.000
			MainName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainName.BorderSizePixel = 0
			MainName.Position = UDim2.new(0.5, 0, 0, 10)
			MainName.Size = UDim2.new(0, 200, 0, 50)
			MainName.Font = Enum.Font.Ubuntu
			MainName.Text = "Key System title"
			MainName.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainName.TextSize = 22.000

			MainText.Name = "Main Text"
			MainText.Parent = TextHolder
			MainText.AnchorPoint = Vector2.new(0.5, 0.5)
			MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainText.BackgroundTransparency = 1.000
			MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainText.BorderSizePixel = 0
			MainText.Position = UDim2.new(0.474999994, 0, 0.550000012, 0)
			MainText.Size = UDim2.new(1, -70, 0, 40)
			MainText.Font = Enum.Font.Ubuntu
			MainText.Text = "Key System title"
			MainText.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainText.TextSize = 18.000
			MainText.TextXAlignment = Enum.TextXAlignment.Left
			MainText.TextYAlignment = Enum.TextYAlignment.Top

			SmallTitle.Name = "SmallTitle"
			SmallTitle.Parent = TextHolder
			SmallTitle.AnchorPoint = Vector2.new(0.5, 0.5)
			SmallTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SmallTitle.BackgroundTransparency = 1.000
			SmallTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SmallTitle.BorderSizePixel = 0
			SmallTitle.Position = UDim2.new(0.25, 0, 0.5, -25)
			SmallTitle.Size = UDim2.new(0, 180, 0, 20)
			SmallTitle.Font = Enum.Font.Ubuntu
			SmallTitle.Text = "Here"
			SmallTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
			SmallTitle.TextSize = 14.000
			SmallTitle.TextXAlignment = Enum.TextXAlignment.Left
			SmallTitle.TextYAlignment = Enum.TextYAlignment.Top

			Frame.Parent = KeySystem
			Frame.AnchorPoint = Vector2.new(0, 1)
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0, 0, 1, 0)
			Frame.Size = UDim2.new(1, 0, 0, 70)

			TextBox.Parent = Frame
			TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
			TextBox.BackgroundColor3 = Color3.fromRGB(61, 40, 94)
			TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0.5, 0, 0.800000012, 0)
			TextBox.Size = UDim2.new(0.449999988, 0, 0, 40)
			TextBox.Font = Enum.Font.Ubuntu
			TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
			TextBox.PlaceholderText = "Key"
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 15.000
			TextBox.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_2.Parent = TextBox

			UIPadding.Parent = TextBox
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.PaddingRight = UDim.new(0, 10)

			TextButton.Name = "TextButton"
			TextButton.Parent = Frame
			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(76, 50, 117)
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(0.800000012, 0, 0.800000012, 0)
			TextButton.Size = UDim2.new(0, 40, 0, 40)
			TextButton.Font = Enum.Font.Ubuntu
			TextButton.Text = "Get Key"
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextScaled = true
			TextButton.TextSize = 15.000
			TextButton.TextWrapped = true
			TextButton.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_3.Parent = TextButton

			UIPadding_2.Parent = TextButton
			UIPadding_2.PaddingLeft = UDim.new(0, 10)
			UIPadding_2.PaddingRight = UDim.new(0, 10)

			UIListLayout.Parent = Frame
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout.Padding = UDim.new(0, 10)

			local sound = Instance.new("Sound")
			sound.Parent = game:GetService("SoundService")

			local function CheckKey(InputtedKey)
				if options.KeySystemConfig.Key == InputtedKey then
					Library:tween(KeySystem, {Position = UDim2.new(0.5,0,-0.5,0)}, 1,Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
					wait(1.2)
					GUI["2"]["Visible"] = true
					GUI:Move()
					GUI.HasKeyBeenInputed = true
					GUI:_ToggleVisibility()
					task.wait(1.1)
					KeySystem:Destroy()
				else 
					--code not right key function
					return
				end
			end

			TextBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					CheckKey(TextBox.Text)
				end
			end)

			TextButton.MouseButton1Click:Connect(function()
				setclipboard(options.KeySystemConfig.KeyLink)
			end)

			ImageButton.MouseButton1Click:Connect(function()
				sound.SoundId = "rbxassetid://1524543584"
				sound:Play()
				KeySystem.ClipsDescendants = true
				Library:tween(KeySystem, {Size = UDim2.new(0, 82,0, 58)}, 1,Enum.EasingStyle.Back, Enum.EasingDirection.Out,function()
				end)

				Library:tween(KeySystem, {Size = UDim2.new(0, 0,0, 0)}, 1,Enum.EasingStyle.Back, Enum.EasingDirection.In)
				sound.Ended:Connect(function()
					task.wait(2)
					KeySystem:Destroy()
				end)

			end)
		end

	end

	if options.KeySystemConfig.KeySystem == true then
		GUI:KeySystem()
	end
		
	return GUI


end
return Library,Themes
