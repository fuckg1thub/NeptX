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
