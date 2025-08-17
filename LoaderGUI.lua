return function(title, text)
  local ScreenGui = Instance.new("ScreenGui")
  local GameDetected = Instance.new("Frame")
  local UICorner = Instance.new("UICorner")
  local GameDetected_2 = Instance.new("Frame")
  local UICorner_2 = Instance.new("UICorner")
  local ImageLabel = Instance.new("ImageLabel")
  local UICorner_3 = Instance.new("UICorner")
  local TextLabel = Instance.new("TextLabel")
  local TextLabel_2 = Instance.new("TextLabel")
  local TextButton = Instance.new("TextButton")
  local UICorner_4 = Instance.new("UICorner")
  local Frame = Instance.new("Frame")
  local UICorner_5 = Instance.new("UICorner")
  local TextLabel_3 = Instance.new("TextLabel")
  local ImageLabel_2 = Instance.new("ImageLabel")
  local UICorner_6 = Instance.new("UICorner")
  local cred = Instance.new("TextLabel")
  
  ScreenGui.Parent = gethui()
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ScreenGui.ResetOnSpawn = false
  
  GameDetected.Name = "GameDetected"
  GameDetected.Parent = ScreenGui
  GameDetected.AnchorPoint = Vector2.new(0.5, 0.5)
  GameDetected.BackgroundColor3 = Color3.fromRGB(143, 78, 255)
  GameDetected.BorderColor3 = Color3.fromRGB(0, 0, 0)
  GameDetected.BorderSizePixel = 0
  GameDetected.ClipsDescendants = true
  GameDetected.Position = UDim2.new(0.5, 0, 0.5, 0)
  GameDetected.Size = UDim2.new(0, 400, 0, 190)
  
  UICorner.Parent = GameDetected
  
  GameDetected_2.Name = "GameDetected"
  GameDetected_2.Parent = GameDetected
  GameDetected_2.AnchorPoint = Vector2.new(0.5, 0.5)
  GameDetected_2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
  GameDetected_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
  GameDetected_2.BorderSizePixel = 0
  GameDetected_2.ClipsDescendants = true
  GameDetected_2.Position = UDim2.new(0.5, 0, 0.5, 0)
  GameDetected_2.Size = UDim2.new(1, -4, 1, -4)
  
  UICorner_2.CornerRadius = UDim.new(0, 6)
  UICorner_2.Parent = GameDetected_2
  
  ImageLabel.Parent = GameDetected_2
  ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  ImageLabel.BackgroundTransparency = 1.000
  ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
  ImageLabel.BorderSizePixel = 0
  ImageLabel.Position = UDim2.new(0, 4, 0, 4)
  ImageLabel.Size = UDim2.new(0, 50, 0, 50)
  ImageLabel.Image = "rbxassetid://83320070305569"
  
  UICorner_3.CornerRadius = UDim.new(0, 7)
  UICorner_3.Parent = ImageLabel
  
  TextLabel.Parent = GameDetected_2
  TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel.BackgroundTransparency = 1.000
  TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
  TextLabel.BorderSizePixel = 0
  TextLabel.Position = UDim2.new(0, 60, 0, 4)
  TextLabel.Size = UDim2.new(0, 200, 0, 20)
  TextLabel.Font = Enum.Font.ArialBold
  TextLabel.Text = "Game Detected: <i>" .. title .. "</i>"
  TextLabel.TextColor3 = Color3.fromRGB(142, 78, 254)
  TextLabel.TextSize = 17.000
  TextLabel.TextStrokeTransparency = 0.000
  TextLabel.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel.RichText = true
  
  TextLabel_2.Parent = GameDetected_2
  TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_2.BackgroundTransparency = 1.000
  TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
  TextLabel_2.BorderSizePixel = 0
  TextLabel_2.Position = UDim2.new(0, 60, 0, 19)
  TextLabel_2.Size = UDim2.new(0, 200, 0, 20)
  TextLabel_2.Font = Enum.Font.Arial
  TextLabel_2.Text = "NXP Loader V1"
  TextLabel_2.TextColor3 = Color3.fromRGB(182, 182, 182)
  TextLabel_2.TextSize = 14.000
  TextLabel_2.TextStrokeTransparency = 0.000
  TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
  
  TextButton.Parent = GameDetected_2
  TextButton.AnchorPoint = Vector2.new(0, 1)
  TextButton.BackgroundColor3 = Color3.fromRGB(143, 78, 255)
  TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
  TextButton.BorderSizePixel = 0
  TextButton.Position = UDim2.new(0, 6, 1, -6)
  TextButton.Size = UDim2.new(1, -12, 0, 30)
  TextButton.AutoButtonColor = false
  TextButton.Font = Enum.Font.FredokaOne
  TextButton.Text = ""
  TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
  TextButton.TextSize = 14.000
  
  UICorner_4.CornerRadius = UDim.new(0, 6)
  UICorner_4.Parent = TextButton
  
  Frame.Parent = TextButton
  Frame.AnchorPoint = Vector2.new(0.5, 0.5)
  Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
  Frame.BorderSizePixel = 0
  Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
  Frame.Size = UDim2.new(1, -2, 1, -2)
  
  UICorner_5.CornerRadius = UDim.new(0, 5)
  UICorner_5.Parent = Frame
  
  TextLabel_3.Parent = Frame
  TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_3.BackgroundTransparency = 1.000
  TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
  TextLabel_3.BorderSizePixel = 0
  TextLabel_3.Size = UDim2.new(1, 0, 1, 0)
  TextLabel_3.Font = Enum.Font.ArialBold
  TextLabel_3.Text = "Load Forsaken Script"
  TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_3.TextSize = 12.000
  
  ImageLabel_2.Parent = GameDetected_2
  ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
  ImageLabel_2.BorderSizePixel = 0
  ImageLabel_2.Position = UDim2.new(0, 4, 0, 54)
  ImageLabel_2.Size = UDim2.new(0, 90, 0, 90)
  ImageLabel_2.Image = "rbxassetid://82154547474108"
  ImageLabel_2.ScaleType = Enum.ScaleType.Crop
  
  UICorner_6.CornerRadius = UDim.new(0, 5)
  UICorner_6.Parent = ImageLabel_2
  
  cred.Name = "cred"
  cred.Parent = GameDetected_2
  cred.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  cred.BackgroundTransparency = 1.000
  cred.BorderColor3 = Color3.fromRGB(0, 0, 0)
  cred.BorderSizePixel = 0
  cred.Position = UDim2.new(0, 104, 0, 54)
  cred.Size = UDim2.new(0, 200, 0, 80)
  cred.Font = Enum.Font.ArialBold
  cred.Text = text
  cred.TextColor3 = Color3.fromRGB(142, 78, 254)
  cred.TextSize = 17.000
  cred.TextStrokeTransparency = 0.000
  cred.TextXAlignment = Enum.TextXAlignment.Left
  
  local uhuh = false
  TextLabel_3.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
      local balsss = GameDetected
      game:GetService("TweenService"):Create(balsss, TweenInfo.new(.4, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 0)}):Play()
      wait(1.1)
      uhuh = true
      ScreenGui:Destroy()
      end
  end)
  return {
    Wait = function()
      repeat task.wait() until uhuh
    end,
  }
end
