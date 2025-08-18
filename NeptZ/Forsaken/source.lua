-- // CHANGELOG (Oldest To Newest) \\ --
    -- switched the ui for something cleaner
    -- small changes to auto generator (will now check if it actually started using it, also twice as fast literally)
    -- added misc tab (Allow Jump, 	No Fog, Reset Character, Rejoin)
    -- added inf jump (pretty shit lmao)
    -- fixed kill all not stopping after being stuck on the same player for more than 15 seconds
    -- added auto block 1x1x1x1 poups
    -- added auto start generator
    -- added generator nametags
    -- added auto coin flip
    -- added enter killer only entrances as survivor (FORGOT TO LIST THIS)
    -- fixed generator teleports going into walls and leading to getting kicked
    -- added cool load thingy when executing
    -- added teleport to random survivor
    -- added always sprint
    -- added fast sprint (configurable using a slider)
    -- added aimbot (chance/coolkid)
    -- added emote as killer
    -- added complete active generator (button)
    -- added teleport to random item
    -- fixed aimbot on killer locking on even if not visible on the screen
    -- added auto pick up near items
    -- added pick up all items
    -- added complete all generators

--[[
                               $$\                                                                 $$\            $$\               
                               $$ |                                                                \__|           $$ |              
$$$$$$$\   $$$$$$\   $$$$$$\ $$$$$$\   $$\   $$\ $$$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$$\  $$$$$$\  $$\  $$$$$$\ $$$$$$\    $$$$$$$\ 
$$  __$$\ $$  __$$\ $$  __$$\\_$$  _|  $$ |  $$ |$$  __$$\ $$  __$$\ $$  _____|$$  _____|$$  __$$\ $$ |$$  __$$\\_$$  _|  $$  _____|
$$ |  $$ |$$$$$$$$ |$$ /  $$ | $$ |    $$ |  $$ |$$ |  $$ |$$$$$$$$ |\$$$$$$\  $$ /      $$ |  \__|$$ |$$ /  $$ | $$ |    \$$$$$$\  
$$ |  $$ |$$   ____|$$ |  $$ | $$ |$$\ $$ |  $$ |$$ |  $$ |$$   ____| \____$$\ $$ |      $$ |      $$ |$$ |  $$ | $$ |$$\  \____$$\ 
$$ |  $$ |\$$$$$$$\ $$$$$$$  | \$$$$  |\$$$$$$  |$$ |  $$ |\$$$$$$$\ $$$$$$$  |\$$$$$$$\ $$ |      $$ |$$$$$$$  | \$$$$  |$$$$$$$  |
\__|  \__| \_______|$$  ____/   \____/  \______/ \__|  \__| \_______|\_______/  \_______|\__|      \__|$$  ____/   \____/ \_______/ 
                    $$ |                                                                               $$ |                         
                    $$ |                                                                               $$ |                         
                    \__|                                                                               \__|                             
            
    THIS SCRIPT WAS MADE BY NEPTUNESCRIPTS         THIS SCRIPT WAS MADE BY NEPTUNESCRIPTS         THIS SCRIPT WAS MADE BY NEPTUNESCRIPTS
        Pasting from this script is NOT allowed!!!!! If you want to take a feature from this script GIVE ME FUCKING CREDIT
]]

--getgenv().NXP_LOADED = false
if getgenv().NXP_LOADED then
    error("Already loaded!")
end
getgenv().NXP_LOADED = true

loadstring(game:HttpGet("https://pastefy.app/UoGeqUn1/raw"))()(
    "Forsaken",
    "Forsaken script by neptunescripts!\nrscripts: @ntu\nscriptblox: @newdiscordacount129"
).Wait()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/Fluent-Inspired-UI/refs/heads/main/fiui.luau"))()
local window = library.Window("NXP hub (V1)", "Forsaken", "rbxassetid://118689160394652", false, Color3.fromRGB(150, 63, 204))

local isKiller, isSurvivor, killerModel 
do
    local info = window:Tab("Read Me", "rbxassetid://110938791000175")
    local sec = info:AddSection("Icon Meaning")
    for i, v in pairs({
        ["💻"] = "the feature ONLY works on a computer",
        ["⚠️"] = "the feature is VERY RISKY!",
        ["⚙️"] = "the feature should be configured",
        ["📜"] = "the feature may not not work on bad executors",
    }) do
        sec.Button(i .. " " .. v, function() end)
    end
    local credits = info:AddSection("Credits")
    credits.Button("💞 Made by neptunescripts!", function() end)
    credits.Button("🔗 Rscripts @ntu", function() setclipboard("https://rscripts.net/@ntu") end)
    credits.Button("🔗 Scriptblox @newdiscordacount129", function() setclipboard("https://scriptblox.com/u/newdiscordacount129") end)

    task.spawn(function()
        while task.wait() do
            isKiller = (function()
                for i, v in pairs(workspace.Players.Killers:GetChildren()) do
                    if v:GetAttribute("Username") and game.Players:FindFirstChild(v:GetAttribute("Username")) then
                        killerModel = v
                    end
                    if v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
                        return true
                    end
                end
            end)()
            isSurvivor = not isKiller
        end
    end)
