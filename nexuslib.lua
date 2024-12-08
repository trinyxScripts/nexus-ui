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


local Library = {}
--GUI = {};

function Library:Validate(defaults,options)

	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object,goal,callback)
	local tween = tweenService:Create(object,tweenInfo,goal)
	tween.Completed:Connect(callback or function() end )
	tween:Play()
end

function Library:new(options)
	
	--automatic Assign Default if blank

	options = Library:Validate({
		name = "Default"
	},options or {}) --if options == nil give table otherwise give options
	
	local GUI = {
		Active = false,
		CurrentTab = nil,
		Visibility = true
	}
	

	
	--logic
	
	--All Ui	
	do 
		do
			GUI["1"] = Instance.new("ScreenGui", runServices:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
			GUI["1"]["Name"] = [[UxiLib]];
			GUI["1"]["IgnoreGuiInset"] = true
		end

		--main
		do
			GUI["2"] = Instance.new("Frame", GUI["1"]);
			GUI["2"]["BorderSizePixel"] = 0;
			GUI["2"]["BackgroundColor3"] = Color3.fromRGB(15, 24, 32);
			GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
			GUI["2"]["Size"] = UDim2.new(0, 401, 0, 300);
			GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
			GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["2"]["Name"] = [[Main]];
			GUI["2"]["BackgroundTransparency"] = 0.2
			GUI["2"]["Visible"] = true
			
			GUI["3"] = Instance.new("UICorner", GUI["2"]);
			GUI["3"]["CornerRadius"] = UDim.new(0, 9);
			

			GUI["54"] = Instance.new("Frame", GUI["2"]);
			GUI["54"]["ZIndex"] = 0;
			GUI["54"]["BorderSizePixel"] = 0;
			GUI["54"]["Size"] = UDim2.new(1, 0, 1, 0);
			GUI["54"]["Name"] = [[DropShadowHolder]];
			GUI["54"]["BackgroundTransparency"] = 1;
		end
		
		function GUI:_ToggleVisibility()
			GUI.Visibility = not GUI.Visibility
			GUI["2"]["Visible"] = GUI.Visibility
		end

		uis.InputBegan:Connect(function(input, gameProcessed)
			if input.KeyCode == Enum.KeyCode.K and not gameProcessed then
				GUI:_ToggleVisibility()
			end
		end)
		
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

			GUI["4"] = Instance.new("Frame", GUI["2"]);
			GUI["4"]["BorderSizePixel"] = 0;
			GUI["4"]["BackgroundColor3"] = Color3.fromRGB(11, 17, 23);
			GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
			GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["4"]["Name"] = [[TopBar]];
		end


		--Top Bar
		do
			GUI["5"] = Instance.new("UICorner", GUI["4"]);
			GUI["5"]["CornerRadius"] = UDim.new(0, 9);


			-- StarterGui.UxiLib.Main.TopBar.Extention
			GUI["6"] = Instance.new("Frame", GUI["4"]);
			GUI["6"]["BorderSizePixel"] = 0;
			GUI["6"]["BackgroundColor3"] = Color3.fromRGB(11, 17, 23);
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
			GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["7"]["BackgroundTransparency"] = 1;
			GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
			GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["7"]["Text"] = options["Name"];
			GUI["7"]["Name"] = [[Title]];


			-- StarterGui.UxiLib.Main.TopBar.Title.UIPadding
			GUI["8"] = Instance.new("UIPadding", GUI["7"]);
			GUI["8"]["PaddingTop"] = UDim.new(0, 1);
			GUI["8"]["PaddingLeft"] = UDim.new(0, 8);


			-- StarterGui.UxiLib.Main.TopBar.Minimise
			GUI["9"] = Instance.new("ImageLabel", GUI["4"]);
			GUI["9"]["BorderSizePixel"] = 0;
			GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			GUI["9"]["AnchorPoint"] = Vector2.new(1, 0.5);
			GUI["9"]["Image"] = [[rbxassetid://101632078875960]];
			GUI["9"]["Size"] = UDim2.new(0, 22, 0, 22);
			GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["9"]["ImageColor3"] = Color3.fromRGB(170,170,170);
			GUI["9"]["BackgroundTransparency"] = 1;
			GUI["9"]["Name"] = [[Minimise]];
			GUI["9"]["Position"] = UDim2.new(1, -6, 0.5, 0);
			
			GUI["9"].MouseEnter:Connect(function()
				GUI.Hover = true
				Library:tween(GUI["9"], {ImageColor3 = Color3.fromRGB(255,255,255)})

			end)

			GUI["9"].MouseLeave:Connect(function()
				GUI.Hover = false
				Library:tween(GUI["9"], {ImageColor3 = Color3.fromRGB(170,170,170)})
			end)

			-- StarterGui.UxiLib.Main.TopBar.line
			GUI["a"] = Instance.new("Frame", GUI["4"]);
			GUI["a"]["ZIndex"] = 2;
			GUI["a"]["BorderSizePixel"] = 0;
			GUI["a"]["BackgroundColor3"] = Color3.fromRGB(25, 39, 53);
			GUI["a"]["AnchorPoint"] = Vector2.new(0, 1);
			GUI["a"]["Size"] = UDim2.new(1, 0, 0, 1);
			GUI["a"]["Position"] = UDim2.new(0, 0, 1, 0);
			GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			GUI["a"]["Name"] = [[line]];
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
	end
	
	-- Navigation
	do
		GUI["b"] = Instance.new("Frame", GUI["2"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(15, 24, 32);
		GUI["b"]["Size"] = UDim2.new(0, 400, 0, 60);
		GUI["b"]["Position"] = UDim2.new(0, 0, 0, 350);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["Name"] = [[Navigation]];


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
	
		uis.InputEnded:Connect(function(input,gpe)
		if gpe then return end

		if input.UserInputType == Enum.UserInputType.MouseWheel then
			GUI["2"]:Destroy()
		end

	end)
	
	function GUI:CreateTab(options)
		options = Library:Validate({
			Icon = "rbxassetid://121088157314410"
		},options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		
		
		
		--render
		do
		-- StarterGui.UxiLib.Main.Navigation.Button Holder.Inactive
		Tab["11"] = Instance.new("ImageLabel",GUI["c"]);
		Tab["11"]["BorderSizePixel"] = 0;
		Tab["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Tab["11"]["ImageColor3"] = Color3.fromRGB(155, 155, 155);
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
		--methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["11"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				Tab["15"].Visible = true
				
				
				
				GUI.CurrentTab = Tab
			end
			
			
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["11"], {ImageColor3 = Color3.fromRGB(154,154,154)})
				Tab["15"].Visible = false
			end
		end
		
		--logic	
		do
			Tab["11"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Library:tween(Tab["11"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				end


			end)

			Tab["11"].MouseLeave:Connect(function()
				Tab.Hover = false
				
				if not Tab.Active then
					Library:tween(Tab["11"], {ImageColor3 = Color3.fromRGB(154,154,154)})
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
		
		if GUI.CurrentTab == nil then
			Tab:Activate()
			end
		
		
		function Tab:Button(options)
			options = Library:Validate({
				Name = "FlyButton",
				callback = function() end
			},options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			--make button
			do


				-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button
				Button["16"] = Instance.new("Frame", Tab["15"]);
				Button["16"]["BorderSizePixel"] = 0;
				Button["16"]["BackgroundColor3"] = Color3.fromRGB(23, 37, 50);
				Button["16"]["AnchorPoint"] = Vector2.new(0.5, 0);
				Button["16"]["Size"] = UDim2.new(1, 0, 0, 40);
				Button["16"]["Position"] = UDim2.new(0.5, 0, 0, 0);
				Button["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["16"]["Name"] = [[Button]];


				-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UICorner
				Button["X"] = Instance.new("UICorner", Button["16"]);



				-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.UIStroke
				Button["18"] = Instance.new("UIStroke", Button["16"]);
				Button["18"]["Color"] = Color3.fromRGB(82,82,82);
				Button["18"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


				-- StarterGui.UxiLib.Main.MainContent.HomeTab.Button.Title
				Button["19"] = Instance.new("TextLabel", Button["16"]);
				Button["19"]["BorderSizePixel"] = 0;
				Button["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["19"]["TextSize"] = 20;
				Button["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["19"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
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
				Button["1b"]["Size"] = UDim2.new(0, 25, 0, 25);
				Button["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1b"]["BackgroundTransparency"] = 1;
				Button["1b"]["Name"] = [[Icon]];
				Button["1b"]["Position"] = UDim2.new(1, 0, 1, 0);
			end
			
			--logic
			do
				Button["16"].MouseEnter:Connect(function()
					Button.Hover = true
					
					Library:tween(Button["18"], {Color = Color3.fromRGB(120,120,120)})
					
				end)
				
				Button["16"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["18"], {Color = Color3.fromRGB(82,82,82)})
					end
				end)
				
				uis.InputBegan:Connect(function(input,gpe)
					if gpe then return end
				
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["16"], {BackgroundColor3 = Color3.fromRGB(42, 68, 91)})
						Library:tween(Button["18"], {Color = Color3.fromRGB(200,200,200)})
						options.callback()
					end
					
				end)
				
				uis.InputEnded:Connect(function(input,gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						if Button.Hover then
							Library:tween(Button["16"], {BackgroundColor3 = Color3.fromRGB(23, 37, 50)})
							Library:tween(Button["18"], {Color = Color3.fromRGB(120,120,120)})
						else
							Library:tween(Button["16"], {BackgroundColor3 = Color3.fromRGB(23, 37, 50)})
							Library:tween(Button["18"], {Color = Color3.fromRGB(82,82,82)})
						end
					end

				end)
			end
			
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
					Name = "Toogle1",
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
					Toggle["1t"]["BackgroundColor3"] = Color3.fromRGB(23, 37, 50);
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
					Toggle["3x"]["Color"] = Color3.fromRGB(82,82,82);

					-- StarterGui.s.Main.MainContent.HomeTab.ToggleInactive.Title
					Toggle["2x"] = Instance.new("TextLabel", Toggle["1t"]);
					Toggle["2x"]["BorderSizePixel"] = 0;
					Toggle["2x"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["2x"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["2x"]["TextSize"] = 20;
					Toggle["2x"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["2x"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
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
					Toggle["1z"]["BackgroundColor3"] = Color3.fromRGB(15, 22, 34);
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
							Library:tween(Toggle["1z"], {BackgroundColor3 = Color3.fromRGB(42, 128, 136)})
							Library:tween(Toggle["1e"], {ImageTransparency = 0})
						else
							Library:tween(Toggle["1z"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
							Library:tween(Toggle["1e"], {ImageTransparency = 1})
						end
						
						options.callback(Toggle.State)
					end
					

					
				end
				--logic
				do
					Toggle["1t"].MouseEnter:Connect(function()
						Toggle.Hover = true

						Library:tween(Toggle["3x"], {Color = Color3.fromRGB(120,120,120)})

					end)

					Toggle["1t"].MouseLeave:Connect(function()
						Toggle.Hover = false

						if not Toggle.MouseDown then
							Library:tween(Toggle["3x"], {Color = Color3.fromRGB(82,82,82)})
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Toggle.MouseDown = true
							Library:tween(Toggle["1t"], {BackgroundColor3 = Color3.fromRGB(42, 68, 91)})
							Library:tween(Toggle["3x"], {Color = Color3.fromRGB(200,200,200)})
							Toggle:UpdateToggle()
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Toggle.MouseDown = false
							if Toggle.Hover then
								Library:tween(Toggle["3x"], {Color = Color3.fromRGB(120,120,120)})
								Library:tween(Toggle["1t"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
							else
								Library:tween(Toggle["1t"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
								Library:tween(Toggle["3x"], {Color = Color3.fromRGB(0,0,0)})
							end
						end

					end)
					
				end
				return Toggle
		end
		
		function Tab:Label(options)
			options = Library:Validate({
				Name = "IFNOO"
			},options or {})
			
			local Label = {}
			
			--render
			do
			Label["36"] = Instance.new("Frame", Tab["15"]);
			Label["36"]["BorderSizePixel"] = 0;
			Label["36"]["BackgroundColor3"] = Color3.fromRGB(4, 30, 32);
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
			Label["38"]["Color"] = Color3.fromRGB(11, 92, 98);


			-- StarterGui.s.Main.MainContent.HomeTab.Label.Title
			Label["39"] = Instance.new("TextLabel", Label["36"]);
			Label["39"]["BorderSizePixel"] = 0;
			Label["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Label["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Label["39"]["TextSize"] = 20;
			Label["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Label["39"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
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
				Library:tween(Label["36"], {Size = UDim2.new(Label["36"].Size.X.Scale, Label["36"].Size.X.Offset, 0,Label["39"].TextBounds.Y + 14)})

			end
			
			
			Label:_update()
			return Label
		end
		
		function Tab:Slider(options)
			options = Library:Validate({
				Name = "Slideeerr",
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
			Slider["2a"]["BackgroundColor3"] = Color3.fromRGB(23, 37, 50);
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



			-- StarterGui.s.Main.MainContent.HomeTab.Slider.Title
			Slider["2d"] = Instance.new("TextLabel", Slider["2a"]);
			Slider["2d"]["BorderSizePixel"] = 0;
			Slider["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Slider["2d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
			Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Slider["2d"]["TextSize"] = 20;
			Slider["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Slider["2d"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
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
			Slider["2f"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
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
			Slider["30"]["BackgroundColor3"] = Color3.fromRGB(15, 22, 34);
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
			Slider["33"]["BackgroundColor3"] = Color3.fromRGB(40, 60, 92);
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
							Slider["33"].Size = UDim2.fromScale(precentage,1) 
						else
							Slider["2f"].Text = tostring(v)
							Slider["33"].Size = UDim2.fromScale(((v -options.min) / (options.max - options.min)), 1) 
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

					Library:tween(Slider["2c"], {Color = Color3.fromRGB(120,120,120)})
					Library:tween(Slider["32"], {Color = Color3.fromRGB(120,120,120)})
					Library:tween(Slider["35"], {Color = Color3.fromRGB(120,120,120)})
				end)

				Slider["2a"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["2c"], {Color = Color3.fromRGB(82,82,82)})
						Library:tween(Slider["32"], {Color = Color3.fromRGB(82,82,82)})
						Library:tween(Slider["35"], {Color = Color3.fromRGB(82,82,82)})
					end
				end)

				uis.InputBegan:Connect(function(input,gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["2a"], {BackgroundColor3 = Color3.fromRGB(42, 68, 91)})
						Library:tween(Slider["2c"], {Color = Color3.fromRGB(200,200,200)})
						Library:tween(Slider["32"], {Color = Color3.fromRGB(200,200,200)})
						Library:tween(Slider["35"], {Color = Color3.fromRGB(200,200,200)})
						
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
							Library:tween(Slider["2a"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
							Library:tween(Slider["2c"], {Color = Color3.fromRGB(120,120,120)})
							Library:tween(Slider["32"], {Color = Color3.fromRGB(120,120,120)})
							Library:tween(Slider["35"], {Color = Color3.fromRGB(120,120,120)})
						else
							Library:tween(Slider["2a"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
							Library:tween(Slider["2c"], {Color = Color3.fromRGB(82,82,82)})
							Library:tween(Slider["32"], {Color = Color3.fromRGB(82,82,82)})
							Library:tween(Slider["35"], {Color = Color3.fromRGB(82,82,82)})
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
					Name = "DropDown1",
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
					DropDown["3b"] = Instance.new("Frame", Tab["15"]);
					DropDown["3b"]["BorderSizePixel"] = 0;
					DropDown["3b"]["BackgroundColor3"] = Color3.fromRGB(23, 37, 50);
					DropDown["3b"]["AnchorPoint"] = Vector2.new(0.5, 0);
					DropDown["3b"]["ClipsDescendants"] = true;
					DropDown["3b"]["Size"] = UDim2.new(1, 0, 0, 40);
					DropDown["3b"]["Position"] = UDim2.new(0.5, 0, 0, 0);
					DropDown["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					DropDown["3b"]["Name"] = [[DropDown]];


					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UICorner
					DropDown["3c"] = Instance.new("UICorner", DropDown["3b"]);



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.UIStroke
					DropDown["3d"] = Instance.new("UIStroke", DropDown["3b"]);
					DropDown["3d"].Color = Color3.fromRGB(82,82,82);
					--DropDown["3d"].Thickness = 1;



					-- StarterGui.s.Main.MainContent.HomeTab.DropDown.Title
					DropDown["3e"] = Instance.new("TextLabel", DropDown["3b"]);
					DropDown["3e"]["BorderSizePixel"] = 0;
					DropDown["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					DropDown["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					DropDown["3e"]["TextSize"] = 20;
					DropDown["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					DropDown["3e"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
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
						DropDown.Items[id].instance["43"] = Instance.new("TextLabel", DropDown["41"]);
						DropDown.Items[id].instance["43"]["TextWrapped"] = true;
						DropDown.Items[id].instance["43"]["BorderSizePixel"] = 0;
						DropDown.Items[id].instance["43"]["BackgroundColor3"] = Color3.fromRGB(46, 77, 104);
						DropDown.Items[id].instance["43"]["TextSize"] = 18;
						DropDown.Items[id].instance["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						DropDown.Items[id].instance["43"]["TextColor3"] = Color3.fromRGB(257, 257, 257);
						DropDown.Items[id].instance["43"]["Size"] = UDim2.new(1, 0, 0, 28);
						DropDown.Items[id].instance["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						DropDown.Items[id].instance["43"]["Text"] = id;
						DropDown.Items[id].instance["43"]["Name"] = [[inactiveOption]];


						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UIStroke
						DropDown.Items[id].instance["44"] = Instance.new("UIStroke", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
						DropDown.Items[id].instance["44"]["Color"] = Color3.fromRGB(98, 98, 98);


						-- StarterGui.s.Main.MainContent.HomeTab.DropDown.OptionHolder.inactiveOption.UICorner
						DropDown.Items[id].instance["45"] = Instance.new("UICorner", DropDown.Items[id].instance["43"]);
						DropDown.Items[id].instance["45"]["CornerRadius"] = UDim.new(0, 10);
						
						
						
						
						DropDown.Items[id].instance["43"].MouseEnter:Connect(function()
							item.Hover = true
							DropDown.hoveringItem = true

							Library:tween(DropDown.Items[id].instance["44"], {Color = Color3.fromRGB(120,120,120)})

						end)

						DropDown.Items[id].instance["43"].MouseLeave:Connect(function()
							item.Hover = false
							DropDown.hoveringItem = false

							if not item.MouseDown then
								Library:tween(DropDown.Items[id].instance["44"], {Color = Color3.fromRGB(97,97,97)})
							end
						end)

						uis.InputBegan:Connect(function(input,gpe)
							if gpe then return end

							if input.UserInputType == Enum.UserInputType.MouseButton1 and item.Hover then
								item.MouseDown = true
								Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = Color3.fromRGB(69, 117, 156)})
								Library:tween(DropDown.Items[id].instance["44"], {Color = Color3.fromRGB(200,200,200)})
								options.callback(value)
								--DropDown:Toggle()
							end

						end)

						uis.InputEnded:Connect(function(input,gpe)
							if gpe then return end
							if DropDown.Items[id] == nil then
								return
							end
							
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								item.MouseDown = false
								if DropDown.Hover then
									Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
									Library:tween(DropDown.Items[id].instance["44"], {Color = Color3.fromRGB(120,120,120)})
								else
									Library:tween(DropDown.Items[id].instance["43"], {BackgroundColor3 = Color3.fromRGB(46, 77, 104)})
									Library:tween(DropDown.Items[id].instance["44"], {Color = Color3.fromRGB(97, 97, 97)})
								end
							end

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
						if DropDown.open  then

							Library:tween(DropDown["3b"],{Size = UDim2.new(1,0,0,40)},function()
								DropDown["41"].Visible = false
							end)
						else
							local count = 0
							for i,v in pairs(DropDown.Items)  do
								if v ~= nil then
									count += 1
								end
							end

							DropDown["41"].Visible = true
							Library:tween(DropDown["3b"],{Size = UDim2.new(1,0,0,40 +(count *(68-40)) + 14)})
						end
						DropDown.open = not DropDown.open
					end
				end

				
				do
					DropDown["3b"].MouseEnter:Connect(function()
						DropDown.Hover = true

						Library:tween(DropDown["3d"], {Color = Color3.fromRGB(120,120,120)})

					end)

					DropDown["3b"].MouseLeave:Connect(function()
						DropDown.Hover = false

						if not DropDown.MouseDown then
							Library:tween(DropDown["3d"], {Color = Color3.fromRGB(82,82,82)})
						end
					end)

					uis.InputBegan:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and DropDown.Hover then
							DropDown.MouseDown = true
							Library:tween(DropDown["3b"], {BackgroundColor3 = Color3.fromRGB(42, 68, 91)})
							Library:tween(DropDown["3d"], {Color = Color3.fromRGB(200,200,200)})
							options.callback()
							if not DropDown.hoveringItem then
								DropDown:Toggle()
							end
							
						end

					end)

					uis.InputEnded:Connect(function(input,gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							DropDown.MouseDown = false
							if DropDown.Hover then
								Library:tween(DropDown["3b"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
								Library:tween(DropDown["3d"], {Color = Color3.fromRGB(120,120,120)})
							else
								Library:tween(DropDown["3b"], {BackgroundColor3 = Color3.fromRGB(22, 36, 49)})
								Library:tween(DropDown["18"], {Color = Color3.fromRGB(82,82,82)})
							end
						end

					end)
				end
				--METHODS
				
				do
					
				end
					
				return DropDown
			end
		return Tab

	end

	end
	
	
	
	return GUI
	
end

return Library
