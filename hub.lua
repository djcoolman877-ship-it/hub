-- DARKS EXPLOIT HUB - THREE TABS VERSION
-- Player, Southwest Florida, San Diego Border Roleplay

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Colors
local colors = {
    bg = Color3.fromRGB(20, 20, 30),
    frame = Color3.fromRGB(35, 35, 50),
    tabOff = Color3.fromRGB(50, 50, 70),
    tabOn = Color3.fromRGB(70, 70, 90),
    text = Color3.fromRGB(255, 255, 255),
    accent = Color3.fromRGB(0, 150, 255),
    green = Color3.fromRGB(0, 255, 100),
    red = Color3.fromRGB(255, 50, 50),
    gray = Color3.fromRGB(60, 60, 75),
    warning = Color3.fromRGB(255, 150, 0)
}

-- Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarksHub"
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 400, 0, 480)
Main.Position = UDim2.new(0.5, -200, 0.5, -240)
Main.BackgroundColor3 = colors.bg
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = colors.frame
Title.Text = "  Darks Exploit Hub"
Title.TextColor3 = colors.text
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

-- Close
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -37, 0, 2)
Close.BackgroundColor3 = colors.red
Close.Text = "X"
Close.TextColor3 = colors.text
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.Parent = Main

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Drag
local drag = false
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        local start = input.Position
        local pos = Main.Position
        local conn
        conn = UserInputService.InputChanged:Connect(function(move)
            if drag and move.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = move.Position - start
                Main.Position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X, pos.Y.Scale, pos.Y.Offset + delta.Y)
            end
        end)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                drag = false
                if conn then conn:Disconnect() end
            end
        end)
    end
end)

-- Hide with K
UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.K and not gp then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

-- TABS (Three tabs - each 33.33% width)
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 35)
TabBar.Position = UDim2.new(0, 0, 0, 40)
TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TabBar.Parent = Main

-- Tab buttons (3 tabs, each ~33% width)
local PlayerTab = Instance.new("TextButton")
PlayerTab.Size = UDim2.new(0.333, -2, 1, -4)
PlayerTab.Position = UDim2.new(0, 1, 0, 2)
PlayerTab.BackgroundColor3 = colors.tabOn
PlayerTab.Text = "Player"
PlayerTab.TextColor3 = colors.text
PlayerTab.Font = Enum.Font.GothamBold
PlayerTab.TextSize = 12
PlayerTab.Parent = TabBar

local SWFTab = Instance.new("TextButton")
SWFTab.Size = UDim2.new(0.333, -2, 1, -4)
SWFTab.Position = UDim2.new(0.333, 1, 0, 2)
SWFTab.BackgroundColor3 = colors.tabOff
SWFTab.Text = "Southwest FL"
SWFTab.TextColor3 = Color3.fromRGB(180, 180, 200)
SWFTab.Font = Enum.Font.GothamBold
SWFTab.TextSize = 12
SWFTab.Parent = TabBar

local SDBRTab = Instance.new("TextButton")
SDBRTab.Size = UDim2.new(0.333, -2, 1, -4)
SDBRTab.Position = UDim2.new(0.666, 1, 0, 2)
SDBRTab.BackgroundColor3 = colors.tabOff
SDBRTab.Text = "San Diego BR"
SDBRTab.TextColor3 = Color3.fromRGB(180, 180, 200)
SDBRTab.Font = Enum.Font.GothamBold
SDBRTab.TextSize = 11
SDBRTab.Parent = TabBar

-- CONTENT FRAMES
local PlayerContent = Instance.new("Frame")
PlayerContent.Size = UDim2.new(1, -20, 1, -85)
PlayerContent.Position = UDim2.new(0, 10, 0, 80)
PlayerContent.BackgroundTransparency = 1
PlayerContent.Parent = Main

local SWFContent = Instance.new("Frame")
SWFContent.Size = UDim2.new(1, -20, 1, -85)
SWFContent.Position = UDim2.new(0, 10, 0, 80)
SWFContent.BackgroundTransparency = 1
SWFContent.Visible = false
SWFContent.Parent = Main

local SDBRContent = Instance.new("Frame")
SDBRContent.Size = UDim2.new(1, -20, 1, -85)
SDBRContent.Position = UDim2.new(0, 10, 0, 80)
SDBRContent.BackgroundTransparency = 1
SDBRContent.Visible = false
SDBRContent.Parent = Main