end

local function getClosestSurvivorToMouse(x, y)
    local closestDistance = math.huge
    local closestSurvivor = nil
    local cam = workspace.CurrentCamera
    for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
        if v:GetAttribute("Username") == game.Players.LocalPlayer.Name then continue end
        local nihpos = v.HumanoidRootPart.Position
        local vector, onScreen = cam:worldToViewportPoint(nihpos)
        if onScreen then
            local mag = (Vector2.new(x, y) - Vector2.new(vector.X, vector.Y)).magnitude
            if mag < closestDistance then
                closestDistance = mag
                closestSurvivor = v
            end
        end
    end
    return closestSurvivor
end

local mainTab = window:Tab("Main", "rbxassetid://101966922795157")
local generatorsSection = mainTab:AddSection("Generators")
local killersSection = mainTab:AddSection("Killers")
local survivorsSection = mainTab:AddSection("Survivors")
local itemsSection = mainTab:AddSection("Items")
local aimbotSection = mainTab:AddSection("Aimbot")

local generatorsDid = {}
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
                --print(suc, res)
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
generatorsSection.Toggle("Auto Complete Generator [📜]", function(bool)
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
                                    game.StarterGui:SetCore("SendNotification", { Title = "generator", Text = tostring(i), Duration = 9 })
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

generatorsSection.Button("Complete Active Generator", function ()
    if activelyAutoing then return end
    pcall(function()
        for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
            if v.Name == "Generator" then
                pcall(function ()
                    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                        local hello = v.Positions.Center.Position
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hello).magnitude <= 21 then
                            for i = 1, 4 do
                                if v.Progress.Value >= 100 then break end
                                if activelyAutoing then return end
                                if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then break end
                                game.StarterGui:SetCore("SendNotification", { Title = "generator", Text = tostring(i), Duration = 9 })
                                v.Remotes.RE:FireServer()
                                task.wait(1.2)
                            end
                        end
                    end
                end)
            end
        end
    end)
end)
generatorsSection.Button("Complete All Generators", function ()
    if activelyAutoing then return end
    pcall(function()
        for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
            if v.Name == "Generator" then
                pcall(function ()
                    if v.Progress.Value >= 100 then return end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Center.CFrame
                    task.wait(0.2)
                    v.Remotes.RF:InvokeServer("enter")
                    for j = 1, 4 do
                        if v.Progress.Value >= 100 then break end
                        if activelyAutoing then return end
                        game.StarterGui:SetCore("SendNotification", { Title = "generator", Text = tostring(j), Duration = 9 })
                        v.Remotes.RE:FireServer()
                        task.wait(1.2)
                    end
                end)
            end
        end
    end)
end)
--[[
todo: add chance silent aim
local args = {
	"USERNAMEChanceFireShot",
	vector.create(-0.8255635499954224, 1.2309562258394635e-08, 0.5643091797828674)
}
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
]]
local aimbotHeld = false
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function (i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHeld = true
    end
end)
uis.InputEnded:Connect(function (i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHeld = false
    end
end)
aimbotSection.Toggle("Aimbot [💻]", function (bool)
    _G.aimbot = bool
    if bool then
        game.StarterGui:SetCore("SendNotification", { Title = "aimbot enabled", Text = "aimbot is now on you can now hold right click to lock onto a survivor or the killer", Duration = 9 })
    end
    task.spawn(function()
        while _G.aimbot do
            if aimbotHeld then
                local __DEBUG_FAKEKILLER = false -- future me, change this to false (future me 2, done)
                local cam = workspace.CurrentCamera
                if isKiller or __DEBUG_FAKEKILLER then
                    local mouse = game.Players.LocalPlayer:GetMouse()
                    local x, y = mouse.X, mouse.Y
                    local v = getClosestSurvivorToMouse(x, y)
                    if v then
                        local root = v.HumanoidRootPart
                        cam.CFrame = CFrame.new(cam.CFrame.Position, root.Position)
                    end
                elseif isSurvivor then
                    if killerModel and ({cam:worldToViewportPoint(killerModel.HumanoidRootPart.Position)})[2] then
                        cam.CFrame = CFrame.new(cam.CFrame.Position, killerModel.HumanoidRootPart.Position)
                    end
                else
                    print("none")
                end
            end
            task.wait()
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
itemsSection.Toggle("Auto Pick Up Near Items [📜]", function (call)
    _G.pickUpNear = call
    task.spawn(function()
        while _G.pickUpNear and task.wait() do
            pcall(function()
                if isKiller then return end
                local items = {}
                for i, v in pairs(workspace.Map.Ingame:GetDescendants()) do
                    if v:IsA("Tool") then
                        table.insert(items, v.ItemRoot)
                    end
                end
                for i, v in pairs(items) do
                    local magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
                    if magnitude <= 10 then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
            end)
        end
    end)
end)
itemsSection.Button("Pick Up Available Items [📜]", function()
    pcall(function()
        if isKiller then return end
        local items = {}
        for i, v in pairs(workspace.Map.Ingame:GetDescendants()) do
            if v:IsA("Tool") then
                table.insert(items, v.ItemRoot)
            end
        end
        for i, v in pairs(items) do
            if game.Players.LocalPlayer.Backpack:FindFirstChild(v.Parent.Name) then continue end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            task.wait(0.5)
            fireproximityprompt(v.ProximityPrompt)
        end
    end)
end)
local playerTab = window:Tab("Local Player", "rbxassetid://73140121358767")
local staminaSection = playerTab:AddSection("Stamina")
staminaSection.Button("Infinite Stamina [📜]", function()
    require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.MaxStamina = 9999
    require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.StaminaLoss = 0
    game.StarterGui:SetCore("SendNotification", { Title = "warning", Text = "this effect wont apply until next round, but you only have to press it once this entire session", Duration = 9 })
end)
staminaSection.Toggle("Always Sprint [📜]", function (call)
    _G.alwaysSprint = call
    task.spawn(function()
        while _G.alwaysSprint and task.wait() do
            local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
            if not sprint.IsSprinting then
                sprint.IsSprinting = true
                sprint.__sprintedEvent:Fire(true)
            end
        end
    end)
end)

local sprintSpeed = 26
staminaSection.Toggle("Fast Sprint [⚙️] [⚠️] [📜]", function (call)
    _G.fsprint = call
    if call then
        game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "this feature can get you kicked, and is EXTREMELY risky!", Duration = 9 })
    end
end)
task.spawn(function ()
    local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
    while true do
        if _G.fsprint then
            sprint.SprintSpeed = sprintSpeed
        else
            sprint.SprintSpeed = 26
        end
        task.wait()
    end 
end)
staminaSection.Slider("Sprint Speed", 26, 26, 80, function (slid)
    sprintSpeed = slid
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
         game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "you WILL get kicked if you are inside a wall for more than a second! only use for small shortcuts", Duration = 9 })
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
        local walls = workspace.Map.Ingame.Map:FindFirstChild("Killer_Only Wall") or workspace.Map.Ingame.Map:FindFirstChild("KillerOnlyEntrances")
        for i, v in pairs(walls:GetChildren()) do
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
    if game.Players.LocalPlayer:GetNetworkPing() >= 0.3 then
        return game.StarterGui:SetCore("SendNotification", { Title = "Kill all stopped", Text = "kill all stopped because your ping is too high. try getting better wifi and try again", Duration = 9 })
    end
    for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
        local name = v:GetAttribute("Username")
        local plr = game.Players:FindFirstChild(name)
        if not plr then continue end
        local skipTimeout = tick()
        while tick() - skipTimeout <= 15 do
            if game.Players.LocalPlayer:GetNetworkPing() >= 0.3 then
                return game.StarterGui:SetCore("SendNotification", { Title = "Kill all stopped", Text = "kill all stopped because your ping is too high. try getting better wifi and try again", Duration = 9 })
            end
            if game.Players:FindFirstChild(name) == nil then break end
            if plr.Character == nil then break end
            if plr.Character:FindFirstChild("Humanoid") == nil then break end
            if plr.Character.Humanoid.Health <= 0 then break end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility",
                "Slash")
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility",
                "Punch")
            task.wait()
        end
    end
