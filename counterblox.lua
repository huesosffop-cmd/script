local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

-- Безопасное удаление старого меню
pcall(function()
    if CoreGui:FindFirstChild("PremiumMenu") then
        CoreGui.PremiumMenu:Destroy()
    end
end)

----------------------------------------------------
-- ВПИШИ СВОЙ СОБСТВЕННЫЙ КЛЮЧ ЗДЕСЬ 👇
----------------------------------------------------
local correctKey = "9HGN-2342-HJGD-LPCD" 

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PremiumMenu"
screenGui.ResetOnSpawn = false
pcall(function()
    screenGui.Parent = CoreGui
end)
if not screenGui.Parent then
    screenGui.Parent = player:WaitForChild("PlayerGui")
end

----------------------------------------------------
-- ОКНО АВТОРИЗАЦИИ (ПРОВЕРКА КЛЮЧА)
----------------------------------------------------
local keySystemFrame = Instance.new("Frame")
keySystemFrame.Name = "KeySystemFrame"
keySystemFrame.Size = UDim2.new(0, 320, 0, 180)
keySystemFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
keySystemFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keySystemFrame.BorderSizePixel = 0
keySystemFrame.Active = true
keySystemFrame.Draggable = true
keySystemFrame.Parent = screenGui

local ksCorner = Instance.new("UICorner")
ksCorner.CornerRadius = UDim.new(0, 14)
ksCorner.Parent = keySystemFrame

local ksGradient = Instance.new("UIGradient")
ksGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
})
ksGradient.Rotation = 45
ksGradient.Parent = keySystemFrame

local ksTitle = Instance.new("TextLabel")
ksTitle.Size = UDim2.new(1, 0, 0, 45)
ksTitle.BackgroundTransparency = 1
ksTitle.Font = Enum.Font.GothamBold
ksTitle.Text = "🔑 KEY SYSTEM [AUTH]"
ksTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
ksTitle.TextSize = 14
ksTitle.Parent = keySystemFrame

local keyTextBox = Instance.new("TextBox")
keyTextBox.Size = UDim2.new(1, -40, 0, 38)
keyTextBox.Position = UDim2.new(0, 20, 0, 55)
keyTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
keyTextBox.Font = Enum.Font.GothamMedium
keyTextBox.PlaceholderText = "Введите ваш ключ..."
keyTextBox.Text = ""
keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
keyTextBox.TextSize = 12
keyTextBox.ClearTextOnFocus = false
keyTextBox.Parent = keySystemFrame
Instance.new("UICorner", keyTextBox).CornerRadius = UDim.new(0, 8)

local loginBtn = Instance.new("TextButton")
loginBtn.Size = UDim2.new(1, -40, 0, 36)
loginBtn.Position = UDim2.new(0, 20, 0, 110)
loginBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
loginBtn.Font = Enum.Font.GothamBold
loginBtn.Text = "LOGIN"
loginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loginBtn.TextSize = 13
loginBtn.Parent = keySystemFrame
Instance.new("UICorner", loginBtn).CornerRadius = UDim.new(0, 8)

----------------------------------------------------
-- ГЛАВНОЕ ОКНО ЧИТА
----------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 400)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 14)
uiCorner.Parent = mainFrame

local sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.MinSize = Vector2.new(300, 300)
sizeConstraint.MaxSize = Vector2.new(700, 700)
sizeConstraint.Parent = mainFrame

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
})
uiGradient.Rotation = 45
uiGradient.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "GENEZIS PREMIUM"
titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
titleLabel.TextSize = 13
titleLabel.Parent = mainFrame

local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -20, 1, -50)
container.Position = UDim2.new(0, 10, 0, 40)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.CanvasSize = UDim2.new(0, 0, 0, 900)
container.ScrollBarThickness = 4
container.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 6)
listLayout.Parent = container

