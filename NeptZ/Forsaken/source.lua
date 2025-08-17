-- switched the ui for something cleaner
-- small changes to auto generator (will now check if it actually started using it, also twice as fast literally)
-- added misc tab (Allow Jump, 	No Fog, Reset Character, Rejoin)
-- added inf jump (pretty shit lmao)
-- fixed kill all not stopping after being stuck on the same player for more than 15 seconds
-- added auto block 1x1x1x1 poups
-- added auto start generator
-- added generator nametags
-- added auto coin flip

_G.yeaican = false
if not _G.yeaican then
    if _G.ialreadyloadedit then
        print("bro, fuck no")
		return
    else
        _G.ialreadyloadedit = true
    end
end
--writefile("banger.mp3", game:HttpGet("https://github.com/fuckg1thub/assets/raw/refs/heads/main/banger.mp3"))

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/Fluent-Inspired-UI/refs/heads/main/fiui.luau"))()
local window = library.Window("NXP hub (V1)", "Forsaken", "rbxassetid://118689160394652", false, Color3.fromRGB(150, 63, 204))
local mainTab = window:Tab("Main", "rbxassetid://101966922795157")
local generatorsSection = mainTab:AddSection("Generators")
local killersSection = mainTab:AddSection("Killers")
local survivorsSection = mainTab:AddSection("Survivors")
local itemsSection = mainTab:AddSection("Items")

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
generatorsSection.Toggle("Generators Nametags", function(bool)
    _G.generatorstag = bool
    task.spawn(function()
        while task.wait() do
            if _G.generatorstag then
                local suc, res=  pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v.Name == "Generator" and not v:FindFirstChild("nametag") then
                            local bb = Instance.new("BillboardGui", v)
                            bb.Size = UDim2.new(4, 0, 1, 0)
                            bb.AlwaysOnTop = true
                            bb.Name = "nametag"
                            local text = Instance.new("TextLabel", bb)
                            text.TextColor3 = Color3.fromRGB(255, 255, 255)
                            text.TextStrokeTransparency = 0
                            text.Text = "Generator (" .. v.Progress.Value .. "%)"
                            text.TextSize = 20
                            text.BackgroundTransparency = 1
                            text.Size = UDim2.new(1, 0, 1, 0)
                        elseif v:FindFirstChild("nametag") and v.Name == "Generator" then
                            v.nametag.TextLabel.Text = "Generator (" .. v.Progress.Value .. "%)"
                        end
                    end
                end)
                print(suc, res)
            else
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v.Name == "Generator" and v:FindFirstChild("nametag") then
                            v.nametag:Destroy()
                        end
                    end
                end)
                break
            end
        end
    end)
end)
local activelyAutoing = false
generatorsSection.Toggle("Auto Complete Generator", function(bool)
    _G.instantGenerator = bool
    task.spawn(function()
        while _G.instantGenerator and task.wait() do
            if workspace.Map.Ingame:FindFirstChild("Map") then
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if not generatorsDid[v] and v.Name == "Generator" then
                            generatorsDid[v] = true
                            local old; old = hookfunction(getsenv(v.Scripts.Client).toggleGeneratorState, function(a)
                                if checkcaller() then return old(a) end
                                if not _G.instantGenerator then return old(a) end
                                if a ~= "enter" then return old("leave") end
                                local ou = v.Remotes.RF:InvokeServer("enter")
                                if ou ~= "fixing" then return end
                                activelyAutoing = true
                                for i = 1, 4 do
                                    if v.Progress.Value >= 100 then break end
                                    game.StarterGui:SetCore("SendNotification",
                                        { Title = "generator", Text = tostring(i), Duration = 9 })
                                    v.Remotes.RE:FireServer()
                                    task.wait(1.2)
                                end
                                activelyAutoing = false
                                return ""
                            end)
                        end
                    end
                end)
            end
        end
    end)
end)

generatorsSection.Toggle("Auto Start Generator", function(bool)
    _G.autoGen = bool
    task.spawn(function()
        while _G.autoGen and task.wait() do
            if workspace.Map.Ingame:FindFirstChild("Map") then
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                        if v.Name == "Generator" then
                            pcall(function ()
                                local function continue()
                                    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then return end
                                    if activelyAutoing then return end
                                    if v.Main:FindFirstChild("Prompt") then
                                        fireproximityprompt(v.Main.Prompt)
                                    end
                                    task.wait(1)
                                end
                                local hello = v.Positions.Center.Position
                                local hello2 = v.Positions.Right.Position
                                local hello3 = v.Positions.Left.Position
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hello).magnitude <= 4 then
                                    continue()
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hello2).magnitude <= 4 then
                                    continue()
                                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hello3).magnitude <= 4 then
                                    continue()
                                end
                            end)
                        end
                    end
                end)
            end
        end
    end)
