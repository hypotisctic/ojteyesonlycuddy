# ojteyesonlycuddy
ily vaehz

this is my first "gui" i cant rlly make my own scripts except for stuff in like brainrot games

FOR ME:

remember to replace -- StarterGui.OJTWare with this:

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function createGui(parent)
    local gui = Instance.new("ScreenGui")
    gui.Name = [[OJTWare]]
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.Parent = parent
    return gui
end

if not StarterGui:FindFirstChild("OJTWare") then
    createGui(StarterGui)
end

G2L["1"] = playerGui:FindFirstChild("OJTWare")
if not G2L["1"] then
    local starterGui = StarterGui:FindFirstChild("OJTWare")
    if starterGui then
        G2L["1"] = starterGui:Clone()
        G2L["1"].ResetOnSpawn = false
        G2L["1"].Parent = playerGui
    else
        G2L["1"] = createGui(playerGui)
    end
end

player.CharacterAdded:Connect(function()
    task.wait(0.1)
    if not playerGui:FindFirstChild("OJTWare") then
        local starterGui = StarterGui:FindFirstChild("OJTWare")
        if starterGui then
            local cloneGui = starterGui:Clone()
            cloneGui.ResetOnSpawn = false
            cloneGui.Parent = playerGui
        end
    end
end)
