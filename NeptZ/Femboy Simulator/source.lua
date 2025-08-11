-- // UI Setup \\
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/assets/refs/heads/main/lib.lua"))()
local window = library.Window("NeptZ", "Femboy Sim")
local mainTab = window.Tab("Auto Farm")
local mainSection = mainTab.Section("Auto Click")
local obbySection = mainTab.Section("Obby")

mainSection.Toggle("Auto Click Astolfo", function(bool)
    _G.funsimulator = bool
    while _G.funsimulator and task.wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click"):FireServer()
    end
end)
mainSection.Toggle("Auto Buy Worker", function (bool)
    _G.yes = bool
    while _G.yes and task.wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("HireWorker"):FireServer()
    end
end)
mainSection.Toggle("Auto Buy Enchants", function (bool)
    _G.yes = bool
    while _G.yes and task.wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RollEnchant"):InvokeServer()
    end
end)
obbySection.Button("Complete Obby (Has cooldown)", function ()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Claim.TouchInterest, 0)
end)

local miscTab = window.Tab("Misc")
local miscSection = miscTab.Section("Teleports")
miscSection.Button("Teleport To Femboy", function ()
    pcall(function ()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3, 869, 18)
    end)
end)

miscSection.Button("Teleport To Upgrades", function ()
    pcall(function ()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Shop.Hitbox, 0)
    end)
end)
local buttonsSection = miscTab.Section("Buttons")
local upgrades = {
    "Astolfo's Blessing",
    "Estrogen Booster",
    "Cat Paw",
    "Fem Power",
    "Pride Flag",
    "Ultra Godly Feminine Boy Power",
    "Boo's Femininity",
    "Deuteronomy 22:5",
    "CheckProfileGame's Heart",
    "Aramantis' Hole"
}
for i, v in pairs(upgrades) do
    buttonsSection.Button("Buy " .. v:sub(1, 15) .. (#v > 15 and "..." or ""), function ()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyUpgrade"):FireServer(v)
    end)
end