----------------------------------------------------
-- ЭЛЕМЕНТЫ МЕНЮ
----------------------------------------------------
local bhopHeaderBtn = Instance.new("TextButton")
bhopHeaderBtn.Size = UDim2.new(1, 0, 0, 36)
bhopHeaderBtn.LayoutOrder = 1
bhopHeaderBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
bhopHeaderBtn.Font = Enum.Font.GothamBold
bhopHeaderBtn.Text = "BHOP: OFF"
bhopHeaderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
bhopHeaderBtn.TextSize = 13
bhopHeaderBtn.Parent = container
Instance.new("UICorner", bhopHeaderBtn).CornerRadius = UDim.new(0, 8)

local bhopArrowBtn = Instance.new("TextButton")
bhopArrowBtn.Size = UDim2.new(0, 40, 1, 0)
bhopArrowBtn.Position = UDim2.new(1, -40, 0, 0)
bhopArrowBtn.BackgroundTransparency = 1
bhopArrowBtn.Font = Enum.Font.GothamBold
bhopArrowBtn.Text = "▼"
bhopArrowBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
bhopArrowBtn.TextSize = 12
bhopArrowBtn.Parent = bhopHeaderBtn

local bhopSettingsFrame = Instance.new("Frame")
bhopSettingsFrame.Size = UDim2.new(1, 0, 0, 64)
bhopSettingsFrame.LayoutOrder = 2
bhopSettingsFrame.BackgroundTransparency = 1
bhopSettingsFrame.Visible = false
bhopSettingsFrame.Parent = container

local autoStrafeToggleBtn = Instance.new("TextButton")
autoStrafeToggleBtn.Size = UDim2.new(1, 0, 0, 28)
autoStrafeToggleBtn.Position = UDim2.new(0, 0, 0, 0)
autoStrafeToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
autoStrafeToggleBtn.Font = Enum.Font.GothamMedium
autoStrafeToggleBtn.Text = "Auto Strafe: OFF"
autoStrafeToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
autoStrafeToggleBtn.TextSize = 11
autoStrafeToggleBtn.Parent = bhopSettingsFrame
Instance.new("UICorner", autoStrafeToggleBtn).CornerRadius = UDim.new(0, 6)

local strafeSpeedBtn = Instance.new("TextButton")
strafeSpeedBtn.Size = UDim2.new(1, 0, 0, 28)
strafeSpeedBtn.Position = UDim2.new(0, 0, 0, 32)
strafeSpeedBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
strafeSpeedBtn.Font = Enum.Font.GothamMedium
strafeSpeedBtn.Text = "Strafe Speed: Normal"
strafeSpeedBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
strafeSpeedBtn.TextSize = 11
strafeSpeedBtn.Parent = bhopSettingsFrame
Instance.new("UICorner", strafeSpeedBtn).CornerRadius = UDim.new(0, 6)

-- SPEEDHACK
local speedhackHeaderBtn = Instance.new("TextButton")
speedhackHeaderBtn.Size = UDim2.new(1, 0, 0, 36)
speedhackHeaderBtn.LayoutOrder = 3
speedhackHeaderBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
speedhackHeaderBtn.Font = Enum.Font.GothamBold
speedhackHeaderBtn.Text = "SPEEDHACK: OFF"
speedhackHeaderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedhackHeaderBtn.TextSize = 13
speedhackHeaderBtn.Parent = container
Instance.new("UICorner", speedhackHeaderBtn).CornerRadius = UDim.new(0, 8)

local speedhackArrowBtn = Instance.new("TextButton")
speedhackArrowBtn.Size = UDim2.new(0, 40, 1, 0)
speedhackArrowBtn.Position = UDim2.new(1, -40, 0, 0)
speedhackArrowBtn.BackgroundTransparency = 1
speedhackArrowBtn.Font = Enum.Font.GothamBold
speedhackArrowBtn.Text = "▼"
speedhackArrowBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
speedhackArrowBtn.TextSize = 12
speedhackArrowBtn.Parent = speedhackHeaderBtn

local speedhackSettingsFrame = Instance.new("Frame")
speedhackSettingsFrame.Size = UDim2.new(1, 0, 0, 32)
speedhackSettingsFrame.LayoutOrder = 4
speedhackSettingsFrame.BackgroundTransparency = 1
speedhackSettingsFrame.Visible = false
speedhackSettingsFrame.Parent = container