-- Tab Switching Function
local function switchTab(tabName)
    PlayerContent.Visible = (tabName == "Player")
    SWFContent.Visible = (tabName == "SWF")
    SDBRContent.Visible = (tabName == "SDBR")
    
    PlayerTab.BackgroundColor3 = (tabName == "Player") and colors.tabOn or colors.tabOff
    PlayerTab.TextColor3 = (tabName == "Player") and colors.text or Color3.fromRGB(180, 180, 200)
    
    SWFTab.BackgroundColor3 = (tabName == "SWF") and colors.tabOn or colors.tabOff
    SWFTab.TextColor3 = (tabName == "SWF") and colors.text or Color3.fromRGB(180, 180, 200)
    
    SDBRTab.BackgroundColor3 = (tabName == "SDBR") and colors.tabOn or colors.tabOff
    SDBRTab.TextColor3 = (tabName == "SDBR") and colors.text or Color3.fromRGB(180, 180, 200)
end

PlayerTab.MouseButton1Click:Connect(function() switchTab("Player") end)
SWFTab.MouseButton1Click:Connect(function() switchTab("SWF") end)
SDBRTab.MouseButton1Click:Connect(function() switchTab("SDBR") end)

-- HELPER FUNCTIONS
local function addSection(parent, text, y)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 25)
    label.Position = UDim2.new(0, 0, 0, y)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = colors.accent
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, y + 23)
    line.BackgroundColor3 = colors.accent
    line.BorderSizePixel = 0
    line.Parent = parent
    
    return y + 35
end

local function addToggle(parent, text, y, callback)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -70, 0, 30)
    label.Position = UDim2.new(0, 0, 0, y)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = colors.text
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 60, 0, 28)
    btn.Position = UDim2.new(1, -60, 0, y)
    btn.BackgroundColor3 = colors.gray
    btn.Text = "OFF"
    btn.TextColor3 = colors.text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = parent
    
    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        btn.Text = on and "ON" or "OFF"
        btn.BackgroundColor3 = on and colors.green or colors.gray
        if callback then callback(on) end
    end)
    
    return y + 40
end

local function addSlider(parent, text, min, max, default, y, callback)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -40, 0, 20)
    label.Position = UDim2.new(0, 0, 0, y)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = colors.text
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    
    local val = Instance.new("TextLabel")
    val.Size = UDim2.new(0, 40, 0, 20)
    val.Position = UDim2.new(1, -40, 0, y)
    val.BackgroundTransparency = 1
    val.Text = tostring(default)
    val.TextColor3 = colors.accent
    val.Font = Enum.Font.GothamBold
    val.TextSize = 13
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.Parent = parent
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 0, 18)
    bg.Position = UDim2.new(0, 0, 0, y + 25)
    bg.BackgroundColor3 = colors.gray
    bg.BorderSizePixel = 0
    bg.Parent = parent
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = colors.accent
    fill.BorderSizePixel = 0
    fill.Parent = bg
    
    local hit = Instance.new("TextButton")
    hit.Size = UDim2.new(1, 0, 0, 18)
    hit.Position = UDim2.new(0, 0, 0, y + 25)
    hit.BackgroundTransparency = 1
    hit.Text = ""
    hit.Parent = parent
    
    local sliding = false
    local function update(input)
        local x = math.clamp((input.Position.X - bg.AbsolutePosition.X) / bg.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(x, 0, 1, 0)
        local v = math.floor(min + (max - min) * x)
        val.Text = tostring(v)
        if callback then callback(v) end
    end
    
    hit.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = true
            update(input)
        end
    end)
    
    hit.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            sliding = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
    
    if callback then callback(default) end
    return y + 55
end