end)
killerSection.Button("Teleport To Random Survivor", function()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Players.Survivors:GetChildren()[math.random(1, #workspace.Players.Survivors:GetChildren())].HumanoidRootPart.CFrame
    end)
end)

local teleportsTab = window:Tab("Teleport", "rbxassetid://100658585674886")
local generatorsSection = teleportsTab:AddSection("Generators")
for i = 1, 5 do
    generatorsSection.Button("Teleport To Generator " .. i, function ()
        pcall(function ()
            local gens = {}
            for i, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    table.insert(gens, v)
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gens[i].Positions.Center.CFrame + Vector3.new(0, 10, 0)
        end)
    end)
end
teleportsTab:AddSection("Items").Button("Teleport To Random Item", function ()
    local items = {}
    pcall(function ()
        for i, v in pairs(workspace.Map.Ingame:GetDescendants()) do
            if v:IsA("Tool") then
                table.insert(items, v)
            end
        end
    end)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = items[math.random(1, #items)].ItemRoot.CFrame + Vector3.new(0, 10, 0)
end)
local miscTab = window:Tab("Misc", "rbxassetid://85291691462928")
local miscSection = miscTab:AddSection("Miscallenous")

miscSection.Toggle("Allow Jump [⚠️]", function (s)
    _G.mhhmmm2 = s
    if s then
         game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "WARNING jumping repeatedly will KICK YOU because the game will think you are flying!", Duration = 9 })
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
local emoteAsKiller = miscTab:AddSection("Emote As Killer")
local emoteName = "AICatDance"
local emoteTable = {}
for i, v in pairs(game:GetService("ReplicatedStorage").Assets.Emotes:GetChildren()) do
    table.insert(emoteTable, v.Name)
end
table.sort(emoteTable)
emoteAsKiller:AddDropdown("_", "Select Emote (must own)", emoteTable, function (e)
    emoteName = e
end)
emoteAsKiller.Button("Play Emote", function ()
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("PlayEmote", "Animations", emoteName)
end)