local speedMultiplierBtn = Instance.new("TextButton")
speedMultiplierBtn.Size = UDim2.new(1, 0, 0, 28)
speedMultiplierBtn.Position = UDim2.new(0, 0, 0, 0)
speedMultiplierBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
speedMultiplierBtn.Font = Enum.Font.GothamMedium
speedMultiplierBtn.Text = "Speed: 23 (Default)"
speedMultiplierBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
speedMultiplierBtn.TextSize = 11
speedMultiplierBtn.Parent = speedhackSettingsFrame
Instance.new("UICorner", speedMultiplierBtn).CornerRadius = UDim.new(0, 6)

-- GRENADE HELPER
local nadeHeaderBtn = Instance.new("TextButton")
nadeHeaderBtn.Size = UDim2.new(1, 0, 0, 36)
nadeHeaderBtn.LayoutOrder = 5
nadeHeaderBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
nadeHeaderBtn.Font = Enum.Font.GothamBold
nadeHeaderBtn.Text = "GRENADE HELPER: OFF"
nadeHeaderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
nadeHeaderBtn.TextSize = 13
nadeHeaderBtn.Parent = container
Instance.new("UICorner", nadeHeaderBtn).CornerRadius = UDim.new(0, 8)

-- ESP
local espToggleBtn = Instance.new("TextButton")
espToggleBtn.Size = UDim2.new(1, 0, 0, 36)
espToggleBtn.LayoutOrder = 6
espToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
espToggleBtn.Font = Enum.Font.GothamBold
espToggleBtn.Text = "ESP: OFF"
espToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 250)
espToggleBtn.TextSize = 13
espToggleBtn.Parent = container
Instance.new("UICorner", espToggleBtn).CornerRadius = UDim.new(0, 8)

-- AIMBOT
local aimHeaderBtn = Instance.new("TextButton")
aimHeaderBtn.Size = UDim2.new(1, 0, 0, 36)
aimHeaderBtn.LayoutOrder = 7
aimHeaderBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
aimHeaderBtn.Font = Enum.Font.GothamBold
aimHeaderBtn.Text = "AIMBOT: OFF"
aimHeaderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimHeaderBtn.TextSize = 13
aimHeaderBtn.Parent = container
Instance.new("UICorner", aimHeaderBtn).CornerRadius = UDim.new(0, 8)

local aimArrowBtn = Instance.new("TextButton")
aimArrowBtn.Size = UDim2.new(0, 40, 1, 0)
aimArrowBtn.Position = UDim2.new(1, -40, 0, 0)
aimArrowBtn.BackgroundTransparency = 1
aimArrowBtn.Font = Enum.Font.GothamBold
aimArrowBtn.Text = "▼"
aimArrowBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
aimArrowBtn.TextSize = 12
aimArrowBtn.Parent = aimHeaderBtn

local aimSettingsFrame = Instance.new("Frame")
aimSettingsFrame.Size = UDim2.new(1, 0, 0, 96)
aimSettingsFrame.LayoutOrder = 8
aimSettingsFrame.BackgroundTransparency = 1
aimSettingsFrame.Visible = false
aimSettingsFrame.Parent = container

local speedToggleBtn = Instance.new("TextButton")
speedToggleBtn.Size = UDim2.new(1, 0, 0, 28)
speedToggleBtn.Position = UDim2.new(0, 0, 0, 0)
speedToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
speedToggleBtn.Font = Enum.Font.GothamMedium
speedToggleBtn.Text = "Aim Speed: Normal"
speedToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
speedToggleBtn.TextSize = 11
speedToggleBtn.Parent = aimSettingsFrame
Instance.new("UICorner", speedToggleBtn).CornerRadius = UDim.new(0, 6)

local partToggleBtn = Instance.new("TextButton")
partToggleBtn.Size = UDim2.new(1, 0, 0, 28)
partToggleBtn.Position = UDim2.new(0, 0, 0, 32)
partToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
partToggleBtn.Font = Enum.Font.GothamMedium
partToggleBtn.Text = "Aim Part: Head"
partToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
partToggleBtn.TextSize = 11
partToggleBtn.Parent = aimSettingsFrame
Instance.new("UICorner", partToggleBtn).CornerRadius = UDim.new(0, 6)

