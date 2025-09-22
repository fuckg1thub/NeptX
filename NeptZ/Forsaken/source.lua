-- its not source anymore lmao

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

local lplr = game.Players.LocalPlayer
local function kick(reason)
  lplr:Kick(reason)
end
local forsaken_games = {
  99661246287362; -- forsaken but infinite
  100039707794702; -- untitled forsaken engine
  18687417158; -- forsaken original
  76797953666623; -- for the saken
  136474108446847; -- forsaken modded
}
if not table.find(forsaken_games, game.PlaceId) then
  kick("unsupported game")
  return
end

pcall(function()
    for i, v in pairs({"xeno", "solara", "celery", "nezur", "luna"}) do
        if string.find(identifyexecutor():lower(), v) then
            kick("your executor [" .. identifyexecutor() .. "] is not able to run this script")
            return
        end
    end
end)

local blacklists = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/black.json"))
for name, data in pairs(blacklists) do
  if name == lplr.Name then
    kick("blacklisted from nxp hub, reason: " .. (data.reason or "no reason listed"))
    return
  end
end

NXP_HUB_IS_THE_FUCKING_BEST = true
local suc = pcall(function()
  local load = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/NeptX/refs/heads/main/NeptZ/Forsaken/main.lua"))
  if load == nil then
    kick("parsing error in code (this shouldnt ever happen, try re-executing)")
    return
  else
    load()
  end
end)

if suc == false then
  kick("error while running script. are you in the correct forsaken game?")
  return
end
