-- Instances: 17 | Scripts: 3 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ScreenGui.menu
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["ZIndex"] = 20;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 217, 254);
G2L["2"]["Size"] = UDim2.new(0.36457, 0, 0.22555, 0);
G2L["2"]["Position"] = UDim2.new(0.317, 0, 0.25, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[menu]];


-- StarterGui.ScreenGui.menu.TextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["Size"] = UDim2.new(1, 0, 0.36994, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[NOTICE: some scripts are NOT MINE, i am NOT responsible for shit that goes down. now, are you ready to become an intern for OJT?]];
G2L["3"]["Position"] = UDim2.new(0, 0, 0.6221, 0);


-- StarterGui.ScreenGui.menu.TextLabel.UITextSizeConstraint
G2L["4"] = Instance.new("UITextSizeConstraint", G2L["3"]);
G2L["4"]["MaxTextSize"] = 43;


-- StarterGui.ScreenGui.menu.UICorner
G2L["5"] = Instance.new("UICorner", G2L["2"]);
G2L["5"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.ScreenGui.menu.ImageLabel
G2L["6"] = Instance.new("ImageLabel", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6"]["Image"] = [[rbxassetid://138025964953811]];
G2L["6"]["Size"] = UDim2.new(0.14846, 0, 0.53552, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Rotation"] = 10;
G2L["6"]["Position"] = UDim2.new(0.15922, 0, 0.36042, 0);


-- StarterGui.ScreenGui.menu.ImageLabel.LocalScript
G2L["7"] = Instance.new("LocalScript", G2L["6"]);



-- StarterGui.ScreenGui.menu.ImageLabel.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["6"]);
G2L["8"]["AspectRatio"] = 1.01271;
G2L["8"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.ScreenGui.menu.TextLabel
G2L["9"] = Instance.new("TextLabel", G2L["2"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 14;
G2L["9"]["TextScaled"] = true;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Italic);
G2L["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["Size"] = UDim2.new(0.45582, 0, 0.36994, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[OJT-Ware]];
G2L["9"]["Position"] = UDim2.new(0.27309, 0, 0.17123, 0);


-- StarterGui.ScreenGui.menu.TextLabel.UITextSizeConstraint
G2L["a"] = Instance.new("UITextSizeConstraint", G2L["9"]);
G2L["a"]["MaxTextSize"] = 64;


-- StarterGui.ScreenGui.menu.UIAspectRatioConstraint
G2L["b"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["b"]["AspectRatio"] = 2.87861;
G2L["b"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.ScreenGui.no
G2L["c"] = Instance.new("TextButton", G2L["1"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["RichText"] = true;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextScaled"] = true;
G2L["c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["ZIndex"] = 20;
G2L["c"]["BackgroundTransparency"] = 0.5;
G2L["c"]["Size"] = UDim2.new(0.14641, 0, 0.06519, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[nah, i hate my life]];
G2L["c"]["Name"] = [[no]];
G2L["c"]["Position"] = UDim2.new(0.427, 0, 0.65, 0);


-- StarterGui.ScreenGui.no.UICorner
G2L["d"] = Instance.new("UICorner", G2L["c"]);
G2L["d"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.ScreenGui.no.noscript
G2L["e"] = Instance.new("LocalScript", G2L["c"]);
G2L["e"]["Name"] = [[noscript]];


-- StarterGui.ScreenGui.yes
G2L["f"] = Instance.new("TextButton", G2L["1"]);
G2L["f"]["TextWrapped"] = true;
G2L["f"]["RichText"] = true;
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["TextSize"] = 14;
G2L["f"]["TextScaled"] = true;
G2L["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 116);
G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["f"]["ZIndex"] = 20;
G2L["f"]["BackgroundTransparency"] = 0.5;
G2L["f"]["Size"] = UDim2.new(0.14641, 0, 0.06519, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Text"] = [[oh yeah]];
G2L["f"]["Name"] = [[yes]];
G2L["f"]["Position"] = UDim2.new(0.427, 0, 0.55, 0);


-- StarterGui.ScreenGui.yes.UICorner
G2L["10"] = Instance.new("UICorner", G2L["f"]);
G2L["10"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.ScreenGui.yes.yesscript
G2L["11"] = Instance.new("LocalScript", G2L["f"]);
G2L["11"]["Name"] = [[yesscript]];


-- StarterGui.ScreenGui.menu.ImageLabel.LocalScript
local function C_7()
local script = G2L["7"];
	local frame = script.Parent
	local tweenService = game:GetService ("TweenService")
	
	local info = TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false, 0)
	
	tweenService:Create(frame, info, {Rotation = 360}) :Play()
end;
task.spawn(C_7);
-- StarterGui.ScreenGui.no.noscript
local function C_e()
local script = G2L["e"];
	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		print("destroyed ojt-ware, loser activity")
		button.Parent:Destroy()
	end)
end;
task.spawn(C_e);
-- StarterGui.ScreenGui.yes.yesscript
local function C_11()
local script = G2L["11"];
	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/hypotisctic/ojteyesonlycuddy/refs/heads/main/source.lua"))()
		button.Parent:Destroy()
	end)
end;
task.spawn(C_11);

return G2L["1"], require;