local fovToggleBtn = Instance.new("TextButton")
fovToggleBtn.Size = UDim2.new(1, 0, 0, 28)
fovToggleBtn.Position = UDim2.new(0, 0, 0, 64)
fovToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
fovToggleBtn.Font = Enum.Font.GothamMedium
fovToggleBtn.Text = "FOV Circle: OFF"
fovToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
fovToggleBtn.TextSize = 11
fovToggleBtn.Parent = aimSettingsFrame
Instance.new("UICorner", fovToggleBtn).CornerRadius = UDim.new(0, 6)

-- HITBOXES
local hitboxHeaderBtn = Instance.new("TextButton")
hitboxHeaderBtn.Size = UDim2.new(1, 0, 0, 36)
hitboxHeaderBtn.LayoutOrder = 9
hitboxHeaderBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
hitboxHeaderBtn.Font = Enum.Font.GothamBold
hitboxHeaderBtn.Text = "HITBOXES: OFF"
hitboxHeaderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hitboxHeaderBtn.TextSize = 13
hitboxHeaderBtn.Parent = container
Instance.new("UICorner", hitboxHeaderBtn).CornerRadius = UDim.new(0, 8)

local hitboxArrowBtn = Instance.new("TextButton")
hitboxArrowBtn.Size = UDim2.new(0, 40, 1, 0)
hitboxArrowBtn.Position = UDim2.new(1, -40, 0, 0)
hitboxArrowBtn.BackgroundTransparency = 1
hitboxArrowBtn.Font = Enum.Font.GothamBold
hitboxArrowBtn.Text = "▼"
hitboxArrowBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
hitboxArrowBtn.TextSize = 12
hitboxArrowBtn.Parent = hitboxHeaderBtn

local hitboxSettingsFrame = Instance.new("Frame")
hitboxSettingsFrame.Size = UDim2.new(1, 0, 0, 32)
hitboxSettingsFrame.LayoutOrder = 10
hitboxSettingsFrame.BackgroundTransparency = 1
hitboxSettingsFrame.Visible = false
hitboxSettingsFrame.Parent = container

local hitboxToggleBtn = Instance.new("TextButton")
hitboxToggleBtn.Size = UDim2.new(1, 0, 0, 28)
hitboxToggleBtn.Position = UDim2.new(0, 0, 0, 0)
hitboxToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
hitboxToggleBtn.Font = Enum.Font.GothamMedium
hitboxToggleBtn.Text = "Size: OFF"
hitboxToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
hitboxToggleBtn.TextSize = 11
hitboxToggleBtn.Parent = hitboxSettingsFrame
Instance.new("UICorner", hitboxToggleBtn).CornerRadius = UDim.new(0, 6)

-- CROSSHAIR
local crosshairToggleBtn = Instance.new("TextButton")
crosshairToggleBtn.Size = UDim2.new(1, 0, 0, 36)
crosshairToggleBtn.LayoutOrder = 11
crosshairToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
crosshairToggleBtn.Font = Enum.Font.GothamBold
crosshairToggleBtn.Text = "Crosshair: OFF"
crosshairToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
crosshairToggleBtn.TextSize = 13
crosshairToggleBtn.Parent = container
Instance.new("UICorner", crosshairToggleBtn).CornerRadius = UDim.new(0, 8)

-- DEBUG (UNLOAD)
local debugBtn = Instance.new("TextButton")
debugBtn.Size = UDim2.new(1, 0, 0, 36)
debugBtn.LayoutOrder = 12
debugBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
debugBtn.Font = Enum.Font.GothamBold
debugBtn.Text = "🚨 DEBUG CHEAT (UNLOAD)"
debugBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
debugBtn.TextSize = 13
debugBtn.Parent = container
Instance.new("UICorner", debugBtn).CornerRadius = UDim.new(0, 8)

----------------------------------------------------
-- ЛОГИКА ПРОВЕРКИ КЛЮЧА
----------------------------------------------------
loginBtn.MouseButton1Click:Connect(function()
    if keyTextBox.Text == correctKey then
        keySystemFrame:Destroy()
        mainFrame.Visible = true
    else
        loginBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        loginBtn.Text = "WRONG KEY!"
        task.delay(1, function()
            loginBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
            loginBtn.Text = "LOGIN"
        end)
    end
end)

