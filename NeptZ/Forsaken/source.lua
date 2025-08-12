_G.yeaican = false
if not _G.yeaican then
    if _G.ialreadyloadedit then
        print("bro, fuck no")
		return
    else
        _G.ialreadyloadedit = true
    end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/assets/refs/heads/main/lib.lua"))()
local window = library.Window("NeptZ", "Forsaken")
local mainTab = window.Tab("Main")
local generatorsSection = mainTab.Section("Generators")
local killersSection = mainTab.Section("Killers")
local survivorsSection = mainTab.Section("Survivors")
local itemsSection = mainTab.Section("Items")

local generatorsDid = {}

local kasjdkasjda = true

generatorsSection.Toggle("Generators ESP", function(bool)
    _G.generators = bool
    task.spawn(function()
        while task.wait() do
            if _G.generators then
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v.Name == "Generator" and not v:FindFirstChild("iskiddedfromneptz") then
                            local hl = Instance.new("Highlight", v)
                            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            hl.Name = "iskiddedfromneptz"
                            hl.FillColor = Color3.fromRGB(255, 255, 51)
                        elseif v:FindFirstChild("iskiddedfromneptz") and v.Name == "Generator" then
                            if v.Progress.Value >= 100 then
                                v.iskiddedfromneptz.FillColor = Color3.fromRGB(0, 255, 0)
                            end
                        end
                    end
                end)
            else
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v.Name == "Generator" and v:FindFirstChild("iskiddedfromneptz") then
                            v.iskiddedfromneptz:Destroy()
                        end
                    end
                end)
                break
            end
        end
    end)
end)
generatorsSection.Toggle("Instant Generator", function(bool)
    _G.instantGenerator = bool
    if _G.instantGenerator and kasjdkasjda then
        pcall(function()
            local mao = workspace.Map.Ingame:WaitForChild("Map")
            for i, v in pairs(mao:GetChildren()) do
                if not generatorsDid[v] and v.Name == "Generator" then
                    generatorsDid[v] = true
                    local old; old = hookfunction(getsenv(v.Scripts.Client).toggleGeneratorState, function(a)
                        if not _G.instantGenerator then return old(a) end
                        print("wahr", a)
                        if a ~= "enter" then return old("leave") end
                        old("enter")
                        for i = 1, 4 do
                            game.StarterGui:SetCore("SendNotification",
                                { Title = "generator", Text = tostring(i), Duration = 9 })
                            v.Remotes.RE:FireServer()
                            task.wait(2.5)
                        end
                        return ""
                    end)
                end
            end 
        end)
    end
end)

workspace.Map.Ingame.ChildAdded:Connect(function(v)
    if not _G.instantGenerator then return end
    if v.Name ~= "Map" then return end
    kasjdkasjda = false
    wait(0.2)
    pcall(function()
        for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
            if not generatorsDid[v] and v.Name == "Generator" then
                generatorsDid[v] = true
                local old; old = hookfunction(getsenv(v.Scripts.Client).toggleGeneratorState, function(a)
                    print("wahr", a)
                    if a ~= "enter" then return old("leave") end
                    old("enter")
                    for i = 1, 4 do
                        game.StarterGui:SetCore("SendNotification",
                            { Title = "generator", Text = tostring(i), Duration = 9 })
                        v.Remotes.RE:FireServer()
                        task.wait(2.5)
                    end
                    return ""
                end)
            end
        end
    end)
end)
workspace.Map.Ingame.ChildRemoved:Connect(function (v)
    if v.Name ~= "Map" then return end
    kasjdkasjda = true
end)

