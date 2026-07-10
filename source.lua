-- Instances: 106 | Scripts: 16 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.OJTWare
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[OJTWare]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.OJTWare.buttonscript
G2L["2"] = Instance.new("LocalScript", G2L["1"]);
G2L["2"]["Name"] = [[buttonscript]];


-- StarterGui.OJTWare.hidescript
G2L["3"] = Instance.new("LocalScript", G2L["1"]);
G2L["3"]["Name"] = [[hidescript]];


-- StarterGui.OJTWare.mainframe
G2L["4"] = Instance.new("Frame", G2L["1"]);
G2L["4"]["Active"] = true;
G2L["4"]["ZIndex"] = 19;
G2L["4"]["BorderSizePixel"] = 20;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["4"]["Size"] = UDim2.new(0.2694, 0, 0.37158, 0);
G2L["4"]["Position"] = UDim2.new(0.129, 0, 0.58, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(86, 0, 0);
G2L["4"]["Name"] = [[mainframe]];


-- StarterGui.OJTWare.mainframe.hideremoteabuse
G2L["5"] = Instance.new("LocalScript", G2L["4"]);
G2L["5"]["Name"] = [[hideremoteabuse]];


-- StarterGui.OJTWare.mainframe.namelessadmin
G2L["6"] = Instance.new("TextButton", G2L["4"]);
G2L["6"]["TextWrapped"] = true;
G2L["6"]["RichText"] = true;
G2L["6"]["BorderSizePixel"] = 4;
G2L["6"]["TextSize"] = 14;
G2L["6"]["TextScaled"] = true;
G2L["6"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["6"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[NA]];
G2L["6"]["Name"] = [[namelessadmin]];
G2L["6"]["Position"] = UDim2.new(-0.02261, 0, 0.17719, 0);


-- StarterGui.OJTWare.mainframe.namelessadmin.LocalScript
G2L["7"] = Instance.new("LocalScript", G2L["6"]);



-- StarterGui.OJTWare.mainframe.namelessadmin.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["6"]);
G2L["8"]["AspectRatio"] = 2.36988;
G2L["8"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.cobalt
G2L["9"] = Instance.new("TextButton", G2L["4"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["RichText"] = true;
G2L["9"]["BorderSizePixel"] = 4;
G2L["9"]["TextSize"] = 14;
G2L["9"]["TextScaled"] = true;
G2L["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["9"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[Cobalt]];
G2L["9"]["Name"] = [[cobalt]];
G2L["9"]["Position"] = UDim2.new(0.23, 0, 0.17719, 0);


-- StarterGui.OJTWare.mainframe.cobalt.LocalScript
G2L["a"] = Instance.new("LocalScript", G2L["9"]);



-- StarterGui.OJTWare.mainframe.cobalt.UIAspectRatioConstraint
G2L["b"] = Instance.new("UIAspectRatioConstraint", G2L["9"]);
G2L["b"]["AspectRatio"] = 2.36988;
G2L["b"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.text
G2L["c"] = Instance.new("Frame", G2L["4"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(246, 208, 255);
G2L["c"]["Size"] = UDim2.new(0.67935, 0, 0.21053, 0);
G2L["c"]["Position"] = UDim2.new(-0.0625, 0, -0.081, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Name"] = [[text]];


-- StarterGui.OJTWare.mainframe.text.UICorner
G2L["d"] = Instance.new("UICorner", G2L["c"]);
G2L["d"]["CornerRadius"] = UDim.new(0, 15);


-- StarterGui.OJTWare.mainframe.text.TextLabel
G2L["e"] = Instance.new("TextLabel", G2L["c"]);
G2L["e"]["TextWrapped"] = true;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["TextSize"] = 30;
G2L["e"]["TextTransparency"] = 0.3;
G2L["e"]["TextScaled"] = true;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
G2L["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["RichText"] = true;
G2L["e"]["Size"] = UDim2.new(1.10743, 0, 1.16327, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Text"] = [[real ojt scripts]];
G2L["e"]["Position"] = UDim2.new(0.02572, 0, 0, 0);


-- StarterGui.OJTWare.mainframe.text.TextLabel.UITextSizeConstraint
G2L["f"] = Instance.new("UITextSizeConstraint", G2L["e"]);
G2L["f"]["MaxTextSize"] = 30;


-- StarterGui.OJTWare.mainframe.text.TextLabel.UIAspectRatioConstraint
G2L["10"] = Instance.new("UIAspectRatioConstraint", G2L["e"]);
G2L["10"]["AspectRatio"] = 3.96667;
G2L["10"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.text.UIAspectRatioConstraint
G2L["11"] = Instance.new("UIAspectRatioConstraint", G2L["c"]);
G2L["11"]["AspectRatio"] = 4.16667;


-- StarterGui.OJTWare.mainframe.credits
G2L["12"] = Instance.new("TextLabel", G2L["4"]);
G2L["12"]["TextWrapped"] = true;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 14;
G2L["12"]["TextScaled"] = true;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["RichText"] = true;
G2L["12"]["Size"] = UDim2.new(0.47554, 0, 0.17193, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Text"] = [[made by hypotisctic, inspired by CEO and OJT saltandchicken]];
G2L["12"]["Name"] = [[credits]];
G2L["12"]["Position"] = UDim2.new(-0.02351, 0, 0.89903, 0);


-- StarterGui.OJTWare.mainframe.credits.UIAspectRatioConstraint
G2L["13"] = Instance.new("UIAspectRatioConstraint", G2L["12"]);
G2L["13"]["AspectRatio"] = 3.70294;
G2L["13"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.dex
G2L["14"] = Instance.new("TextButton", G2L["4"]);
G2L["14"]["TextWrapped"] = true;
G2L["14"]["RichText"] = true;
G2L["14"]["BorderSizePixel"] = 4;
G2L["14"]["TextSize"] = 14;
G2L["14"]["TextScaled"] = true;
G2L["14"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["14"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[dex]];
G2L["14"]["Name"] = [[dex]];
G2L["14"]["Position"] = UDim2.new(0.23, 0, 0.34912, 0);


-- StarterGui.OJTWare.mainframe.dex.LocalScript
G2L["15"] = Instance.new("LocalScript", G2L["14"]);



-- StarterGui.OJTWare.mainframe.dex.UIAspectRatioConstraint
G2L["16"] = Instance.new("UIAspectRatioConstraint", G2L["14"]);
G2L["16"]["AspectRatio"] = 2.36988;
G2L["16"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.version
G2L["17"] = Instance.new("TextLabel", G2L["4"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["TextSize"] = 14;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["RichText"] = true;
G2L["17"]["Size"] = UDim2.new(0.27717, 0, 0.08772, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[version 1.4]];
G2L["17"]["Name"] = [[version]];
G2L["17"]["Position"] = UDim2.new(0.72137, 0, 0.96471, 0);


-- StarterGui.OJTWare.mainframe.ImageLabel
G2L["18"] = Instance.new("ImageLabel", G2L["4"]);
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["18"]["ImageTransparency"] = 0.5;
G2L["18"]["AnchorPoint"] = Vector2.new(0.52, 0.55);
G2L["18"]["Image"] = [[rbxassetid://79619982763857]];
G2L["18"]["Size"] = UDim2.new(0.22826, 0, 0.30175, 0);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["BackgroundTransparency"] = 1;
G2L["18"]["Position"] = UDim2.new(0.89021, 0, 0.11878, 0);


-- StarterGui.OJTWare.mainframe.ImageLabel.LocalScript
G2L["19"] = Instance.new("LocalScript", G2L["18"]);



-- StarterGui.OJTWare.mainframe.ImageLabel.UIAspectRatioConstraint
G2L["1a"] = Instance.new("UIAspectRatioConstraint", G2L["18"]);
G2L["1a"]["AspectRatio"] = 1.01271;
G2L["1a"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ImageLabel
G2L["1b"] = Instance.new("ImageLabel", G2L["4"]);
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["SliceCenter"] = Rect.new(0.5, 0.5, 0.5, 0.5);
G2L["1b"]["ScaleType"] = Enum.ScaleType.Fit;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["ImageTransparency"] = 0.5;
G2L["1b"]["AnchorPoint"] = Vector2.new(0.6, 0.45);
G2L["1b"]["Image"] = [[rbxassetid://74254702999755]];
G2L["1b"]["Size"] = UDim2.new(0.22283, 0, 0.3193, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["BackgroundTransparency"] = 1;
G2L["1b"]["Position"] = UDim2.new(0.884, 0, 0.40368, 0);


-- StarterGui.OJTWare.mainframe.ImageLabel.UIAspectRatioConstraint
G2L["1c"] = Instance.new("UIAspectRatioConstraint", G2L["1b"]);
G2L["1c"]["DominantAxis"] = Enum.DominantAxis.Height;
G2L["1c"]["AspectRatio"] = 0.93428;
G2L["1c"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.scriptsearch
G2L["1d"] = Instance.new("TextButton", G2L["4"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["RichText"] = true;
G2L["1d"]["BorderSizePixel"] = 4;
G2L["1d"]["TextSize"] = 14;
G2L["1d"]["TextScaled"] = true;
G2L["1d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1d"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[skid search]];
G2L["1d"]["Name"] = [[scriptsearch]];
G2L["1d"]["Position"] = UDim2.new(-0.02261, 0, 0.34912, 0);


-- StarterGui.OJTWare.mainframe.scriptsearch.LocalScript
G2L["1e"] = Instance.new("LocalScript", G2L["1d"]);



-- StarterGui.OJTWare.mainframe.scriptsearch.UIAspectRatioConstraint
G2L["1f"] = Instance.new("UIAspectRatioConstraint", G2L["1d"]);
G2L["1f"]["AspectRatio"] = 2.36988;
G2L["1f"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.dual ultima rig
G2L["20"] = Instance.new("TextButton", G2L["4"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["RichText"] = true;
G2L["20"]["BorderSizePixel"] = 4;
G2L["20"]["TextSize"] = 25;
G2L["20"]["TextScaled"] = true;
G2L["20"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["20"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[dual solarus rig]];
G2L["20"]["Name"] = [[dual ultima rig]];
G2L["20"]["Position"] = UDim2.new(-0.02261, 0, 0.52105, 0);


-- StarterGui.OJTWare.mainframe.dual ultima rig.LocalScript
G2L["21"] = Instance.new("LocalScript", G2L["20"]);



-- StarterGui.OJTWare.mainframe.dual ultima rig.UIAspectRatioConstraint
G2L["22"] = Instance.new("UIAspectRatioConstraint", G2L["20"]);
G2L["22"]["AspectRatio"] = 2.36988;
G2L["22"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.2016
G2L["23"] = Instance.new("TextButton", G2L["4"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["RichText"] = true;
G2L["23"]["BorderSizePixel"] = 4;
G2L["23"]["TextSize"] = 20;
G2L["23"]["TextScaled"] = true;
G2L["23"]["TextDirection"] = Enum.TextDirection.RightToLeft;
G2L["23"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["23"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[2016]];
G2L["23"]["Name"] = [[2016]];
G2L["23"]["Position"] = UDim2.new(0.23, 0, 0.52105, 0);


-- StarterGui.OJTWare.mainframe.2016.LocalScript
G2L["24"] = Instance.new("LocalScript", G2L["23"]);



-- StarterGui.OJTWare.mainframe.2016.UIAspectRatioConstraint
G2L["25"] = Instance.new("UIAspectRatioConstraint", G2L["23"]);
G2L["25"]["AspectRatio"] = 2.36988;
G2L["25"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.UIGradient
G2L["26"] = Instance.new("UIGradient", G2L["4"]);
G2L["26"]["Rotation"] = 90;


-- StarterGui.OJTWare.mainframe.UIStroke
G2L["27"] = Instance.new("UIStroke", G2L["4"]);
G2L["27"]["Transparency"] = 0.5;
G2L["27"]["Thickness"] = 8;
G2L["27"]["Color"] = Color3.fromRGB(246, 208, 255);


-- StarterGui.OJTWare.mainframe.ImageLabel
G2L["28"] = Instance.new("ImageLabel", G2L["4"]);
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["SliceCenter"] = Rect.new(0.5, 0.5, 0.5, 0.5);
G2L["28"]["ScaleType"] = Enum.ScaleType.Fit;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["ImageTransparency"] = 0.5;
G2L["28"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["28"]["Image"] = [[rbxassetid://112385008195570]];
G2L["28"]["Size"] = UDim2.new(0.22283, 0, 0.3193, 0);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["Position"] = UDim2.new(0.86252, 0, 0.73091, 0);


-- StarterGui.OJTWare.mainframe.ImageLabel.UIAspectRatioConstraint
G2L["29"] = Instance.new("UIAspectRatioConstraint", G2L["28"]);
G2L["29"]["DominantAxis"] = Enum.DominantAxis.Height;
G2L["29"]["AspectRatio"] = 0.93428;
G2L["29"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.UICorner
G2L["2a"] = Instance.new("UICorner", G2L["4"]);
G2L["2a"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.OJTWare.mainframe.remoteabusebutton
G2L["2b"] = Instance.new("TextButton", G2L["4"]);
G2L["2b"]["TextWrapped"] = true;
G2L["2b"]["RichText"] = true;
G2L["2b"]["BorderSizePixel"] = 4;
G2L["2b"]["TextSize"] = 14;
G2L["2b"]["TextScaled"] = true;
G2L["2b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2b"]["Size"] = UDim2.new(0.21739, 0, 0.12281, 0);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Text"] = [[ojt remoteabuse]];
G2L["2b"]["Name"] = [[remoteabusebutton]];
G2L["2b"]["Position"] = UDim2.new(-0.023, 0, 0.698, 0);


-- StarterGui.OJTWare.mainframe.remoteabusebutton.UIAspectRatioConstraint
G2L["2c"] = Instance.new("UIAspectRatioConstraint", G2L["2b"]);
G2L["2c"]["AspectRatio"] = 2.36988;
G2L["2c"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse
G2L["2d"] = Instance.new("Frame", G2L["4"]);
G2L["2d"]["Active"] = true;
G2L["2d"]["BorderSizePixel"] = 20;
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["2d"]["Size"] = UDim2.new(0.447, 0, 1.5, 0);
G2L["2d"]["Position"] = UDim2.new(1.125, 0, -0.42, 0);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(86, 0, 0);
G2L["2d"]["Name"] = [[ojtremoteabuse]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.text
G2L["2e"] = Instance.new("Frame", G2L["2d"]);
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(246, 208, 255);
G2L["2e"]["Size"] = UDim2.new(1.0669, 0, 0.21219, 0);
G2L["2e"]["Position"] = UDim2.new(-0.035, 0, -0.056, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["Name"] = [[text]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.text.UICorner
G2L["2f"] = Instance.new("UICorner", G2L["2e"]);
G2L["2f"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.text.TextLabel
G2L["30"] = Instance.new("TextLabel", G2L["2e"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 30;
G2L["30"]["TextTransparency"] = 0.3;
G2L["30"]["TextScaled"] = true;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
G2L["30"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["BackgroundTransparency"] = 1;
G2L["30"]["RichText"] = true;
G2L["30"]["Size"] = UDim2.new(1.10743, 0, 1.16327, 0);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[real ojt remoteabusing]];
G2L["30"]["Position"] = UDim2.new(0.02572, 0, 0, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.text.TextLabel.UITextSizeConstraint
G2L["31"] = Instance.new("UITextSizeConstraint", G2L["30"]);
G2L["31"]["MaxTextSize"] = 30;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.text.TextLabel.UIAspectRatioConstraint
G2L["32"] = Instance.new("UIAspectRatioConstraint", G2L["30"]);
G2L["32"]["AspectRatio"] = 3.96667;
G2L["32"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.text.UIAspectRatioConstraint
G2L["33"] = Instance.new("UIAspectRatioConstraint", G2L["2e"]);
G2L["33"]["AspectRatio"] = 4.16667;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.version
G2L["34"] = Instance.new("TextLabel", G2L["2d"]);
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["TextSize"] = 14;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["34"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["BackgroundTransparency"] = 1;
G2L["34"]["RichText"] = true;
G2L["34"]["Size"] = UDim2.new(0.27717, 0, 0.08772, 0);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Text"] = [[pre-release 1.1]];
G2L["34"]["Name"] = [[version]];
G2L["34"]["Position"] = UDim2.new(0.6, 0, 0.985, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.UICorner
G2L["35"] = Instance.new("UICorner", G2L["2d"]);
G2L["35"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.UIGradient
G2L["36"] = Instance.new("UIGradient", G2L["2d"]);
G2L["36"]["Rotation"] = 90;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.UIStroke
G2L["37"] = Instance.new("UIStroke", G2L["2d"]);
G2L["37"]["Transparency"] = 0.5;
G2L["37"]["Thickness"] = 8;
G2L["37"]["Color"] = Color3.fromRGB(246, 208, 255);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1
G2L["38"] = Instance.new("Frame", G2L["2d"]);
G2L["38"]["ZIndex"] = 0;
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(201, 201, 201);
G2L["38"]["Size"] = UDim2.new(0.87303, 0, 0.18503, 0);
G2L["38"]["Position"] = UDim2.new(-0.1, 0, 0.05, 0);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Name"] = [[toggle1]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextButton
G2L["39"] = Instance.new("TextButton", G2L["38"]);
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["TextSize"] = 14;
G2L["39"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["39"]["Size"] = UDim2.new(0.21487, 0, 0.33004, 0);
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["Text"] = [[]];
G2L["39"]["Position"] = UDim2.new(1.15, 0, 0.35, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextButton.LocalScript
G2L["3a"] = Instance.new("LocalScript", G2L["39"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextButton.UICorner
G2L["3b"] = Instance.new("UICorner", G2L["39"]);
G2L["3b"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextButton.UIAspectRatioConstraint
G2L["3c"] = Instance.new("UIAspectRatioConstraint", G2L["39"]);
G2L["3c"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.UICorner
G2L["3d"] = Instance.new("UICorner", G2L["38"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextLabel
G2L["3e"] = Instance.new("TextLabel", G2L["38"]);
G2L["3e"]["TextWrapped"] = true;
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["TextSize"] = 14;
G2L["3e"]["TextScaled"] = true;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["BackgroundTransparency"] = 1;
G2L["3e"]["Size"] = UDim2.new(1.0099, 0, 0.99012, 0);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["Text"] = [[edit toggle in the source code]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextLabel.UITextSizeConstraint
G2L["3f"] = Instance.new("UITextSizeConstraint", G2L["3e"]);
G2L["3f"]["MaxTextSize"] = 14;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextLabel.UIAspectRatioConstraint
G2L["40"] = Instance.new("UIAspectRatioConstraint", G2L["3e"]);
G2L["40"]["AspectRatio"] = 1.56667;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.UIAspectRatioConstraint
G2L["41"] = Instance.new("UIAspectRatioConstraint", G2L["38"]);
G2L["41"]["AspectRatio"] = 1.53599;
G2L["41"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2
G2L["42"] = Instance.new("Frame", G2L["2d"]);
G2L["42"]["ZIndex"] = 0;
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(201, 201, 201);
G2L["42"]["Size"] = UDim2.new(0.87303, 0, 0.18503, 0);
G2L["42"]["Position"] = UDim2.new(-0.1, 0, 0.25, 0);
G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["Name"] = [[toggle2]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextButton
G2L["43"] = Instance.new("TextButton", G2L["42"]);
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextSize"] = 14;
G2L["43"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["Size"] = UDim2.new(0.21487, 0, 0.33004, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[]];
G2L["43"]["Position"] = UDim2.new(1.15, 0, 0.35, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextButton.LocalScript
G2L["44"] = Instance.new("LocalScript", G2L["43"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextButton.UICorner
G2L["45"] = Instance.new("UICorner", G2L["43"]);
G2L["45"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextButton.UIAspectRatioConstraint
G2L["46"] = Instance.new("UIAspectRatioConstraint", G2L["43"]);
G2L["46"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.UICorner
G2L["47"] = Instance.new("UICorner", G2L["42"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextLabel
G2L["48"] = Instance.new("TextLabel", G2L["42"]);
G2L["48"]["TextWrapped"] = true;
G2L["48"]["BorderSizePixel"] = 0;
G2L["48"]["TextSize"] = 14;
G2L["48"]["TextScaled"] = true;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["48"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["BackgroundTransparency"] = 1;
G2L["48"]["Size"] = UDim2.new(1.0099, 0, 0.99012, 0);
G2L["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["Text"] = [[edit toggle in the source code]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextLabel.UITextSizeConstraint
G2L["49"] = Instance.new("UITextSizeConstraint", G2L["48"]);
G2L["49"]["MaxTextSize"] = 14;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextLabel.UIAspectRatioConstraint
G2L["4a"] = Instance.new("UIAspectRatioConstraint", G2L["48"]);
G2L["4a"]["AspectRatio"] = 1.56667;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.UIAspectRatioConstraint
G2L["4b"] = Instance.new("UIAspectRatioConstraint", G2L["42"]);
G2L["4b"]["AspectRatio"] = 1.53599;
G2L["4b"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3
G2L["4c"] = Instance.new("Frame", G2L["2d"]);
G2L["4c"]["ZIndex"] = 0;
G2L["4c"]["BorderSizePixel"] = 0;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(201, 201, 201);
G2L["4c"]["Size"] = UDim2.new(0.87303, 0, 0.18503, 0);
G2L["4c"]["Position"] = UDim2.new(-0.1, 0, 0.45, 0);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["Name"] = [[toggle3]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextButton
G2L["4d"] = Instance.new("TextButton", G2L["4c"]);
G2L["4d"]["BorderSizePixel"] = 0;
G2L["4d"]["TextSize"] = 14;
G2L["4d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["4d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4d"]["Size"] = UDim2.new(0.21487, 0, 0.33004, 0);
G2L["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["Text"] = [[]];
G2L["4d"]["Position"] = UDim2.new(1.15, 0, 0.35, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextButton.LocalScript
G2L["4e"] = Instance.new("LocalScript", G2L["4d"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextButton.UICorner
G2L["4f"] = Instance.new("UICorner", G2L["4d"]);
G2L["4f"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextButton.UIAspectRatioConstraint
G2L["50"] = Instance.new("UIAspectRatioConstraint", G2L["4d"]);
G2L["50"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.UICorner
G2L["51"] = Instance.new("UICorner", G2L["4c"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextLabel
G2L["52"] = Instance.new("TextLabel", G2L["4c"]);
G2L["52"]["TextWrapped"] = true;
G2L["52"]["BorderSizePixel"] = 0;
G2L["52"]["TextSize"] = 14;
G2L["52"]["TextScaled"] = true;
G2L["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["52"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["52"]["BackgroundTransparency"] = 1;
G2L["52"]["Size"] = UDim2.new(1.0099, 0, 0.99012, 0);
G2L["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["52"]["Text"] = [[edit toggle in the source code]];


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextLabel.UITextSizeConstraint
G2L["53"] = Instance.new("UITextSizeConstraint", G2L["52"]);
G2L["53"]["MaxTextSize"] = 14;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextLabel.UIAspectRatioConstraint
G2L["54"] = Instance.new("UIAspectRatioConstraint", G2L["52"]);
G2L["54"]["AspectRatio"] = 1.56667;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.UIAspectRatioConstraint
G2L["55"] = Instance.new("UIAspectRatioConstraint", G2L["4c"]);
G2L["55"]["AspectRatio"] = 1.53599;
G2L["55"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button1
G2L["56"] = Instance.new("TextButton", G2L["2d"]);
G2L["56"]["TextWrapped"] = true;
G2L["56"]["RichText"] = true;
G2L["56"]["BorderSizePixel"] = 0;
G2L["56"]["TextSize"] = 14;
G2L["56"]["TextScaled"] = true;
G2L["56"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["56"]["BackgroundColor3"] = Color3.fromRGB(246, 208, 255);
G2L["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["56"]["Size"] = UDim2.new(0.75, 0, 0.3, 0);
G2L["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["56"]["Text"] = [[edit in source code]];
G2L["56"]["Name"] = [[button1]];
G2L["56"]["Position"] = UDim2.new(0.15, 0, 0.68, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button1.LocalScript
G2L["57"] = Instance.new("LocalScript", G2L["56"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button1.UICorner
G2L["58"] = Instance.new("UICorner", G2L["56"]);
G2L["58"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button1.UIAspectRatioConstraint
G2L["59"] = Instance.new("UIAspectRatioConstraint", G2L["56"]);
G2L["59"]["AspectRatio"] = 1.86513;
G2L["59"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button2
G2L["5a"] = Instance.new("TextButton", G2L["2d"]);
G2L["5a"]["TextWrapped"] = true;
G2L["5a"]["RichText"] = true;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["TextSize"] = 14;
G2L["5a"]["TextScaled"] = true;
G2L["5a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(246, 208, 255);
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["5a"]["Size"] = UDim2.new(0.75, 0, 0.3, 0);
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["Text"] = [[edit in source code]];
G2L["5a"]["Name"] = [[button2]];
G2L["5a"]["Position"] = UDim2.new(0.15, 0, 0.85, 0);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button2.LocalScript
G2L["5b"] = Instance.new("LocalScript", G2L["5a"]);



-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button2.UICorner
G2L["5c"] = Instance.new("UICorner", G2L["5a"]);
G2L["5c"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button2.UIAspectRatioConstraint
G2L["5d"] = Instance.new("UIAspectRatioConstraint", G2L["5a"]);
G2L["5d"]["AspectRatio"] = 1.86513;
G2L["5d"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.actualbutton
G2L["5e"] = Instance.new("ImageButton", G2L["1"]);
G2L["5e"]["ImageTransparency"] = 1;
G2L["5e"]["BackgroundTransparency"] = 1;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["ZIndex"] = 19;
G2L["5e"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
G2L["5e"]["Size"] = UDim2.new(0.06589, 0, 0.11734, 0);
G2L["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["Name"] = [[actualbutton]];
G2L["5e"]["Rotation"] = 10;
G2L["5e"]["Position"] = UDim2.new(0.03, 0, 0.83, 0);


-- StarterGui.OJTWare.actualbutton.guilogo
G2L["5f"] = Instance.new("Frame", G2L["5e"]);
G2L["5f"]["BorderSizePixel"] = 10;
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5f"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["5f"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["5f"]["Position"] = UDim2.new(-0.0565, 0, -0.05815, 0);
G2L["5f"]["BorderColor3"] = Color3.fromRGB(210, 0, 0);
G2L["5f"]["Name"] = [[guilogo]];


-- StarterGui.OJTWare.actualbutton.guilogo.LocalScript
G2L["60"] = Instance.new("LocalScript", G2L["5f"]);



-- StarterGui.OJTWare.actualbutton.guilogo.UIAspectRatioConstraint
G2L["61"] = Instance.new("UIAspectRatioConstraint", G2L["5f"]);
G2L["61"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.actualbutton.TextLabel
G2L["62"] = Instance.new("TextLabel", G2L["5e"]);
G2L["62"]["TextWrapped"] = true;
G2L["62"]["BorderSizePixel"] = 0;
G2L["62"]["TextSize"] = 19;
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Italic);
G2L["62"]["TextColor3"] = Color3.fromRGB(86, 0, 0);
G2L["62"]["BorderMode"] = Enum.BorderMode.Middle;
G2L["62"]["BackgroundTransparency"] = 1;
G2L["62"]["RichText"] = true;
G2L["62"]["Size"] = UDim2.new(0.75556, 0, 0.77778, 0);
G2L["62"]["BorderColor3"] = Color3.fromRGB(210, 0, 0);
G2L["62"]["Text"] = [[OJT-Ware]];
G2L["62"]["Rotation"] = -20;
G2L["62"]["Position"] = UDim2.new(0.075, 0, 0.092, 0);


-- StarterGui.OJTWare.actualbutton.TextLabel.UIAspectRatioConstraint
G2L["63"] = Instance.new("UIAspectRatioConstraint", G2L["62"]);
G2L["63"]["DominantAxis"] = Enum.DominantAxis.Height;
G2L["63"]["AspectRatio"] = 0.97143;
G2L["63"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.actualbutton.TextLabel.UITextSizeConstraint
G2L["64"] = Instance.new("UITextSizeConstraint", G2L["62"]);
G2L["64"]["MaxTextSize"] = 20;


-- StarterGui.OJTWare.actualbutton.crown
G2L["65"] = Instance.new("ImageButton", G2L["5e"]);
G2L["65"]["Interactable"] = false;
G2L["65"]["BorderSizePixel"] = 0;
G2L["65"]["BackgroundTransparency"] = 1;
G2L["65"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["65"]["Image"] = [[rbxassetid://97706657411856]];
G2L["65"]["Size"] = UDim2.new(0.24444, 0, 0.27778, 0);
G2L["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["65"]["Name"] = [[crown]];
G2L["65"]["Rotation"] = -40;
G2L["65"]["Position"] = UDim2.new(0.23694, 0, 0.10687, 0);


-- StarterGui.OJTWare.actualbutton.crown.UIAspectRatioConstraint
G2L["66"] = Instance.new("UIAspectRatioConstraint", G2L["65"]);
G2L["66"]["DominantAxis"] = Enum.DominantAxis.Height;
G2L["66"]["AspectRatio"] = 0.88;
G2L["66"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.actualbutton.UIAspectRatioConstraint
G2L["67"] = Instance.new("UIAspectRatioConstraint", G2L["5e"]);
G2L["67"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.hidegui
G2L["68"] = Instance.new("TextButton", G2L["1"]);
G2L["68"]["TextWrapped"] = true;
G2L["68"]["RichText"] = true;
G2L["68"]["BorderSizePixel"] = 5;
G2L["68"]["TextSize"] = 14;
G2L["68"]["TextScaled"] = true;
G2L["68"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["68"]["BackgroundColor3"] = Color3.fromRGB(210, 210, 210);
G2L["68"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["68"]["ZIndex"] = 19;
G2L["68"]["BackgroundTransparency"] = 0.8;
G2L["68"]["Size"] = UDim2.new(0.0183, 0, 0.03259, 0);
G2L["68"]["BorderColor3"] = Color3.fromRGB(210, 0, 0);
G2L["68"]["Text"] = [[hide ojt]];
G2L["68"]["Name"] = [[hidegui]];
G2L["68"]["Rotation"] = 10;
G2L["68"]["Position"] = UDim2.new(0.48984, 0, 0.06815, 0);


-- StarterGui.OJTWare.hidegui.UITextSizeConstraint
G2L["69"] = Instance.new("UITextSizeConstraint", G2L["68"]);
G2L["69"]["MaxTextSize"] = 24;


-- StarterGui.OJTWare.hidegui.UIAspectRatioConstraint
G2L["6a"] = Instance.new("UIAspectRatioConstraint", G2L["68"]);
G2L["6a"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.OJTWare.buttonscript
local function C_2()
local script = G2L["2"];
	local TweenService = game:GetService("TweenService")
	local Frame = script.Parent.mainframe
	local Button = script.Parent.actualbutton
	local openSize = Frame.Size
	local closedSize = UDim2.new(openSize.X.Scale, 0, openSize.Y.Scale, 0)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	Frame.Size = closedSize
	Frame.Visible = false
	
	Button.MouseButton1Click:Connect(function()
		if Frame.Visible then
			local tween = TweenService:Create(Frame, tweenInfo, {Size = closedSize})
			tween:Play()
			tween.Completed:Wait()
			Frame.Visible = false
		else
			Frame.Size = closedSize
			Frame.Visible = true
			TweenService:Create(Frame, tweenInfo, {Size = openSize}):Play()
		end
	end)
	
end;
task.spawn(C_2);
-- StarterGui.OJTWare.hidescript
local function C_3()
local script = G2L["3"];
	local TweenService = game:GetService("TweenService")
	local Frame = script.Parent.actualbutton
	local Button = script.Parent.hidegui
	local openSize = Frame.Size
	local closedSize = UDim2.new(openSize.X.Scale, 0, openSize.Y.Scale, 0)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	Frame.Size = closedSize
	Frame.Visible = true
	
	Button.MouseButton1Click:Connect(function()
		if Frame.Visible then
			local tween = TweenService:Create(Frame, tweenInfo, {Size = closedSize})
			tween:Play()
			tween.Completed:Wait()
			Frame.Visible = false
		else
			Frame.Size = closedSize
			Frame.Visible = true
			TweenService:Create(Frame, tweenInfo, {Size = openSize}):Play()
		end
	end)
	
end;
task.spawn(C_3);
-- StarterGui.OJTWare.mainframe.hideremoteabuse
local function C_5()
local script = G2L["5"];
	local TweenService = game:GetService("TweenService")
	local Frame = script.Parent.ojtremoteabuse
	local Button = script.Parent.remoteabusebutton
	local openSize = Frame.Size
	local closedSize = UDim2.new(openSize.X.Scale, 0, openSize.Y.Scale, 0)
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	Frame.Size = closedSize
	Frame.Visible = false
	
	Button.MouseButton1Click:Connect(function()
		if Frame.Visible then
			local tween = TweenService:Create(Frame, tweenInfo, {Size = closedSize})
			tween:Play()
			tween.Completed:Wait()
			Frame.Visible = false
		else
			Frame.Size = closedSize
			Frame.Visible = true
			TweenService:Create(Frame, tweenInfo, {Size = openSize}):Play()
		end
	end)
	
end;
task.spawn(C_5);
-- StarterGui.OJTWare.mainframe.namelessadmin.LocalScript
local function C_7()
local script = G2L["7"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
	end)
end;
task.spawn(C_7);
-- StarterGui.OJTWare.mainframe.cobalt.LocalScript
local function C_a()
local script = G2L["a"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/rwuj1KWh"))()
	end)
end;
task.spawn(C_a);
-- StarterGui.OJTWare.mainframe.dex.LocalScript
local function C_15()
local script = G2L["15"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/BROgenesis/958c1fee7d8ad100da7f7d020d5d67f3/raw/8dc95caca1b46aa9f4d9dd2433f6be3d9bc69e45/Dex++"))()
	end)
end;
task.spawn(C_15);
-- StarterGui.OJTWare.mainframe.ImageLabel.LocalScript
local function C_19()
local script = G2L["19"];
	local frame = script.Parent
	local tweenService = game:GetService ("TweenService")
	
	local info = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false, 0)
	
	tweenService:Create(frame, info, {Rotation = -360}) :Play()
end;
task.spawn(C_19);
-- StarterGui.OJTWare.mainframe.scriptsearch.LocalScript
local function C_1e()
local script = G2L["1e"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/9dkYNWDT"))()
	end)
end;
task.spawn(C_1e);
-- StarterGui.OJTWare.mainframe.dual ultima rig.LocalScript
local function C_21()
local script = G2L["21"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/DualSolarisV2.luau"))()
	end)
end;
task.spawn(C_21);
-- StarterGui.OJTWare.mainframe.2016.LocalScript
local function C_24()
local script = G2L["24"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
			-- if you are on mobile this MIGHT not work (it's not tested on mobile)
		-- if this breaks on some games please tell me what games they break on
	
		getgenv().Config2016 = ({
			OldConsole = true,
			OldGraphics = true,
			OldPlayerList = true,
			OldBubbleChat = true,
	
			ReplaceAgeGroupMessage = true,
			HideVoiceChatButton = false,
		})
	
		loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/projects/refs/heads/main/UI/Core2016/Source.luau"))()
	end)
end;
task.spawn(C_24);
-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle1.TextButton.LocalScript
local function C_3a()
local script = G2L["3a"];
	local button = script.Parent
	local label = script.Parent.Parent
	local isRunning = false
	
	button.MouseButton1Down:Connect(function()
		isRunning = not isRunning
	
		if isRunning then
			button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			while isRunning do
				-- ojts PUT YOUR CODE/SCRIPT HERE
			end
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	end)
end;
task.spawn(C_3a);
-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle2.TextButton.LocalScript
local function C_44()
local script = G2L["44"];
	local button = script.Parent
	local label = script.Parent.Parent
	local isRunning = false
	
	button.MouseButton1Down:Connect(function()
		isRunning = not isRunning
	
		if isRunning then
			button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			while isRunning do
				-- ojts PUT YOUR CODE/SCRIPT HERE
			end
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	end)
end;
task.spawn(C_44);
-- StarterGui.OJTWare.mainframe.ojtremoteabuse.toggle3.TextButton.LocalScript
local function C_4e()
local script = G2L["4e"];
	local button = script.Parent
	local label = script.Parent.Parent
	local isRunning = false
	
	button.MouseButton1Down:Connect(function()
		isRunning = not isRunning
	
		if isRunning then
			button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			while isRunning do
				-- ojts PUT YOUR CODE/SCRIPT HERE
			end
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	end)
end;
task.spawn(C_4e);
-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button1.LocalScript
local function C_57()
local script = G2L["57"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		-- ojts PUT YOUR CODE/SCRIPT HERE
	end)
end;
task.spawn(C_57);
-- StarterGui.OJTWare.mainframe.ojtremoteabuse.button2.LocalScript
local function C_5b()
local script = G2L["5b"];
	local test = script.Parent
	local frame = test.Parent
	
	test.MouseButton1Click:Connect(function()
		-- ojts PUT YOUR CODE/SCRIPT HERE
	end)
end;
task.spawn(C_5b);
-- StarterGui.OJTWare.actualbutton.guilogo.LocalScript
local function C_60()
local script = G2L["60"];
	local frame = script.Parent
	local tweenService = game:GetService ("TweenService")
	
	local info = TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false, 0)
	
	tweenService:Create(frame, info, {Rotation = 360}) :Play()
end;
task.spawn(C_60);

return G2L["1"], require;