----------------------------------------------------
-- ВИЗУАЛЫ (КРУГ FOV И ПРИЦЕЛ ЧЕРЕЗ UI)
----------------------------------------------------
local crosshairGui = Instance.new("ScreenGui")
crosshairGui.Name = "PremiumCrosshairGui"
crosshairGui.ResetOnSpawn = false
crosshairGui.Parent = screenGui

local fovFrame = Instance.new("Frame")
fovFrame.Size = UDim2.new(0, 300, 0, 300)
fovFrame.AnchorPoint = Vector2.new(0.5, 0.5)
fovFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
fovFrame.BackgroundTransparency = 1
fovFrame.Visible = false
fovFrame.Parent = crosshairGui

local fovCorner = Instance.new("UICorner")
fovCorner.CornerRadius = UDim.new(1, 0)
fovCorner.Parent = fovFrame

local fovStroke = Instance.new("UIStroke")
fovStroke.Color = Color3.fromRGB(255, 255, 255)
fovStroke.Thickness = 1
fovStroke.Parent = fovFrame

local crosshairLabel = Instance.new("TextLabel")
crosshairLabel.Size = UDim2.new(0, 40, 0, 40)
crosshairLabel.AnchorPoint = Vector2.new(0.5, 0.5)
crosshairLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
crosshairLabel.BackgroundTransparency = 1
crosshairLabel.Font = Enum.Font.GothamBold
crosshairLabel.Text = ""
crosshairLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
crosshairLabel.TextSize = 18
crosshairLabel.Visible = false
crosshairLabel.Parent = crosshairGui

local crosshairStyles = {"Off", "Classic Cross", "Red Spinning", "Minecraft Pig 🐷"}
local currentCrossStyleIndex = 1

local bhopEnabled = false
local autoStrafeEnabled = false
local speedhackEnabled = false
local nadeHelperEnabled = false
local espEnabled = false
local aimEnabled = false
local fovEnabled = false
local spaceHeld = false
local mouseHeld = false
local menuVisible = true

local strafeSpeeds = {
    {name = "Strafe Speed: Slow", value = 0.5},
    {name = "Strafe Speed: Normal", value = 1.0},
    {name = "Strafe Speed: Fast", value = 1.6}
}
local currentStrafeSpeedIndex = 2

local speedValues = {23, 35, 50, 75, 100}
local currentSpeedValIndex = 1

local hitboxModes = {
    {name = "Size: OFF", size = Vector3.new(2, 2, 1), trans = 1},
    {name = "Size: Small (3x3)", size = Vector3.new(3, 3, 2), trans = 0.6},
    {name = "Size: Medium (5x5)", size = Vector3.new(5, 5, 4), trans = 0.7},
    {name = "Size: Big (7x7)", size = Vector3.new(7, 7, 6), trans = 0.75},
    {name = "Size: Massive (10x10)", size = Vector3.new(10, 10, 8), trans = 0.8}
}
local currentHitboxIndex = 1

local aimSpeeds = {
    {name = "Aim Speed: Smooth", value = 0.08},
    {name = "Aim Speed: Normal", value = 0.2},
    {name = "Aim Speed: Snap", value = 1.0}
}
local currentSpeedIndex = 2

local aimParts = {"Head", "UpperTorso", "HumanoidRootPart"}
local aimPartNames = {"Head", "Torso", "RootPart"}
local currentPartIndex = 1

local userIsMovingMouse = false
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        userIsMovingMouse = true
        task.delay(0.05, function() userIsMovingMouse = false end)
    end
end)

-- Функция управления видимостью меню и оверлеев
local function updateVisibility(isVisibleState)
    mainFrame.Visible = isVisibleState
    crosshairLabel.Visible = isVisibleState and (crosshairStyles[currentCrossStyleIndex] ~= "Off")
    fovFrame.Visible = isVisibleState and fovEnabled
end