end)
-- game:GetService("Players").LocalPlayer.PlayerGui.TemporaryUI:GetChildren()[12]

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
survivorsSection.Toggle("Auto Coin Flip", function (cool)
    _G.coin = cool
    task.spawn(function ()
        while _G.coin and task.wait(2.1) do
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "CoinFlip")
        end
    end)
end)
itemsSection.Toggle("Items ESP", function(bool)
    _G.items = bool
    task.spawn(function()
        while task.wait() do
            if _G.items == true then
                pcall(function()
                    for i, v in pairs(workspace.Map.Ingame:GetDescendants()) do
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
local playerTab = window:Tab("Local Player", "rbxassetid://73140121358767")
playerTab:AddSection("Stamina").Button("Infinite Stamina", function()
    require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.MaxStamina = 9999
    require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.StaminaLoss = 0
    game.StarterGui:SetCore("SendNotification",
        { Title = "warning", Text = "this effect wont apply until next round, but you only have to press it once this entire session", Duration = 9 })
end)

local speedSection = playerTab:AddSection("Speed")
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
                localPlayer.Character:TranslateBy(humanoid.MoveDirection * yeahvariable * game:GetService("RunService").RenderStepped:Wait())
            end
        end
    end)
end)
playerTab:AddSection("Noclip").Toggle("Enable Noclip [⚠️]", function (s)
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
playerTab:AddSection("Infinite Jump").Toggle("Infinite Jump", function (s)
    if s == false then
        return _G.connection:Disconnect()
    end
    _G.connection = game:GetService("UserInputService").JumpRequest:Connect(function ()
        pcall(function ()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end)
end)

local killerTab = window:Tab("Killer", "rbxassetid://83038806046146")
local killerSection = killerTab:AddSection("Killer")
killerSection.Toggle("Allow Killer Entrances as survivor", function (call)
    _G.killerent = call
    local function s9audioak()
        for i, v in pairs(workspace.Map.Ingame.Map.KillerOnlyEntrances:GetChildren()) do
            v.CanCollide = true
        end
    end
    if not _G.killerent then
        pcall(s9audioak)
        return
    end
    task.spawn(function ()
        while _G.killerent and task.wait() do
            if not workspace.Map.Ingame:FindFirstChild("Map") then continue end
            if not workspace.Map.Ingame.Map:FindFirstChild("KillerOnlyEntrances") then continue end
            if not _G.killerent then
                pcall(s9audioak)
                break
            end
            pcall(function ()
                for i, v in pairs(workspace.Map.Ingame.Map.KillerOnlyEntrances:GetChildren()) do
                    v.CanCollide = false
                end
            end)
        end
    end)
end)
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
        while tick() - skipTimeout <= 15 do
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

local teleportsTab = window:Tab("Teleport", "rbxassetid://100658585674886")
local generatorsSection = teleportsTab:AddSection("Generators")
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
local miscTab = window:Tab("Misc", "rbxassetid://85291691462928")
local miscSection = miscTab:AddSection("Miscallenous")
miscSection.Toggle("Allow Jump [⚠️]", function (s)
    _G.mhhmmm2 = s
    if s then
         game.StarterGui:SetCore("SendNotification",
        { Title = "KICK WARNING", Text = "WARNING jumping repeatedly will KICK YOU because the game will think you are flying!", Duration = 9 })
    end
    task.spawn(function ()
        local localPlayer = game:GetService("Players").LocalPlayer
        while task.wait() do
            if not _G.mhhmmm2 then break end
            local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.JumpPower = 50
            end
        end
    end)
end)
miscSection.Button("No Fog", function ()
	for i,v in pairs(game.Lighting:GetDescendants()) do
        if not v:IsA("Atmosphere") then continue end
		v:Destroy()
	end
    game.Lighting.FogEnd = 999999
end)
miscSection.Button("Kill Yourself", function ()
    pcall(function ()
        game.Players.LocalPlayer.Character:BreakJoints()
    end)
end)
miscSection.Button("Rejoin", function ()
    pcall(function ()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.localPlayer)
    end)
end)
miscTab:AddSection("Popups").Toggle("Auto Remove 1x1x1x1 popups", function (bool)
    _G.no1x= bool
    task.spawn(function ()
        while _G.no1x and task.wait() do
            local temp = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
            if temp and temp:FindFirstChild("1x1x1x1Popup") then
                temp["1x1x1x1Popup"]:Destroy()
                warn("yes its gone")
            end
        end
    end)
end)
--[[
    game.StarterGui:SetCore("SendNotification",
        { Title = "banger musik", Text = "u have activated super secrekt banger music feature ✅✅ only u hear it btw", Duration = 20 })
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = getcustomasset("banger.mp3")
    sound.EmitterSize = 5000
    sound.Looped = true
    sound:Play()
end]]
