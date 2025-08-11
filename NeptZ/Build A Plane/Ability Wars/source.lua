-- // Variables \\
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local camera = workspace.CurrentCamera
local virtualInputManager = game:GetService("VirtualInputManager")
    --> Distance Threshold
    local distanceThreshold = 20
    --> Click Aura
    local clickingAuraToggle
    --> Hitbox Expander
    local expandRadius = 10
    local hitboxExpanderToggle
    --> Walk Speed
    local walkSpeedValue
    local walkSpeedEnabled
    --> Jump Power
    local jumpPowerValue
    local jumpPowerEnabled
    --> Infinite Jump
    local infiniteJumpConnection

-- // Temp Variables \\
local bigMushroom
local onAddedEvent
local chamsToggle

-- // FUnctions \\
local function clickScreen()
    local identifyexecutor = identifyexecutor or function()
        return "DogShit", "1.0.0"
    end
    for i, v in pairs({"DogShit", "Xeno", "Solara", "Celery", "Nezur"}) do
        if string.find(identifyexecutor():lower(), v) then
            return print("you execator to shit, cant click sorry")
        end
    end
    local viewport = camera.ViewportSize
    virtualInputManager:SendMouseButtonEvent(viewport.X / 2, viewport.Y / 2, 0, true, nil, 0)
    virtualInputManager:SendMouseButtonEvent(viewport.X / 2, viewport.Y / 2, 0, false, nil, 0)
end

-- // UI Setup \\
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/assets/refs/heads/main/lib.lua"))()
local window = library.Window("NeptZ", "Ability Wars")
local combatTab = window.Tab("Combat")
local combatSection = combatTab.Section("Aura")
combatSection.Toggle("Click Aura", function(call)
    clickingAuraToggle = call
end)
combatSection.Slider("Distance Threshold", 20, 10, 40, function(value)
    distanceThreshold = value
end)
local hitboxSection = combatTab.Section("Hitboxes")
hitboxSection.Toggle("Hitbox Expander", function(call)
    hitboxExpanderToggle = call
end)
hitboxSection.Slider("Expand Radius", 20, 10, 40, function(value)
    expandRadius = value
end)
local mushroomSection = combatTab.Section("Mushroom")
mushroomSection.Toggle("Spam Big Mushroom", function(call)
    bigMushroom = call
    task.spawn(function()
        while bigMushroom and task.wait() do
            replicatedStorage["Remote Events"].BigMushroomEvent:FireServer()
        end
    end)
end)
local blatantTab = window.Tab("Blatant")
local blatantSection = blatantTab.Section("Blatant")
blatantSection.Toggle("Anti Void", function(call)
    if call == false then
        workspace.__ANTIVOID:Destroy()
    else
        local antiVoidPart = Instance.new("Part", workspace)
        antiVoidPart.Size = Vector3.new(2048, 4, 2048)
        antiVoidPart.Transparency = 0.5
        antiVoidPart.Anchored = true
        antiVoidPart.Name = "__ANTIVOID"
        antiVoidPart.Position = Vector3.new(0, 1.5, 0)
    end
end)
blatantSection.Toggle("Auto Respawn", function(call)
    if call == false then
        onAddedEvent:Disconnect()
    else
        onAddedEvent = localPlayer.CharacterAdded:Connect(function()
            while not (localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")) do
                task.wait()
            end
            localPlayer.Character:SetPrimaryPartCFrame(workspace.Portals["Arena Frame"].Portal.CFrame)
        end)
    end
end)
local visualTab = window.Tab("Visuals")
local chamsSection = visualTab.Section("Chams")
chamsSection.Toggle("Chams", function(call)
    chamsToggle = call
    task.spawn(function()
        while chamsToggle and task.wait() do
            for i, player in pairs(players:GetPlayers()) do
                local enemyChar = player.Character
                if player == localPlayer or (enemyChar and enemyChar:FindFirstChild("HumanoidRootPart")) == nil then continue end
                if enemyChar:FindFirstChild("_chams") == nil then
                    local chamsHighlight = Instance.new("Highlight", enemyChar)
                    chamsHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    chamsHighlight.FillTransparency = 1
                    chamsHighlight.OutlineTransparency = 0
                    chamsHighlight.OutlineColor = Color3.fromRGB(211, 0, 0)
                end
            end
        end
    end)
    if call == false then
        for i, player in pairs(players:GetPlayers()) do
            local enemyChar = player.Character
            if player == localPlayer or (enemyChar and enemyChar:FindFirstChild("HumanoidRootPart")) == nil then continue end
            if enemyChar:FindFirstChild("_chams") ~= nil then
                enemyChar._chams:Destroy()
            end
        end
    end
end)
local playerTab = window.Tab("Player")
local playerSection = playerTab.Section("Humanoid Mods")
playerSection.Toggle("Enable Walk Speed", function (state)
    walkSpeedEnabled = state
end)
playerSection.Slider("Walk Speed", 16, 16, 120, function (val)
    walkSpeedValue = val
end)
playerSection.Toggle("Enable Jump Power", function (state)
    jumpPowerEnabled = state
end)
playerSection.Slider("Jump Power", 50, 50, 120, function (val)
    jumpPowerValue = val
end)
playerSection.Toggle("Infinite Jump", function (state)
    if not state then
        infiniteJumpConnection:Disconnect()
    else
        infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- // Main Script \\
task.spawn(function()
    repeat
        local root = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            if walkSpeedEnabled then
                localPlayer.Character.Humanoid.WalkSpeed = walkSpeedValue or 16
            end
            if jumpPowerEnabled then
                localPlayer.Character.Humanoid.JumpPower = jumpPowerValue or 16
            end
            local enemy
            for i, player in pairs(players:GetPlayers()) do
                if player == localPlayer or (player:FindFirstChild("leaderstats") and (player.leaderstats.Ability.Value == "Butter" or player.leaderstats.Ability.Value == "Spectator")) then
                    continue
                end
                local enemyRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if enemyRoot then
                    local magnitude = (root.Position - enemyRoot.Position).magnitude
                    if magnitude <= distanceThreshold then
                        if clickingAuraToggle then
                            clickScreen()
                        end
                    end
                    if hitboxExpanderToggle then
                        enemyRoot.Size = Vector3.new(expandRadius, expandRadius, expandRadius)
                    else
                        enemyRoot.Size = Vector3.new(2, 2, 1)
                    end
                end
            end
        end
        wait(math.random(9, 20) / 100)
    until (nil)
end)