-- Переключение видимости меню по клавише RightAlt (Правый Альт)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Space then
        spaceHeld = true
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        mouseHeld = true
    elseif input.KeyCode == Enum.KeyCode.RightAlt then
        menuVisible = not menuVisible
        updateVisibility(menuVisible)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        spaceHeld = false
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        mouseHeld = false
    end
end)

-- Аккордеоны
bhopArrowBtn.MouseButton1Click:Connect(function()
    local o = bhopSettingsFrame.Visible
    bhopSettingsFrame.Visible = not o
    bhopArrowBtn.Text = not o and "▲" or "▼"
end)

speedhackArrowBtn.MouseButton1Click:Connect(function()
    local o = speedhackSettingsFrame.Visible
    speedhackSettingsFrame.Visible = not o
    speedhackArrowBtn.Text = not o and "▲" or "▼"
end)

aimArrowBtn.MouseButton1Click:Connect(function()
    local o = aimSettingsFrame.Visible
    aimSettingsFrame.Visible = not o
    aimArrowBtn.Text = not o and "▲" or "▼"
end)

hitboxArrowBtn.MouseButton1Click:Connect(function()
    local o = hitboxSettingsFrame.Visible
    hitboxSettingsFrame.Visible = not o
    hitboxArrowBtn.Text = not o and "▲" or "▼"
end)

-- Кнопки функционала
bhopHeaderBtn.MouseButton1Click:Connect(function()
    bhopEnabled = not bhopEnabled
    bhopHeaderBtn.BackgroundColor3 = bhopEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    bhopHeaderBtn.Text = bhopEnabled and "BHOP: ON" or "BHOP: OFF"
end)

autoStrafeToggleBtn.MouseButton1Click:Connect(function()
    autoStrafeEnabled = not autoStrafeEnabled
    autoStrafeToggleBtn.BackgroundColor3 = autoStrafeEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(25, 25, 38)
    autoStrafeToggleBtn.Text = autoStrafeEnabled and "Auto Strafe: ON" or "Auto Strafe: OFF"
end)

strafeSpeedBtn.MouseButton1Click:Connect(function()
    currentStrafeSpeedIndex = currentStrafeSpeedIndex + 1
    if currentStrafeSpeedIndex > #strafeSpeeds then currentStrafeSpeedIndex = 1 end
    strafeSpeedBtn.Text = strafeSpeeds[currentStrafeSpeedIndex].name
end)

speedhackHeaderBtn.MouseButton1Click:Connect(function()
    speedhackEnabled = not speedhackEnabled
    speedhackHeaderBtn.BackgroundColor3 = speedhackEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    speedhackHeaderBtn.Text = speedhackEnabled and "SPEEDHACK: ON" or "SPEEDHACK: OFF"
    if not speedhackEnabled and player.Character then
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
end)

speedMultiplierBtn.MouseButton1Click:Connect(function()
    currentSpeedValIndex = currentSpeedValIndex + 1
    if currentSpeedValIndex > #speedValues then currentSpeedValIndex = 1 end
    local val = speedValues[currentSpeedValIndex]
    speedMultiplierBtn.Text = "Speed: " .. val
end)

nadeHeaderBtn.MouseButton1Click:Connect(function()
    nadeHelperEnabled = not nadeHelperEnabled
    nadeHeaderBtn.BackgroundColor3 = nadeHelperEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    nadeHeaderBtn.Text = nadeHelperEnabled and "GRENADE HELPER: ON" or "GRENADE HELPER: OFF"
end)

espToggleBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espToggleBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    espToggleBtn.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    if not espEnabled then
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                local hl = p.Character:FindFirstChild("CustomEspHighlight")
                if hl then hl:Destroy() end
            end
        end
    end
end)

aimHeaderBtn.MouseButton1Click:Connect(function()
    aimEnabled = not aimEnabled
    aimHeaderBtn.BackgroundColor3 = aimEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    aimHeaderBtn.Text = aimEnabled and "AIMBOT: ON" or "AIMBOT: OFF"
end)

