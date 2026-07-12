-- DARKS EXPLOIT HUB - COMPLETE VERSION WITH KILL ALL
-- Player, Southwest Florida, San Diego Border Roleplay, Brookhaven

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
    warning = Color3.fromRGB(255, 150, 0),
    dropdown = Color3.fromRGB(45, 45, 60),
    dropdownHover = Color3.fromRGB(60, 60, 80),
    gold = Color3.fromRGB(255, 215, 0),
    darkRed = Color3.fromRGB(150, 0, 0),
    blood = Color3.fromRGB(200, 0, 0)
}

-- Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarksHub"
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 420, 0, 520)
Main.Position = UDim2.new(0.5, -210, 0.5, -260)
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

-- TABS (Four tabs)
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 35)
TabBar.Position = UDim2.new(0, 0, 0, 40)
TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TabBar.Parent = Main

local PlayerTab = Instance.new("TextButton")
PlayerTab.Size = UDim2.new(0.25, -2, 1, -4)
PlayerTab.Position = UDim2.new(0, 1, 0, 2)
PlayerTab.BackgroundColor3 = colors.tabOn
PlayerTab.Text = "Player"
PlayerTab.TextColor3 = colors.text
PlayerTab.Font = Enum.Font.GothamBold
PlayerTab.TextSize = 11
PlayerTab.Parent = TabBar

local SWFTab = Instance.new("TextButton")
SWFTab.Size = UDim2.new(0.25, -2, 1, -4)
SWFTab.Position = UDim2.new(0.25, 1, 0, 2)
SWFTab.BackgroundColor3 = colors.tabOff
SWFTab.Text = "Southwest FL"
SWFTab.TextColor3 = Color3.fromRGB(180, 180, 200)
SWFTab.Font = Enum.Font.GothamBold
SWFTab.TextSize = 10
SWFTab.Parent = TabBar

local SDBRTab = Instance.new("TextButton")
SDBRTab.Size = UDim2.new(0.25, -2, 1, -4)
SDBRTab.Position = UDim2.new(0.5, 1, 0, 2)
SDBRTab.BackgroundColor3 = colors.tabOff
SDBRTab.Text = "San Diego BR"
SDBRTab.TextColor3 = Color3.fromRGB(180, 180, 200)
SDBRTab.Font = Enum.Font.GothamBold
SDBRTab.TextSize = 10
SDBRTab.Parent = TabBar

local BrookhavenTab = Instance.new("TextButton")
BrookhavenTab.Size = UDim2.new(0.25, -2, 1, -4)
BrookhavenTab.Position = UDim2.new(0.75, 1, 0, 2)
BrookhavenTab.BackgroundColor3 = colors.tabOff
BrookhavenTab.Text = "Brookhaven"
BrookhavenTab.TextColor3 = Color3.fromRGB(180, 180, 200)
BrookhavenTab.Font = Enum.Font.GothamBold
BrookhavenTab.TextSize = 11
BrookhavenTab.Parent = TabBar

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

local BrookhavenContent = Instance.new("Frame")
BrookhavenContent.Size = UDim2.new(1, -20, 1, -85)
BrookhavenContent.Position = UDim2.new(0, 10, 0, 80)
BrookhavenContent.BackgroundTransparency = 1
BrookhavenContent.Visible = false
BrookhavenContent.Parent = Main