-- Large Button (for Anti-Cheat Bypass)
local function addBigButton(parent, text, y, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.BackgroundColor3 = colors.warning
    btn.Text = text
    btn.TextColor3 = colors.text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = parent
    
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return y + 60
end

-- ================= PLAYER CONTENT =================
local y = 0
y = addSection(PlayerContent, "General Mods", y)
y = addToggle(PlayerContent, "NoClip", y, function(state)
    if state then
        _G.nc = RunService.Stepped:Connect(function()
            local c = Player.Character
            if c then for _, p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
        end)
    else
        if _G.nc then _G.nc:Disconnect() _G.nc = nil end
    end
end)

y = addToggle(PlayerContent, "Infinite Jump", y, function(state)
    if state then
        _G.ij = UserInputService.JumpRequest:Connect(function()
            local h = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    else
        if _G.ij then _G.ij:Disconnect() _G.ij = nil end
    end
end)

y = addSection(PlayerContent, "Movement", y)
y = addSlider(PlayerContent, "WalkSpeed", 16, 500, 16, y, function(v)
    local h = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed = v end
end)

y = addToggle(PlayerContent, "Fly", y, function(state)
    if state then
        _G.fs = 50
        _G.fly = RunService.Heartbeat:Connect(function()
            local c = Player.Character
            if not c then return end
            local r = c:FindFirstChild("HumanoidRootPart")
            if not r then return end
            local d = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then d = d + Vector3.new(0, 0, -1) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then d = d + Vector3.new(0, 0, 1) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then d = d + Vector3.new(-1, 0, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then d = d + Vector3.new(1, 0, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then d = d + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then d = d + Vector3.new(0, -1, 0) end
            if d.Magnitude > 0 then r.CFrame = r.CFrame + d.Unit * (_G.fs or 50) * 0.1 end
        end)
    else
        if _G.fly then _G.fly:Disconnect() _G.fly = nil end
    end
end)

y = addSlider(PlayerContent, "FlySpeed", 10, 500, 50, y, function(v)
    _G.fs = v
end)

-- ================= SWF CONTENT =================
y = 0
y = addSection(SWFContent, "Vehicle Mods", y)
y = addSlider(SWFContent, "Car Speed", 0, 1000, 50, y, function(v)
    local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
    if s and s:IsA("VehicleSeat") then s.MaxSpeed = v end
    local c = s and s:FindFirstAncestorOfClass("Model")
    if c then
        local p = c.PrimaryPart or c:FindFirstChild("Body") or c:FindFirstChild("Chassis")
        if p then p.AssemblyLinearVelocity = p.CFrame.LookVector * v end
    end
end)

y = addToggle(SWFContent, "Car Fly", y, function(state)
    if state then
        _G.cf = RunService.Heartbeat:Connect(function()
            local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
            if not s then return end
            local c = s:FindFirstAncestorOfClass("Model")
            if not c then return end
            local p = c.PrimaryPart or c:FindFirstChild("Body") or c:FindFirstChild("Chassis")
            if not p then return end
            p.CanCollide = false
            local d = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then d = d + Vector3.new(0, 0, -1) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then d = d + Vector3.new(0, 0, 1) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then d = d + Vector3.new(-1, 0, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then d = d + Vector3.new(1, 0, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then d = d + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then d = d + Vector3.new(0, -1, 0) end
            if d.Magnitude > 0 then p.CFrame = p.CFrame + d.Unit * 5 end
        end)
    else
        if _G.cf then _G.cf:Disconnect() _G.cf = nil end
        local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
        if s then
            local c = s:FindFirstAncestorOfClass("Model")
            if c then
                local p = c.PrimaryPart or c:FindFirstChild("Body") or c:FindFirstChild("Chassis")
                if p then p.CanCollide = true end
            end
        end
    end
end)

y = addToggle(SWFContent, "Instant Stop", y, function(state)
    if state then
        local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
        if s then
            local c = s:FindFirstAncestorOfClass("Model")
            if c then for _, p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Velocity = Vector3.new() p.RotVelocity = Vector3.new() end end end
        end
    end
end)

y = addToggle(SWFContent, "Anti-Flip", y, function(state)
    if state then
        _G.af = RunService.Heartbeat:Connect(function()
            local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
            if not s then return end
            local c = s:FindFirstAncestorOfClass("Model")
            if not c then return end
            local p = c.PrimaryPart or c:FindFirstChild("Body") or c:FindFirstChild("Chassis")
            if not p then return end
            local pos = p.Position
            local look = p.CFrame.LookVector
            p.CFrame = CFrame.new(pos) * CFrame.Angles(0, math.atan2(look.X, look.Z), 0)
        end)
    else
        if _G.af then _G.af:Disconnect() _G.af = nil end
    end
end)

-- ================= SAN DIEGO BORDER ROLEPLAY CONTENT =================
y = 0
y = addSection(SDBRContent, "Vehicle Mods", y)

-- Car Speed for SDBR
y = addSlider(SDBRContent, "Car Speed", 0, 1000, 50, y, function(v)
    -- San Diego Border Roleplay specific car speed
    local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
    if s and s:IsA("VehicleSeat") then
        s.MaxSpeed = v
        -- Alternative methods for different vehicle systems
        local car = s:FindFirstAncestorOfClass("Model")
        if car then
            -- Try to find vehicle value
            local vehicle = car:FindFirstChild("Vehicle") or car:FindFirstChild("Car")
            if vehicle then
                local speedValue = vehicle:FindFirstChild("Speed") or vehicle:FindFirstChild("MaxSpeed") or vehicle:FindFirstChild("Velocity")
                if speedValue and speedValue:IsA("NumberValue") then
                    speedValue.Value = v
                end
            end
            -- Direct primary part velocity
            local primary = car.PrimaryPart or car:FindFirstChild("Body") or car:FindFirstChild("Chassis") or car:FindFirstChild("Base")
            if primary and primary:IsA("BasePart") then
                primary.AssemblyLinearVelocity = primary.CFrame.LookVector * v
            end
        end
    end
end)

-- Anti-Cheat Bypass Button
y = addSection(SDBRContent, "Security", y)
y = addBigButton(SDBRContent, "ANTI-CHEAT BYPASS", y, function()
    -- Anti-cheat bypass methods
    print("Attempting Anti-Cheat Bypass...")
    
    -- Method 1: Disable common anti-cheat detections
    local mt = getrawmetatable and getrawmetatable(game)
    if mt and setreadonly then
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" or method == "kick" then
                print("Bypassed kick attempt")
                return nil
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end
    
    -- Method 2: Hook detection functions
    if hookfunction then
        -- Hook common detection functions
        local oldNamecall
        oldNamecall = hookfunction(game.Players.LocalPlayer.Kick, function() 
            print("Kick blocked")
        end)
    end
    
    -- Method 3: Disable client-side checks
    local rs = game:GetService("RunService")
    if rs then
        -- Clear any detection loops
        for _, conn in pairs(getconnections and getconnections(rs.Heartbeat) or {}) do
            if conn and conn.Function then
                local info = debug and debug.getinfo(conn.Function)
                if info and info.name and (info.name:lower():find("detect") or info.name:lower():find("check") or info.name:lower():find("ban")) then
                    conn:Disable()
                    print("Disabled detection:", info.name)
                end
            end
        end
    end
    
    -- Method 4: Spoof values
    local char = Player.Character
    if char then
        -- Spoof position to prevent teleport detection
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local lastPos = hrp.Position
            game:GetService("RunService").Heartbeat:Connect(function()
                if hrp and (hrp.Position - lastPos).Magnitude > 100 then
                    -- Teleport detected, spoof back
                    lastPos = hrp.Position
                end
            end)
        end
    end
    
    -- Visual feedback
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 200, 0, 50)
    notif.Position = UDim2.new(0.5, -100, 0.5, -25)
    notif.BackgroundColor3 = colors.green
    notif.Text = "BYPASS ACTIVATED"
    notif.TextColor3 = colors.text
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 18
    notif.Parent = ScreenGui
    game:GetService("Debris"):AddItem(notif, 2)
    
    print("Anti-Cheat Bypass Complete!")
end)

-- Additional SDBR features
y = addToggle(SDBRContent, "Auto Drive", y, function(state)
    if state then
        _G.ad = RunService.Heartbeat:Connect(function()
            local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
            if not s then return end
            local c = s:FindFirstAncestorOfClass("Model")
            if not c then return end
            local p = c.PrimaryPart or c:FindFirstChild("Body") or c:FindFirstChild("Chassis")
            if not p then return end
            -- Auto drive forward
            p.CFrame = p.CFrame + p.CFrame.LookVector * 2
        end)
    else
        if _G.ad then _G.ad:Disconnect() _G.ad = nil end
    end
end)

y = addToggle(SDBRContent, "No Tire Damage", y, function(state)
    -- Prevent tire popping
    local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
    if not s then return end
    local c = s:FindFirstAncestorOfClass("Model")
    if not c then return end
    for _, part in pairs(c:GetDescendants()) do
        if part.Name:lower():find("tire") or part.Name:lower():find("wheel") then
            if state then
                part.CanTouch = false
                part.CanQuery = false
            else
                part.CanTouch = true
                part.CanQuery = true
            end
        end
    end
end)

print("Darks Exploit Hub - Three Tabs Loaded!")
print("Player | Southwest Florida | San Diego Border Roleplay")
print("Press 'K' to hide/show GUI")