speedToggleBtn.MouseButton1Click:Connect(function()
    currentSpeedIndex = currentSpeedIndex + 1
    if currentSpeedIndex > #aimSpeeds then currentSpeedIndex = 1 end
    speedToggleBtn.Text = aimSpeeds[currentSpeedIndex].name
end)

partToggleBtn.MouseButton1Click:Connect(function()
    currentPartIndex = currentPartIndex + 1
    if currentPartIndex > #aimParts then currentPartIndex = 1 end
    partToggleBtn.Text = "Aim Part: " .. aimPartNames[currentPartIndex]
end)

fovToggleBtn.MouseButton1Click:Connect(function()
    fovEnabled = not fovEnabled
    if menuVisible then
        fovFrame.Visible = fovEnabled
    end
    fovToggleBtn.BackgroundColor3 = fovEnabled and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(25, 25, 38)
    fovToggleBtn.Text = fovEnabled and "FOV Circle: ON" or "FOV Circle: OFF"
end)

hitboxHeaderBtn.MouseButton1Click:Connect(function()
    currentHitboxIndex = currentHitboxIndex + 1
    if currentHitboxIndex > #hitboxModes then currentHitboxIndex = 1 end
    local mode = hitboxModes[currentHitboxIndex]
    hitboxToggleBtn.Text = mode.name
    local hOn = currentHitboxIndex > 1
    hitboxHeaderBtn.BackgroundColor3 = hOn and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    hitboxHeaderBtn.Text = hOn and "HITBOXES: ON" or "HITBOXES: OFF"
    if currentHitboxIndex == 1 then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                local root = p.Character:FindFirstChild("HumanoidRootPart")
                if root then root.Size = Vector3.new(2, 2, 1) root.Transparency = 1 end
            end
        end
    end
end)

crosshairToggleBtn.MouseButton1Click:Connect(function()
    currentCrossStyleIndex = currentCrossStyleIndex + 1
    if currentCrossStyleIndex > #crosshairStyles then currentCrossStyleIndex = 1 end
    local style = crosshairStyles[currentCrossStyleIndex]
    crosshairToggleBtn.Text = "Crosshair: " .. style
    crosshairToggleBtn.BackgroundColor3 = (style ~= "Off") and Color3.fromRGB(0, 140, 255) or Color3.fromRGB(35, 35, 50)
    if menuVisible then
        crosshairLabel.Visible = (style ~= "Off")
    end
end)

debugBtn.MouseButton1Click:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if root then root.Size = Vector3.new(2, 2, 1) root.Transparency = 1 end
            local hl = p.Character:FindFirstChild("CustomEspHighlight")
            if hl then hl:Destroy() end
        end
    end
    if player.Character then
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
    pcall(function()
        screenGui:Destroy()
    end)
end)

local function isTeamMate(otherPlayer)
    if player.Team and otherPlayer.Team then return player.Team == otherPlayer.Team end
    return false
end

local function isVisible(targetPart)
    local myChar = player.Character
    if not myChar or not myChar:FindFirstChild("Head") then return false end
    local origin = myChar.Head.Position
    local direction = targetPart.Position - origin
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {myChar, targetPart.Parent}
    return Workspace:Raycast(origin, direction, raycastParams) == nil
end

local function getClosestInFovPlayer()
    local closestPart = nil
    local shortestDistance = math.huge
    local myChar = player.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end
    local screenCenter = camera.ViewportSize / 2

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and not isTeamMate(p) and p.Character then
            local enemyHumanoid = p.Character:FindFirstChildOfClass("Humanoid")
            local targetPart = p.Character:FindFirstChild(aimParts[currentPartIndex]) or p.Character:FindFirstChild("Head")
            if enemyHumanoid and enemyHumanoid.Health > 0 and targetPart then
                local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                if onScreen and isVisible(targetPart) then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                    if (not fovEnabled or dist <= 150) and dist < shortestDistance then
                        shortestDistance = dist
                        closestPart = targetPart
                    end
                end
            end
        end
    end
    return closestPart
end

local nadeBeamParts = {}
for i = 1, 30 do
    local p = Instance.new("Part")
    p.Size = Vector3.new(0.2, 0.2, 0.8)
    p.Anchored = true
    p.CanCollide = false
    p.Material = Enum.Material.Neon
    p.Color = Color3.fromRGB(0, 255, 120)
    p.Transparency = 1
    p.Parent = Workspace
    table.insert(nadeBeamParts, p)