-- Tab Switching
local function switchTab(tabName)
    PlayerContent.Visible = (tabName == "Player")
    SWFContent.Visible = (tabName == "SWF")
    SDBRContent.Visible = (tabName == "SDBR")
    BrookhavenContent.Visible = (tabName == "Brookhaven")
    
    PlayerTab.BackgroundColor3 = (tabName == "Player") and colors.tabOn or colors.tabOff
    PlayerTab.TextColor3 = (tabName == "Player") and colors.text or Color3.fromRGB(180, 180, 200)
    
    SWFTab.BackgroundColor3 = (tabName == "SWF") and colors.tabOn or colors.tabOff
    SWFTab.TextColor3 = (tabName == "SWF") and colors.text or Color3.fromRGB(180, 180, 200)
    
    SDBRTab.BackgroundColor3 = (tabName == "SDBR") and colors.tabOn or colors.tabOff
    SDBRTab.TextColor3 = (tabName == "SDBR") and colors.text or Color3.fromRGB(180, 180, 200)
    
    BrookhavenTab.BackgroundColor3 = (tabName == "Brookhaven") and colors.tabOn or colors.tabOff
    BrookhavenTab.TextColor3 = (tabName == "Brookhaven") and colors.text or Color3.fromRGB(180, 180, 200)
end

PlayerTab.MouseButton1Click:Connect(function() switchTab("Player") end)
SWFTab.MouseButton1Click:Connect(function() switchTab("SWF") end)
SDBRTab.MouseButton1Click:Connect(function() switchTab("SDBR") end)
BrookhavenTab.MouseButton1Click:Connect(function() switchTab("Brookhaven") end)

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

