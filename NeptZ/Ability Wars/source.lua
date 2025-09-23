_G.accept = false
local invite = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")

invite.Name = "invite"
invite.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
invite.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = invite
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(126, 132, 145)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 432, 0, 109)

Frame_2.Parent = Frame
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame_2.Size = UDim2.new(1, -2, 1, -2)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 13, 0, 13)
TextLabel.Size = UDim2.new(1, 0, 0, 20)
TextLabel.Font = Enum.Font.ArialBold
TextLabel.Text = "Do you want to join the NXP Hub discord server?"
TextLabel.TextColor3 = Color3.fromRGB(185, 185, 185)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel.Parent = Frame_2
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 15, 0, 45)
ImageLabel.Size = UDim2.new(0, 50, 0, 50)
ImageLabel.Image = "rbxassetid://92119666481944"

UICorner_2.CornerRadius = UDim.new(0, 13)
UICorner_2.Parent = ImageLabel

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 75, 0, 50)
TextLabel_2.Size = UDim2.new(1, 0, 0, 20)
TextLabel_2.Font = Enum.Font.ArialBold
TextLabel_2.Text = "NXP Hub [Forsaken]"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 17.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

TextLabel_3.Parent = Frame_2
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 75, 0, 70)
TextLabel_3.Size = UDim2.new(1, 0, 0, 20)
TextLabel_3.Font = Enum.Font.ArialBold
TextLabel_3.Text = "https://discord.gg/B8RmDbnrWc"
TextLabel_3.TextColor3 = Color3.fromRGB(172, 172, 172)
TextLabel_3.TextSize = 14.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

TextButton.Parent = Frame_2
TextButton.AnchorPoint = Vector2.new(1, 1)
TextButton.BackgroundColor3 = Color3.fromRGB(67, 181, 129)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(1, -15, 1, -15)
TextButton.Size = UDim2.new(0, 70, 0, 40)
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.ArialBold
TextButton.Text = "Join"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = TextButton

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Frame

-- Scripts:

local function YQZUQ_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local ts = game:GetService("TweenService")
	local bruh = script.Parent
	local yes = false
	bruh.MouseEnter:Connect(function()
		if yes then return end
		ts:Create(bruh, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(47, 127, 88)}):Play()
	end)
	bruh.MouseLeave:Connect(function()
		if yes then return end
		ts:Create(bruh, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(67, 181, 129)}):Play()
	end)
	bruh.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/B8RmDbnrWc")
		yes = true
    _G.accept = true
		ts:Create(bruh, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(41, 112, 77)}):Play()
		script.Parent.Text = "..."
		wait(0.2)
		script.Parent.Text = "Copied"
		wait(1)
		for i, v in pairs(bruh.Parent.Parent:GetDescendants()) do
			if v:IsA("TextButton") or v:IsA("TextLabel") then
				ts:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
				ts:Create(v, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
			elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
				ts:Create(v, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
				ts:Create(v, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
			end
		end
		wait(0.5)
		ts:Create(bruh.Parent.Parent, TweenInfo.new(1), {Size = UDim2.fromOffset(432, 0)}):Play()
	end)
end
coroutine.wrap(YQZUQ_fake_script)()
repeat task.wait() until _G.accept

-- remove if no like analytics
loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/test.lua"))()

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
