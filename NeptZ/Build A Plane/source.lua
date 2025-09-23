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

-- yes, this is my code not pasted 😭
local blocksInfo = require(game:GetService("ReplicatedStorage").Modules.Utilities.BlocksUtil).BlockInfo
_G.originalz = _G.originalz or blocksInfo
local localPlayer = game:GetService("Players").localPlayer

local function getBlockData(block, key)
    return _G.originalz[block][key]
end
local function modifyBlockData(block, key, value)
    blocksInfo[block][key] = value
end

local function getPlane()
    
    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
        local planeSeat = localPlayer.Character.Humanoid.SeatPart
        return planeSeat and (planeSeat and planeSeat.Parent.PrimaryPart) or nil
    end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/Fluent-Inspired-UI/refs/heads/main/fiui.luau"))()
local window = library.Window("NXP hub (V1)", "Build A Plane", "rbxassetid://118689160394652", false, Color3.fromRGB(150, 63, 204))
local blocksTab = window:Tab("Blocks", "rbxassetid://101966922795157")
local mainsection = blocksTab:AddSection("Blocks", "rbxassetid://73140121358767")
mainsection.Toggle("Infinite Fuel", function(call)
    if call == false then
        modifyBlockData("fuel_1", "Fuel", getBlockData("fuel_1", "Fuel"))
        modifyBlockData("fuel_3", "Fuel", getBlockData("fuel_2", "Fuel"))
        modifyBlockData("fuel_3", "Fuel", getBlockData("fuel_3", "Fuel"))
    else
        modifyBlockData("fuel_1", "Fuel", 9e9)
        modifyBlockData("fuel_3", "Fuel", 9e9)
        modifyBlockData("fuel_3", "Fuel", 9e9)
    end
end)
mainsection.Toggle("Better Wings", function(call)
    if call == false then
        modifyBlockData("wing_1", "Lift", getBlockData("wing_1", "Lift"))
        modifyBlockData("wing_2", "Lift", getBlockData("wing_2", "Lift"))
        modifyBlockData("wing_3", "Lift", getBlockData("wing_3", "Lift"))
        modifyBlockData("wing_blood", "Lift", getBlockData("wing_blood", "Lift"))
    else
        modifyBlockData("wing_1", "Lift", 20)
        modifyBlockData("wing_2", "Lift", 20)
        modifyBlockData("wing_3", "Lift", 20)
        modifyBlockData("wing_blood", "Lift", 20)
    end
end)
_G.propeler2 = nil
mainsection.Toggle("Better Propellors", function(call)
    _G.propeler = call
    if call == false then
        modifyBlockData("propeller_0", "Force", getBlockData("propeller_0", "Force"))
        modifyBlockData("propeller_1", "Force", getBlockData("propeller_1", "Force"))
        modifyBlockData("propeller_2", "Force", getBlockData("propeller_2", "Force"))
        modifyBlockData("propeller_3", "Force", getBlockData("propeller_3", "Force"))
        modifyBlockData("propeller_blood", "Force", getBlockData("propeller_blood", "Force"))
    else
        modifyBlockData("propeller_0", "Force", _G.propeler2 or 150)
        modifyBlockData("propeller_1", "Force", _G.propeler2 or 150)
        modifyBlockData("propeller_2", "Force", _G.propeler2 or 150)
        modifyBlockData("propeller_3", "Force", _G.propeler2 or 150)
        modifyBlockData("propeller_blood", "Force", _G.propeler2 or 150)
    end
end)
mainsection.Slider("Propellor Speed", 0, 1, 300, function (v)
    _G.propeler2 = v
    if _G.propeler then
        modifyBlockData("propeller_0", "Force", _G.propeler2)
        modifyBlockData("propeller_1", "Force", _G.propeler2)
        modifyBlockData("propeller_2", "Force", _G.propeler2)
        modifyBlockData("propeller_3", "Force", _G.propeler2)
        modifyBlockData("propeller_blood", "Force", _G.propeler2)
    end
end)
local farmTab = window:Tab("Auto Farm", "rbxassetid://73140121358767")
local farmSection = farmTab:AddSection("Farming")
local function yet()
    if getPlane() == nil then return end
    getPlane().CFrame = CFrame.new(getPlane().CFrame.X, 200, getPlane().CFrame.Z)
    local cf = getPlane().CFrame + Vector3.new(10000, 200, 0)
    local aaa = 0
    local origianLpos = getPlane().CFrame
    while true do
        if not getPlane() then break end
        if aaa >= 1 then break end
        aaa = aaa + 0.001
        print(aaa)
        local cframe = origianLpos:lerp(cf, aaa)
        getPlane().CFrame = cframe
        task.wait()
    end
end
farmSection.Toggle("Auto Send To End", function(call)
    _G.funnyuwu = call
    task.spawn(function ()
        while _G.funnyuwu and task.wait() do
            if getPlane() then
                yet()
                task.wait(2)
                firesignal(localPlayer.PlayerGui.Main.LaunchUI.Buttons.ReturnButton.MouseButton1Click)
            end
        end
    end)
end)
farmSection.Toggle("Auto Launch", function(call)
    _G.funnyowo = call
    task.spawn(function ()
        while _G.funnyowo and task.wait() do
            if not getPlane() then
                if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    firesignal(localPlayer.PlayerGui.Main.LaunchUI.Buttons.LaunchButton.MouseButton1Click)
                end
            end
        end
    end)
end)
local miscTab = window:Tab("Misc", "rbxassetid://85291691462928")
local miscSection = miscTab:AddSection("Misc")
miscSection.Button("Move Plane Up", function()
    local plane = getPlane()
    if plane then
        plane.CFrame = plane.CFrame + Vector3.new(0, 15, 0)
    end
end)
miscSection.Button("Move Plane Down", function()
    local plane = getPlane()
    if plane then
        plane.CFrame = plane.CFrame - Vector3.new(0, 15, 0)
    end
end)
miscSection.Button("Send Plane To End", function()
    local plane = getPlane()
    if plane then
        yet()
    end
end)