local function addBigButton(parent, text, y, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.BackgroundColor3 = color or colors.warning
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

-- ================= SDBR CONTENT =================
y = 0
y = addSection(SDBRContent, "Vehicle Mods", y)

y = addSlider(SDBRContent, "Car Speed", 0, 1000, 50, y, function(v)
    local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
    if s and s:IsA("VehicleSeat") then
        s.MaxSpeed = v
        local car = s:FindFirstAncestorOfClass("Model")
        if car then
            local vehicle = car:FindFirstChild("Vehicle") or car:FindFirstChild("Car")
            if vehicle then
                local speedValue = vehicle:FindFirstChild("Speed") or vehicle:FindFirstChild("MaxSpeed") or vehicle:FindFirstChild("Velocity")
                if speedValue and speedValue:IsA("NumberValue") then
                    speedValue.Value = v
                end
            end
            local primary = car.PrimaryPart or car:FindFirstChild("Body") or car:FindFirstChild("Chassis") or car:FindFirstChild("Base")
            if primary and primary:IsA("BasePart") then
                primary.AssemblyLinearVelocity = primary.CFrame.LookVector * v
            end
        end
    end
end)

y = addToggle(SDBRContent, "Car Fly", y, function(state)
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

y = addSection(SDBRContent, "Security", y)
y = addBigButton(SDBRContent, "ANTI-CHEAT BYPASS", y, colors.warning, function()
    print("Attempting Anti-Cheat Bypass...")
    
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
    
    if hookfunction then
        local oldNamecall = hookfunction(game.Players.LocalPlayer.Kick, function() 
            print("Kick blocked")
        end)
    end
    
    local rs = game:GetService("RunService")
    if rs then
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
    
    local char = Player.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local lastPos = hrp.Position
            game:GetService("RunService").Heartbeat:Connect(function()
                if hrp and (hrp.Position - lastPos).Magnitude > 100 then
                    lastPos = hrp.Position
                end
            end)
        end
    end
    
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

y = addToggle(SDBRContent, "Auto Drive", y, function(state)
    if state then
        _G.ad = RunService.Heartbeat:Connect(function()
            local s = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChildOfClass("Humanoid").SeatPart
            if not s then return end
            local c = s:FindFirstAncestorOfClass("Model")
            if not c then return end
            local p = c.PrimaryPart or c:FindFirstChild("Body") or c:FindFirstChild("Chassis")
            if not p then return end
            p.CFrame = p.CFrame + p.CFrame.LookVector * 2
        end)
    else
        if _G.ad then _G.ad:Disconnect() _G.ad = nil end
    end
end)

y = addToggle(SDBRContent, "No Tire Damage", y, function(state)
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

-- ================= BROOKHAVEN CONTENT =================
y = 0

-- KILL ALL SECTION
y = addSection(BrookhavenContent, "Combat", y)

-- KILL ALL BUTTON
y = addBigButton(BrookhavenContent, "KILL ALL PLAYERS", y, colors.blood, function()
    print("Killing all players...")
    
    local killedCount = 0
    
    -- Method 1: Break joints (most reliable)
    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
        if target ~= Player and target.Character then
            -- Break joints to kill
            local success = pcall(function()
                target.Character:BreakJoints()
            end)
            if success then
                killedCount = killedCount + 1
            end
            
            -- Also try to set health to 0
            local hum = target.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                pcall(function()
                    hum.Health = 0
                end)
            end
            
            -- Try to destroy head
            local head = target.Character:FindFirstChild("Head")
            if head then
                pcall(function()
                    head:Destroy()
                end)
            end
        end
    end
    
    -- Method 2: Use remotes if available
    local rs = game:GetService("ReplicatedStorage")
    local remotes = rs:FindFirstChild("Remotes") or rs:FindFirstChild("RemoteEvents") or rs:FindFirstChild("Events")
    if remotes then
        for _, remote in pairs(remotes:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                if remote.Name:lower():find("kill") or remote.Name:lower():find("damage") or remote.Name:lower():find("hurt") then
                    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                        if target ~= Player then
                            pcall(function()
                                remote:FireServer(target, 999999)
                            end)
                        end
                    end
                end
            end
        end
    end
    
    -- Method 3: Brookhaven specific - use damage remote
    local bhRemotes = rs:FindFirstChild("Brookhaven") or rs:FindFirstChild("BH")
    if bhRemotes then
        local damageRemote = bhRemotes:FindFirstChild("Damage") or bhRemotes:FindFirstChild("TakeDamage") or bhRemotes:FindFirstChild("Hurt")
        if damageRemote and damageRemote:IsA("RemoteEvent") then
            for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                if target ~= Player then
                    pcall(function()
                        damageRemote:FireServer(target.Character, 999999)
                    end)
                end
            end
        end
    end
    
    -- Method 4: Teleport them to void
    for _, target in pairs(game:GetService("Players"):GetPlayers()) do
        if target ~= Player and target.Character then
            local hrp = target.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                pcall(function()
                    hrp.CFrame = CFrame.new(0, -10000, 0)
                end)
            end
        end
    end
    
    -- Visual feedback
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 300, 0, 60)
    notif.Position = UDim2.new(0.5, -150, 0.5, -30)
    notif.BackgroundColor3 = colors.blood
    notif.Text = "KILLED " .. killedCount .. " PLAYERS!"
    notif.TextColor3 = colors.text
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 20
    notif.Parent = ScreenGui
    game:GetService("Debris"):AddItem(notif, 3)
    
    print("Kill All complete! Killed " .. killedCount .. " players.")
end)

-- Kill Aura Toggle
y = addToggle(BrookhavenContent, "Kill Aura (Auto Kill Near)", y, function(state)
    if state then
        _G.ka = RunService.Heartbeat:Connect(function()
            local myChar = Player.Character
            if not myChar then return end
            local myHRP = myChar:FindFirstChild("HumanoidRootPart")
            if not myHRP then return end
            
            for _, target in pairs(game:GetService("Players"):GetPlayers()) do
                if target ~= Player and target.Character then
                    local theirHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    if theirHRP then
                        local distance = (myHRP.Position - theirHRP.Position).Magnitude
                        if distance < 20 then -- Within 20 studs
                            -- Kill them
                            pcall(function()
                                target.Character:BreakJoints()
                            end)
                            local hum = target.Character:FindFirstChildOfClass("Humanoid")
                            if hum then
                                pcall(function()
                                    hum.Health = 0
                                end)
                            end
                        end
                    end
                end
            end
        end)
    else
        if _G.ka then _G.ka:Disconnect() _G.ka = nil end
    end
end)

-- GAMEPASSES SECTION
y = addSection(BrookhavenContent, "Gamepasses", y)

y = addBigButton(BrookhavenContent, "UNLOCK ALL GAMEPASSES", y, colors.gold, function()
    print("Unlocking all gamepasses...")
    
    local gamepasses = {
        "Premium", "VIP", "Admin", "HouseSlots", "ExtraCars", "SuperAdmin",
        "Police", "Firefighter", "Mayor", "GodMode", "Fly", "Noclip",
        "Invisible", "Speed", "JumpPower", "UnlimitedMoney", "AllHouses",
        "AllCars", "AllItems", "AllPets", "AllTools", "AllWeapons"
    }
    
    local successCount = 0
    
    for _, gpName in ipairs(gamepasses) do
        local gp = Player:FindFirstChild(gpName) or Player:FindFirstChild("Has" .. gpName) or Player:FindFirstChild("Owns" .. gpName)
        if gp then
            if gp:IsA("BoolValue") then
                gp.Value = true
                successCount = successCount + 1
            elseif gp:IsA("IntValue") or gp:IsA("NumberValue") then
                gp.Value = 1
                successCount = successCount + 1
            end
        end
    end
    
    local stats = Player:FindFirstChild("Stats") or Player:FindFirstChild("Data") or Player:FindFirstChild("leaderstats")
    if stats then
        for _, gpName in ipairs(gamepasses) do
            local gp = stats:FindFirstChild(gpName) or stats:FindFirstChild("Has" .. gpName) or stats:FindFirstChild("Owns" .. gpName)
            if gp then
                if gp:IsA("BoolValue") then
                    gp.Value = true
                    successCount = successCount + 1
                elseif gp:IsA("IntValue") or gp:IsA("NumberValue") then
                    gp.Value = 1
                    successCount = successCount + 1
                end
            end
        end
    end
    
    local MarketService = game:GetService("MarketplaceService")
    if MarketService and hookfunction then
        local oldFunc = hookfunction(MarketService.PlayerOwnsGamePassAsync, function()
            return true
        end)
    end
    
    local folder = Instance.new("Folder")
    folder.Name = "UnlockedGamepasses"
    folder.Parent = Player
    
    for _, gpName in ipairs(gamepasses) do
        local bool = Instance.new("BoolValue")
        bool.Name = gpName
        bool.Value = true
        bool.Parent = folder
    end
    
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 300, 0, 60)
    notif.Position = UDim2.new(0.5, -150, 0.5, -30)
    notif.BackgroundColor3 = colors.gold
    notif.Text = "ALL GAMEPASSES UNLOCKED!\n(" .. successCount .. " found)"
    notif.TextColor3 = colors.text
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 16
    notif.Parent = ScreenGui
    game:GetService("Debris"):AddItem(notif, 3)
    
    print("Gamepass unlock complete!")
end)

-- Individual Gamepass Toggles
y = addToggle(BrookhavenContent, "Premium", y, function(state)
    local gp = Player:FindFirstChild("Premium") or Player:FindFirstChild("HasPremium")
    if gp and gp:IsA("BoolValue") then gp.Value = state end
    if not gp then
        gp = Instance.new("BoolValue")
        gp.Name = "Premium"
        gp.Value = state
        gp.Parent = Player
    end
end)

y = addToggle(BrookhavenContent, "VIP", y, function(state)
    local gp = Player:FindFirstChild("VIP") or Player:FindFirstChild("HasVIP")
    if gp and gp:IsA("BoolValue") then gp.Value = state end
    if not gp then
        gp = Instance.new("BoolValue")
        gp.Name = "VIP"
        gp.Value = state
        gp.Parent = Player
    end
end)

y = addToggle(BrookhavenContent, "Admin", y, function(state)
    local gp = Player:FindFirstChild("Admin") or Player:FindFirstChild("HasAdmin")
    if gp and gp:IsA("BoolValue") then gp.Value = state end
    if not gp then
        gp = Instance.new("BoolValue")
        gp.Name = "Admin"
        gp.Value = state
        gp.Parent = Player
    end
end)

-- TELEPORT SECTION
y = addSection(BrookhavenContent, "Teleport", y)

_G.selectedPlayer = nil

local dropdownFrame = Instance.new("Frame")
dropdownFrame.Size = UDim2.new(1, 0, 0, 40)
dropdownFrame.Position = UDim2.new(0, 0, 0, y)
dropdownFrame.BackgroundColor3 = colors.dropdown
dropdownFrame.BorderSizePixel = 0
dropdownFrame.Parent = BrookhavenContent

local dropdownBtn = Instance.new("TextButton")
dropdownBtn.Size = UDim2.new(1, 0, 1, 0)
dropdownBtn.BackgroundColor3 = colors.dropdown
dropdownBtn.Text = "  Select Player ▼"
dropdownBtn.TextColor3 = colors.text
dropdownBtn.Font = Enum.Font.Gotham
dropdownBtn.TextSize = 14
dropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
dropdownBtn.Parent = dropdownFrame

local dropdownList = Instance.new("Frame")
dropdownList.Size = UDim2.new(1, 0, 0, 150)
dropdownList.Position = UDim2.new(0, 0, 1, 0)
dropdownList.BackgroundColor3 = colors.dropdown
dropdownList.BorderSizePixel = 0
dropdownList.Visible = false
dropdownList.ZIndex = 10
dropdownList.Parent = dropdownFrame

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ZIndex = 11
scrollFrame.Parent = dropdownList

local function updatePlayerList()
    for _, child in pairs(scrollFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    local yOffset = 0
    local players = game:GetService("Players"):GetPlayers()
    
    for _, plr in ipairs(players) do
        if plr ~= Player then
            local playerBtn = Instance.new("TextButton")
            playerBtn.Size = UDim2.new(1, 0, 0, 30)
            playerBtn.Position = UDim2.new(0, 0, 0, yOffset)
            playerBtn.BackgroundColor3 = colors.dropdown
            playerBtn.Text = plr.Name
            playerBtn.TextColor3 = colors.text
            playerBtn.Font = Enum.Font.Gotham
            playerBtn.TextSize = 13
            playerBtn.ZIndex = 12
            playerBtn.Parent = scrollFrame
            
            playerBtn.MouseEnter:Connect(function()
                playerBtn.BackgroundColor3 = colors.dropdownHover
            end)
            
            playerBtn.MouseLeave:Connect(function()
                playerBtn.BackgroundColor3 = colors.dropdown
            end)
            
            playerBtn.MouseButton1Click:Connect(function()
                _G.selectedPlayer = plr
                dropdownBtn.Text = "  " .. plr.Name .. " ▼"
                dropdownList.Visible = false
            end)
            
            yOffset = yOffset + 32
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

dropdownBtn.MouseButton1Click:Connect(function()
    dropdownList.Visible = not dropdownList.Visible
    if dropdownList.Visible then
        updatePlayerList()
        dropdownBtn.Text = dropdownBtn.Text:gsub("▼", "▲")
    else
        dropdownBtn.Text = dropdownBtn.Text:gsub("▲", "▼")
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not gp then
        local mousePos = input.Position
        local dropdownAbs = dropdownList.AbsolutePosition
        local dropdownSize = dropdownList.AbsoluteSize
        
        if mousePos.X < dropdownAbs.X or mousePos.X > dropdownAbs.X + dropdownSize.X or
           mousePos.Y < dropdownAbs.Y or mousePos.Y > dropdownAbs.Y + dropdownSize.Y then
            if dropdownList.Visible then
                local btnAbs = dropdownBtn.AbsolutePosition
                local btnSize = dropdownBtn.AbsoluteSize
                if mousePos.X < btnAbs.X or mousePos.X > btnAbs.X + btnSize.X or
                   mousePos.Y < btnAbs.Y or mousePos.Y > btnAbs.Y + btnSize.Y then
                    dropdownList.Visible = false
                    dropdownBtn.Text = dropdownBtn.Text:gsub("▲", "▼")
                end
            end
        end
    end
end)

y = y + 60

y = addBigButton(BrookhavenContent, "TELEPORT TO PLAYER", y, colors.accent, function()
    if _G.selectedPlayer and _G.selectedPlayer.Character then
        local targetHRP = _G.selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        
        if targetHRP and myHRP then
            myHRP.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0)
            
            local notif = Instance.new("TextLabel")
            notif.Size = UDim2.new(0, 250, 0, 40)
            notif.Position = UDim2.new(0.5, -125, 0.5, -20)
            notif.BackgroundColor3 = colors.green
            notif.Text = "Teleported to " .. _G.selectedPlayer.Name
            notif.TextColor3 = colors.text
            notif.Font = Enum.Font.GothamBold
            notif.TextSize = 14
            notif.Parent = ScreenGui
            game:GetService("Debris"):AddItem(notif, 2)
        end
    else
        local notif = Instance.new("TextLabel")
        notif.Size = UDim2.new(0, 200, 0, 40)
        notif.Position = UDim2.new(0.5, -100, 0.5, -20)
        notif.BackgroundColor3 = colors.red
        notif.Text = "Select a player first!"
        notif.TextColor3 = colors.text
        notif.Font = Enum.Font.GothamBold
        notif.TextSize = 14
        notif.Parent = ScreenGui
        game:GetService("Debris"):AddItem(notif, 2)
    end
end)

-- Auto-update player list
game:GetService("Players").PlayerAdded:Connect(function()
    if dropdownList.Visible then
        updatePlayerList()
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function()
    if dropdownList.Visible then
        updatePlayerList()
    end
    if _G.selectedPlayer and not _G.selectedPlayer.Parent then
        _G.selectedPlayer = nil
        dropdownBtn.Text = "  Select Player ▼"
    end
end)

-- HOUSE SECTION
y = addSection(BrookhavenContent, "House", y)

y = addToggle(BrookhavenContent, "Unlock All Doors", y, function(state)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("door") and (obj:IsA("BasePart") or obj:IsA("Model")) then
            local door = obj:FindFirstChildOfClass("ClickDetector") or obj:FindFirstChild("ClickDetector")
            if door then
                door.MaxActivationDistance = state and 1000 or 10
            end
            if obj:IsA("BasePart") then
                obj.CanCollide = not state
            end
        end
    end
end)

y = addToggle(BrookhavenContent, "Auto Rob", y, function(state)
    if state then
        _G.autorob = RunService.Heartbeat:Connect(function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find("money") or obj.Name:lower():find("cash") or obj.Name:lower():find("collect") then
                    if obj:IsA("BasePart") and obj:FindFirstChildOfClass("TouchTransmitter") then
                        firetouchinterest(Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"), obj, 0)
                        firetouchinterest(Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"), obj, 1)
                    end
                end
            end
        end)
    else
        if _G.autorob then _G.autorob:Disconnect() _G.autorob = nil end
    end
end)

-- FUN SECTION
y = addSection(BrookhavenContent, "Fun", y)

y = addToggle(BrookhavenContent, "Invisible", y, function(state)
    local char = Player.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Transparency = state and 1 or 0
        end
    end
end)

y = addSlider(BrookhavenContent, "Player Size", 0.5, 5, 1, y, function(v)
    local char = Player.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Size = part.Size * (v / (_G.lastSize or 1))
        end
    end
    _G.lastSize = v
end)

print("Darks Exploit Hub - FULL VERSION WITH KILL ALL LOADED!")
print("Features: Kill All, Kill Aura, Gamepasses, Teleport, and more!")
print("Press 'K' to hide/show GUI")