killersSection.Toggle("Killer ESP", function(bool)
    _G.killers = bool
    task.spawn(function()
        while task.wait() do
            if _G.killers == true then
                for i, v in pairs(workspace.Players.Killers:GetChildren()) do
                    if not v:FindFirstChild("iskiddedfromneptz") then
                        local hl = Instance.new("Highlight", v)
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Name = "iskiddedfromneptz"
                    end
                end
            else
                for i, v in pairs(workspace.Players.Killers:GetChildren()) do
                    if v:FindFirstChild("iskiddedfromneptz") then
                        v.iskiddedfromneptz:Destroy()
                    end
                end
                break
            end
        end
    end)
end)
survivorsSection.Toggle("Survivors ESP", function(bool)
    _G.survivors = bool
    task.spawn(function()
        while task.wait() do
            if _G.survivors == true then
                for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
                    if not v:FindFirstChild("iskiddedfromneptz") then
                        local hl = Instance.new("Highlight", v)
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Name = "iskiddedfromneptz"
                        hl.FillColor = Color3.fromRGB(0, 0, 255)
                    end
                end
            else
                for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
                    if v:FindFirstChild("iskiddedfromneptz") then
                        v.iskiddedfromneptz:Destroy()
                    end
                end
                break
            end
        end
    end)
end)
itemsSection.Toggle("Items ESP", function(bool)
    _G.items = bool
    task.spawn(function()
        while task.wait() do
            if _G.items == true then
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v:IsA("Tool") and not v:FindFirstChild("iskiddedfromneptz") then
                            local hl = Instance.new("Highlight", v)
                            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            hl.Name = "iskiddedfromneptz"
                            hl.FillColor = Color3.fromRGB(0, 255, 255)
                        end
                    end
                end)
            else
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v:IsA("Tool") and v:FindFirstChild("iskiddedfromneptz") then
                            v.iskiddedfromneptz:Destroy()
                        end
                    end
                end)
                break
            end
        end
    end)
end)
local playerTab = window.Tab("Local Player")
playerTab.Section("Stamina").Button("Infinite Stamina", function()
    require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.MaxStamina = 9999
    require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.StaminaLoss = 0
    game.StarterGui:SetCore("SendNotification",
        { Title = "warning", Text = "this effect wont apply until next round, but you only have to press it once this entire session", Duration = 9 })
end)

local speedSection = playerTab.Section("Speed")
local yeahvariable = 0
speedSection.Slider("Speed (Bypass)", 16, 16, 100, function (s)
    yeahvariable = s
end)
speedSection.Toggle("Speed Toggle", function (s)
    _G.mhhmmm = s
    task.spawn(function ()
        local localPlayer = game:GetService("Players").LocalPlayer
        while task.wait() do
            if not _G.mhhmmm then break end
            local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.MoveDirection ~= Vector3.zero then
                localPlayer.Character:TranslateBy(humanoid.MoveDirection * (yeahvariable / 10) * game:GetService("RunService").RenderStepped:Wait() * 10)
            end
        end
    end)
end)
playerTab.Section("Noclip").Toggle("Enable Noclip [⚠️]", function (s)
    if s == true then
         game.StarterGui:SetCore("SendNotification",
        { Title = "KICK WARNING", Text = "you WILL get kicked if you are inside a wall for more than a second! only use for small shortcuts", Duration = 9 })
    end
    _G.nokia = s
    local cachey = {}
    task.spawn(function ()
        local localPlayer = game:GetService("Players").LocalPlayer
        while task.wait() do
            if not _G.nokia then
                for i, v in pairs(cachey) do
                    v.CanCollide = true
                end
                break
            end
            if localPlayer.Character then
                for i, v in pairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        cachey[v] = v
                        v.CanCollide = false
                    end
                end
            end
        end
    end)
end)

local killerTab = window.Tab("Killer")
local killerSection = killerTab.Section("Killer")
killerSection.Toggle("Spectate Killer", function (state)
    if state then
        local killer = workspace.Players.Killers:GetChildren()[1]
        if killer then
            workspace.CurrentCamera.CameraSubject = killer
        end
    else
        pcall(function()
            workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
        end)
    end
end)
killerSection.Button("Teleport To Killer", function ()
    local killer = workspace.Players.Killers:GetChildren()[1]
    if killer then
        pcall(function ()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = killer.PrimaryPart.CFrame
        end)
    end
end)
killerSection.Button("Kill All [KILLER TEAM]", function()
    for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
        local name = v:GetAttribute("Username")
        local plr = game.Players:FindFirstChild(name)
        if not plr then continue end
        local skipTimeout = tick()
        while skipTimeout - tick() <= 10 do
            if game.Players:FindFirstChild(name) == nil then break end
            if plr.Character == nil then break end
            if plr.Character:FindFirstChild("Humanoid") == nil then break end
            if plr.Character.Humanoid.Health <= 0 then break end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility",
                "Slash")
            task.wait()
        end
    end
end)

local teleportsTab = window.Tab("Teleport")
local generatorsSection = teleportsTab.Section("Generators")
for i = 1, 5 do
    generatorsSection.Button("TP to generator " .. i, function ()
        pcall(function ()
            local gens = {}
            for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    table.insert(gens, v)
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gens[i].PrimaryPart.CFrame + Vector3.new(0, 10, 0)
        end)
    end)
end