end

local function clearNadeBeam()
    for _, p in ipairs(nadeBeamParts) do
        p.Transparency = 1
    end
end

local spinAngle = 0

RunService.RenderStepped:Connect(function(dt)
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")

        if bhopEnabled and spaceHeld and hum then
            if hum.FloorMaterial ~= Enum.Material.Air then
                pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
            end
            if autoStrafeEnabled and root then
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    root.CFrame = root.CFrame + (camera.CFrame.RightVector * (math.sin(tick() * 15) * 0.4 * strafeSpeeds[currentStrafeSpeedIndex].value))
                end
            end
        end

        if speedhackEnabled and hum then
            hum.WalkSpeed = speedValues[currentSpeedValIndex]
        end

        if nadeHelperEnabled and mouseHeld and char:FindFirstChildOfClass("Tool") then
            local head = char:FindFirstChild("Head")
            if head then
                local pos = head.Position
                local vel = camera.CFrame.LookVector * 80 + Vector3.new(0, 20, 0)
                local gravity = Vector3.new(0, -Workspace.Gravity, 0)
                
                for i, part in ipairs(nadeBeamParts) do
                    local nextPos = pos + vel * 0.1 + 0.5 * gravity * (0.1 ^ 2)
                    vel = vel + gravity * 0.1
                    
                    local rp = RaycastParams.new()
                    rp.FilterType = Enum.RaycastFilterType.Exclude
                    rp.FilterDescendantsInstances = {char}
                    local res = Workspace:Raycast(pos, nextPos - pos, rp)
                    
                    if res then
                        part.CFrame = CFrame.new(res.Position)
                        part.Transparency = 0.2
                        for j = i + 1, #nadeBeamParts do
                            nadeBeamParts[j].Transparency = 1
                        end
                        break
                    else
                        part.CFrame = CFrame.new(pos, nextPos)
                        part.Transparency = 0.3 + (i * 0.02)
                        pos = nextPos
                    end
                end
            else
                clearNadeBeam()
            end
        else
            clearNadeBeam()
        end
    else
        clearNadeBeam()
    end

    if espEnabled then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and not p.Character:FindFirstChild("CustomEspHighlight") then
                local hl = Instance.new("Highlight")
                hl.Name = "CustomEspHighlight"
                hl.Adornee = p.Character
                hl.FillColor = isTeamMate(p) and Color3.fromRGB(50, 150, 255) or Color3.fromRGB(255, 50, 50)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.FillTransparency = 0.4
                hl.Parent = p.Character
            end
        end
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                local hl = p.Character:FindFirstChild("CustomEspHighlight")
                if hl then hl:Destroy() end
            end
        end
    end

    if currentHitboxIndex > 1 then
        local let = hitboxModes[currentHitboxIndex]
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and not isTeamMate(p) and p.Character then
                local root = p.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.Size = let.size
                    root.Transparency = let.trans
                    root.CanCollide = false
                end
            end
        end
    else
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                local root = p.Character:FindFirstChild("HumanoidRootPart")
                if root then root.Size = Vector3.new(2, 2, 1) root.Transparency = 1 end
            end
        end
    end

    if aimEnabled and not userIsMovingMouse then
        local target = getClosestInFovPlayer()
        if target then
            camera.CFrame = camera.CFrame:Lerp(CFrame.new(camera.CFrame.Position, target.Position), aimSpeeds[currentSpeedIndex].value)
        end
    end

    local style = crosshairStyles[currentCrossStyleIndex]
    if style == "Classic Cross" then
        crosshairLabel.Text = "+"
        crosshairLabel.Rotation = 0
    elseif style == "Red Spinning" then
        spinAngle = (spinAngle + dt * 180) % 360
        crosshairLabel.Text = "❌"
        crosshairLabel.Rotation = spinAngle
    elseif style == "Minecraft Pig 🐷" then
        crosshairLabel.Text = "🐷"
        crosshairLabel.Rotation = 0
    end
end)
