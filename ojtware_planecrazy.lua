local SimpleLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/IcantAffordSynapse/SimpleLib/refs/heads/main/SimpleLib.lua"))()

local Window = SimpleLib:Window("OJT-Engine: Plane Crazy")

local Tab1 = Window:AddSection("OJT-Ware 1.4")

Tab1:Label("you know the drill intern, just get it done")

Tab1:Button("Execute", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hypotisctic/ojteyesonlycuddy/refs/heads/main/menusource.lua"))()
end)

Tab1:Label("Rejoin game")

Tab1:Button("Execute", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
end)

local Tab1 = Window:AddSection("Auto Build")

Tab1:Label("Also another SimpleLib GUI, so don't minimize!")

Tab1:Label("Features Honda Civic and Toyota Hilux")

Tab1:Button("Execute", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hypotisctic/ojteyesonlycuddy/refs/heads/main/ignoregui.lua"))()
end)

local Tab1 = Window:AddSection("Gamepasses")

Tab1:Label("Free gravity slider, drag selector and paint bucket")

Tab1:Label("NOTICE: You will rejoin! SAVE YOUR SHIT FIRST")

Tab1:Button("Execute", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/sametcetinkaya1447/planecrazy2/refs/heads/main/folder/gamepasses.lua'))()
end)

local Tab1 = Window:AddSection("Build Scripts")

Tab1:Label("All my scripts that animate/manipulate parts from your build")

Tab1:Label("Make sure to have the corresponding templates from PCSC or the creators")

Tab1:Button("Execute", function()
    local Window = SimpleLib:Window("Plane Crazy Build Scripts")

    local Tab1 = Window:AddSection("Spider Mech")

    Tab1:Label("Spider Mech, self explanatory")

    Tab1:Label("MAKE SURE TO HAVE THE TEMPLATE FROM SAMET")

    Tab1:Button("Execute", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/hypotisctic/ojteyesonlycuddy/refs/heads/main/ignore.lua'))()
    end)

    local Tab1 = Window:AddSection("Compliance Drone/Mech")

    Tab1:Label("Make sure to have the template from PCSC")

    Tab1:Button("Execute", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/sametcetinkaya1447/planecrazy2/refs/heads/main/ikmech.lua'))()
    end)

    local Tab1 = Window:AddSection("HS Missile")

    Tab1:Label("Loads another GUI, fyi")

    Tab1:Button("Execute", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zainmorgan09-dotcom/Missile-Script/70530e6d1fc05e690c9dfd5671d60d8f661b43ce/Missile%20Script"))()
    end)

    local Tab1 = Window:AddSection("Hand")

    Tab1:Label("Animates a hand, guess the keybinds man idfk")

    Tab1:Button("Execute", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/sametcetinkaya1447/planecrazy2/refs/heads/main/masterhand.lua'))()
    end)
end)
