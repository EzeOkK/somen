local Library =
loadstring(game:HttpGet('https://raw.githubusercontent.com/AccountBurner/Lib/refs/
heads/main/Library.lua'))()
local ThemeManager =
loadstring(game:HttpGet('https://raw.githubusercontent.com/AccountBurner/Lib/refs/
heads/main/ThemeManger.lua'))()
local SaveManager =
loadstring(game:HttpGet('https://raw.githubusercontent.com/AccountBurner/Lib/refs/
heads/main/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Volleyball 4.2 | SUSHI HUB',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Game'),
    UISettings= Window:AddTab('UI Settings'),
}

local PlayerTab = Tabs.Main:AddLeftTabbox()
local Player = PlayerTab:AddTab('Player')

    Player:AddToggle('JumpPowertoggle', {
        Text = 'JumpPower',
        Default = false,
        Callback = function(JumpPowder)
            if JumpPowder then
                 local player = game.Players.LocalPlayer
                 local character = player.Character or player.CharacterAdded:Wait()
                 local humanoid = character:WaitForChild("Humanoid")
                 humanoid.UseJumpPower = false
            else
                 local player = game.Players.LocalPlayer
                 local character = player.Character or player.CharacterAdded:Wait()
                 local humanoid = character:WaitForChild("Humanoid")
                 humanoid.UseJumpPower = true
            end
        end
    })

    Player:AddSlider('JumpPowerValue', {
        Text = 'JumpPower Value',
        Default = 10,
        Min = 10,
        Max = 50,
        Rounding = 1,
        Compact = false,
        Callback = function(State)
            local player = game.Players.LocalPlayer
                         local character = player.Character or
player.CharacterAdded:Wait()
                         local humanoid = character:WaitForChild("Humanoid")
                         humanoid.JumpHeight = State
        end
    })
    Player:AddToggle('HeightChangerToggle', {
        Text = 'Height Changer',
        Default = false,
        Callback = function(ValueONOFF)
            ggState = ValueONOFF

               local player = game.Players.LocalPlayer
               local character = player.Character or player.CharacterAdded:Wait()
               local humanoid = character:FindFirstChildOfClass("Humanoid")

               if humanoid and not ggState then
                   humanoid.HipHeight = 2 -- Valor padrão
               end
         end
    })

    Player:AddSlider('HeightValueSlider', {
        Text = 'Height Value',
        Default = 2,
        Min = 0,
        Max = 100,
        Rounding = 1,
        Compact = false,
        Callback = function(Value)
            if ggState then
                 local player = game.Players.LocalPlayer
                 local character = player.Character or player.CharacterAdded:Wait()
                 local humanoid = character:FindFirstChildOfClass("Humanoid")

                     if humanoid then
                         humanoid.AutomaticScalingEnabled = false
                         humanoid.HipHeight = Value
                     end
               end
         end
    })

local MatchTab = Tabs.Main:AddLeftTabbox()
local Match = MatchTab:AddTab('Match')

Match:AddToggle('infinstamina', {
    Text = 'Infinite Stamina',
    Default = false,
    Callback = function(infinstamina)
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "Stamina") then
                if infinstamina then
                     v.Stamina = math.huge
                else
                     v.Stamina = 10
                end
            end
        end
    end
})

Match:AddToggle('rotate', {
    Text = 'Jump Aimbot',
     Default = false,
     Callback = function(JumpAimbot)
         local jump
         if JumpAimbot then
             local Players = game:GetService("Players")
             local JumpUserInputService = game:GetService("UserInputService")

            local function aimbotjump()
                local player = Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local Camera = workspace.CurrentCamera
                    character.HumanoidRootPart.CFrame =
CFrame.new(character.HumanoidRootPart.Position) * CFrame.fromMatrix(Vector3.zero,
Camera.CFrame.XVector, Camera.CFrame.YVector, Camera.CFrame.ZVector)
                end
            end

                 jump = JumpUserInputService.JumpRequest:Connect(function()
                      aimbotjump()
                 end)
           else
                 if jump then
                     jump:Disconnect()
                     jump = nil
                 end
           end
     end
})

Match:AddToggle('ToggleAutoRotate', {
    Text = 'Rotate On Air',
    Default = false,
    Callback = function(state)
        if state then
             rotateConnection = RunService.Heartbeat:Connect(function()
                  local char = getMyCharacter()
                  local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                  if humanoid then
                      humanoid.AutoRotate = true
                  end
             end)
        else
             if rotateConnection then
                  rotateConnection:Disconnect()
                  rotateConnection = nil
             end
        end
    end
})

Match:AddToggle('Infiniterec', {
    Text = 'No Receive Cooldown',
    Default = false,
    Callback = function(infrec)
        local recconn
        if infrec then
            local UserInputService = game:GetService("UserInputService")
            local player = game.Players.LocalPlayer
            local humanoid = player.Character and
player.Character:WaitForChild("Humanoid")

            local function onInputBegan(input, _gameProcessed)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if humanoid and (humanoid:GetState() ==
Enum.HumanoidStateType.Jumping or humanoid:GetState() ==
Enum.HumanoidStateType.Freefall) then
                        return
                    end

                             local args = {
                                 [1] = "Receiving"
                             }


game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayerAc
tion"):FireServer(unpack(args))


                       end
                 end

                 recconn =       UserInputService.InputBegan:Connect(onInputBegan)

        else
if recconn then
    recconn:Disconnect()
    recconn = nil
end
        end
    end
})

local PowerBox = Tabs.Main:AddLeftTabbox()
local Power = PowerBox:AddTab('Power')

      local powerful
      Power:AddToggle('powerful', {
          Text = 'Spike Strenght',
          Default = false,
          Callback = function(value)
              powerful = value
              if value then

                 else
                       workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.Tilt.D =
500
                       workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.Tilt.P =
3000
                 end
           end
      })


      Power:AddSlider('powerfulslide', {
          Text = 'Value',
          Default = 0,
          Min = 0,
          Max = 15,
          Rounding = 1,
          Compact = false,
          Callback = function(value)
              if not powerful then
                  return
              end
              workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.Tilt.P = 700
* value
                if value == 0 then
                    workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.Tilt.P =
3000
                end
          end
    })

local CourtBox = Tabs.Main:AddLeftTabbox()
local Court = CourtBox:AddTab('Court')

Court:AddToggle('Ceiling', {
    Text = 'Remove Ceiling',
    Default = false,
    Callback = function(ce)
        if ce then
            game.workspace.Ceiling.CanCollide = false
            else
                 game.workspace.Ceiling.CanCollide = true
            end
    end
})

Court:AddToggle('Backrow', {
    Text = 'No Backrow Line Fault',
    Default = false,
    Callback = function(blf)
         if blf then
         game.workspace.BackrowLF.Size = Vector3.new(0.001, 1, 0.001)
    else
         game.workspace.BackrowLF.Size = Vector3.new(33, 1.499990463256836, 80)
    end
    end
})

Court:AddToggle('ServeLF', {
    Text = 'No Serve Line Fault',
    Default = false,
    Callback = function(lf)
        if lf then
        game.workspace.ServeLF.Size = Vector3.new(0.001, 1, 0.001)
        else
             game.workspace.ServeLF.Size = Vector3.new(95, 1, 120)
        end
    end
})

Court:AddToggle('Lockcourt', {
    Text = 'Unlock Court',
    Default = false,
    Callback = function(lf)
           if lf then
           game.workspace.LockCourt.Size = Vector3.new(0.001, 1, 0.001)
           else
                game.workspace.LockCourt.Size = Vector3.new(60, 50, 100)
           end
     end
})

local SpikeEspBox = Tabs.Main:AddLeftTabbox()
local SpikeEsp = SpikeEspBox:AddTab('Spike Prediction')

SpikeEsp:AddToggle('Lockcourt', {
    Text = 'Spike Esp',
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local localPlayer = Players.LocalPlayer

           _G.SpikeEspLines = _G.SpikeEspLines or {}
           _G.SpikeEspConns = _G.SpikeEspConns or {}

        local function updateLine(player)
            if player == localPlayer then return end
            local char = player.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if hum and root and (hum:GetState() == Enum.HumanoidStateType.Jumping
or hum:GetState() == Enum.HumanoidStateType.Freefall) then
                 local line = _G.SpikeEspLines[player.UserId]
                 if not line then
                     line = Instance.new("Part", workspace)
                     line.Anchored, line.CanCollide = true, false
                     line.Material = Enum.Material.SmoothPlastic
                     line.Size = Vector3.new(0.5, 0.5, 15)
                     line.Color = Color3.new(1, 1, 1)
                     _G.SpikeEspLines[player.UserId] = line
                 end
                 local dir = root.CFrame.LookVector
                 local startPos = root.Position
                 local endPos = startPos + dir * 15
                 line.CFrame = CFrame.new((startPos + endPos) / 2, endPos)
            else
                 local line = _G.SpikeEspLines[player.UserId]
                 if line then line:Destroy() _G.SpikeEspLines[player.UserId] = nil
end
            end
        end

           if state then
               _G.SpikeEspConns.render = RunService.RenderStepped:Connect(function()
                    for _, p in ipairs(Players:GetPlayers()) do updateLine(p) end
               end)
               _G.SpikeEspConns.players = Players.PlayerAdded:Connect(function(p)
                    table.insert(_G.SpikeEspConns, p.CharacterAdded:Connect(function()
                        updateLine(p)
                    end))
               end)
               for _, p in ipairs(Players:GetPlayers()) do
                       table.insert(_G.SpikeEspConns, p.CharacterAdded:Connect(function()
                           updateLine(p)
                       end))
                 end
           else
                 for _, c in pairs(_G.SpikeEspConns) do
                     if typeof(c) == "RBXScriptConnection" then c:Disconnect() end
                 end
                 _G.SpikeEspConns = {}

                 for _, l in pairs(_G.SpikeEspLines) do
                     if l and l.Destroy then l:Destroy() end
                 end
                 _G.SpikeEspLines = {}
           end
     end
})

local AutoBox = Tabs.Main:AddRightTabbox()
local Auto = AutoBox:AddTab('Auto')

local autoReceiveDistance = 5
Auto:AddToggle('receive', {
    Text = 'Auto Receive',
    Default = false,
    Callback = function(Value)
        local receiveconnect
        if Value then
            local Players = game:GetService("Players")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local RunService = game:GetService("RunService")
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:WaitForChild("Humanoid")

            local function checkAndReceive()
                if humanoid and (humanoid:GetState() ==
Enum.HumanoidStateType.Jumping or humanoid:GetState() ==
Enum.HumanoidStateType.Freefall) then
                    return
                end

                for _, ballModel in pairs(workspace:GetChildren()) do
                    if ballModel:IsA("Model") then
                        local ballPart = ballModel:FindFirstChild("BallPart")
                        if ballPart and (ballPart:IsA("Part") or
ballPart:IsA("MeshPart")) then
                             local distance = (humanoidRootPart.Position -
ballPart.Position).Magnitude
                             if distance <= autoReceiveDistance then
                                 local args = {
                                     [1] = "Receiving"
                                 }


game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayerAc
tion"):FireServer(unpack(args))
                                               VirtualInputManager:SendMouseButtonEvent(0, 0, 0,
true, game, 1)
                                               VirtualInputManager:SendMouseButtonEvent(0, 0, 0,
false, game, 1)
                                         end
                                   end
                             end
                       end
                 end

                 receiveconnect = RunService.RenderStepped:Connect(checkAndReceive)
           else
                 if receiveconnect then
                     receiveconnect:Disconnect()
                     receiveconnect = nil
                 end
           end
     end
})

Auto:AddSlider('Distanceslider', {
    Text = 'Max Distance',
    Default = 5,
    Min = 1,
    Max = 15,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        autoReceiveDistance = Value
    end
})


local autoSpikeDistance = 5
Auto:AddToggle('spike', {
    Text = 'Auto Spike',
    Default = false,
    Callback = function(Value)
        local Check
        if Value then
            local Players = game:GetService("Players")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local RunService = game:GetService("RunService")
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:WaitForChild("Humanoid")

            local function checkAndSpike()
                local state = humanoid:GetState()
                if state ~= Enum.HumanoidStateType.Jumping and state ~=
Enum.HumanoidStateType.Freefall then
                    return
                end

                       for _, ballModel in pairs(workspace:GetChildren()) do
                           if ballModel:IsA("Model") then
                               local ballPart = ballModel:FindFirstChild("BallPart")
                               if ballPart and (ballPart:IsA("Part") or
ballPart:IsA("MeshPart")) then
                             local distance = (humanoidRootPart.Position -
ballPart.Position).Magnitude
                             if distance <= autoSpikeDistance then
                                 local args = {
                                     [1] = "Spiking"
                                 }


game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayerAc
tion"):FireServer(unpack(args))

                                               VirtualInputManager:SendMouseButtonEvent(0, 0, 0,
true, game, 1)
                                               VirtualInputManager:SendMouseButtonEvent(0, 0, 0,
false, game, 1)
                                         end
                                   end
                             end
                       end
                 end

                 Check = RunService.RenderStepped:Connect(checkAndSpike)
           else
                 if Check then
                     Check:Disconnect()
                     Check = nil
                 end
           end
     end
})

Auto:AddSlider('SpikeDistanceSlider', {
    Text = 'Max Distance',
    Default = 5,
    Min = 1,
    Max = 15,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        autoSpikeDistance = Value
    end
})


local autoReceiveDasbasdistance = 5
Auto:AddToggle('dive', {
    Text = 'Auto Dive',
    Default = false,
    Callback = function(Value)
        local skibidi
        if Value then
            local key =
game:GetService("Players").LocalPlayer.PlayerGui.HUD.MainFrame.MenuDisplay.Keybinds
.KeybindsFrame.Keyboard.Dive.BindSelect.Text
            local keyCode = Enum.KeyCode[key]
            local Players = game:GetService("Players")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local RunService = game:GetService("RunService")
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:WaitForChild("Humanoid")
            if humanoid and (humanoid:GetState() == Enum.HumanoidStateType.Jumping
or humanoid:GetState() == Enum.HumanoidStateType.Freefall) then
                return
            end
            local function getClosestBallPart()
                local closestBallPart = nil
                local closestDistance = math.huge

                for _, model in pairs(workspace:GetChildren()) do
                    if model:IsA("Model") and model:FindFirstChild("BallPart") then
                        local ballPart = model.BallPart
                        local dist = (humanoidRootPart.Position -
ballPart.Position).Magnitude
                        if dist < closestDistance then
                             closestDistance = dist
                             closestBallPart = ballPart
                        end
                    end
                end
                return closestBallPart
            end

            local function checkAndClick()
                local closestBallPart = getClosestBallPart()

                if closestBallPart then
                    local distance = (humanoidRootPart.Position -
closestBallPart.Position).Magnitude
                    if distance > 4.5 and distance <= autoReceiveDasbasdistance
then
                        if humanoid and (humanoid:GetState() ==
Enum.HumanoidStateType.Jumping or humanoid:GetState() ==
Enum.HumanoidStateType.Freefall) then
                            return
                        end
                        humanoidRootPart.CFrame =
CFrame.new(humanoidRootPart.Position, Vector3.new(closestBallPart.Position.X,
humanoidRootPart.Position.Y, closestBallPart.Position.Z))

                            if keyCode then
                                local args = {
                                    [1] = "Diving"
                                }


game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayerAc
tion"):FireServer(unpack(args))

                                  VirtualInputManager:SendKeyEvent(true, keyCode, false,
game)
                                  VirtualInputManager:SendKeyEvent(false, keyCode, false,
game)
                            end
                      end
                end
                 end

                 skibidi = RunService.Heartbeat:Connect(checkAndClick)

           else
                 if skibidi then
                     skibidi:Disconnect()
                     skibidi = nil
                 end
           end
     end
})

Auto:AddSlider('Distancesliderdive', {
    Text = 'Max Distance',
    Default = 5,
    Min = 1,
    Max = 15,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        autoReceiveDasbasdistance = Value
    end
})

local AutoSetAntBox = Tabs.Main:AddRightTabbox()
local AutoSetAnt = AutoSetAntBox:AddTab('Auto Set Ant')

AutoSetAnt:AddToggle('dive', {
    Text = 'Auto Set',
    Default = false,
    Callback = function(Value)
    local RunService = game:GetService("RunService")
        if Value then
            local player = game.Players.LocalPlayer
            local args = {"Setting"}

            RunService:BindToRenderStep("CheckNearestBall",
Enum.RenderPriority.Camera.Value, function()
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:FindFirstChild("Humanoid")
                local humanoidRootPart =
character:FindFirstChild("HumanoidRootPart")
                local camera = workspace.CurrentCamera

                if not humanoid or not humanoidRootPart then return end
                if humanoid:GetState() == Enum.HumanoidStateType.Freefall or
humanoid:GetState() == Enum.HumanoidStateType.Jumping or not humanoid.FloorMaterial
then return end

                       -- Encontrar bola
                       local nearestBall = nil
                       local nearestDistance = math.huge

                       for _, ballModel in ipairs(workspace:GetChildren()) do
                           if ballModel:IsA("Model") and ballModel.Name == "Ball" then
                               local ballPart = ballModel:FindFirstChild("BallPart")
                               if ballPart then
                                   local distance = (ballPart.Position -
humanoidRootPart.Position).Magnitude
                             if distance <= ballDistanceLimit and distance <
nearestDistance then
                                 nearestDistance = distance
                                 nearestBall = ballPart
                             end
                         end
                     end
                end

                if nearestBall then
                    local animation =
game:GetService("ReplicatedStorage").Assets.Animations.Set.Default.Front
                    if animation then
                        local animationTrack = humanoid:LoadAnimation(animation)
                        animationTrack:Play()
                    end

                    -- Encontrar spike de acordo com o modo
                    local bestSpike = nil
                    local bestScore = math.huge
                    local bestDot = -math.huge

                    for _, spike in ipairs(workspace:GetChildren()) do
                        if spike:IsA("BasePart") and spike.Name == "IllegalSpike"
then
                             if selectedMode == "Closest To Player" then
                                 local dist = (spike.Position -
humanoidRootPart.Position).Magnitude
                                 if dist < bestScore then
                                     bestScore = dist
                                     bestSpike = spike
                                 end
                             elseif selectedMode == "Closest To Camera" then
                                 local lookVector = camera.CFrame.LookVector
                                 local toSpike = (spike.Position -
camera.CFrame.Position).Unit
                                 local dot = lookVector:Dot(toSpike)
                                 if dot > bestDot then
                                     bestDot = dot
                                     bestSpike = spike
                                 end
                             end
                        end
                    end

                    if bestSpike then
                        humanoidRootPart.CFrame = CFrame.new(
                            humanoidRootPart.Position,
                            Vector3.new(bestSpike.Position.X,
humanoidRootPart.Position.Y, bestSpike.Position.Z)
                        )


game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayerAc
tion"):FireServer(unpack(args))
                     end
                 end
            end)
           else
                 RunService:UnbindFromRenderStep("CheckNearestBall")
           end
     end
})

AutoSetAnt:AddSlider('distancemax', {
    Text = 'Max Distance',
    Default = 5,
    Min = 1,
    Max = 15,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        ballDistanceLimit = Value
    end
})

AutoSetAnt:AddDropdown('AuraColorAutoDropdown', {
    Values = {'Closest To Player', 'Closest To Camera'},
    Default = '0',
    Multi = false,
    Text = 'Auto Set Mode',
    Callback = function(Value)
        selectedMode = option
    end
})

local BallTab = Tabs.Main:AddRightTabbox()
local Ball = BallTab:AddTab('Ball Tab')

     local hitboxenable = false

     Ball:AddToggle('hbedd', {
         Text = 'Hitbox Expander',
         Default = false,
         Callback = function(value)
             hitboxenable = value
         end
     })

     local RunService = game:GetService("RunService")
     local workspace = game:GetService("Workspace")
     RunService.Heartbeat:Connect(function()
         if not hitboxenable then return end

           local balls = workspace:GetChildren()

           for _, ball in pairs(balls) do
               if ball:IsA("Model") then
                   local parts = {"Part", "BallPart"}
                   for _, partName in ipairs(parts) do
                       local part = ball:FindFirstChild(partName)
                       if part then
                           part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                       end
                   end
               end
           end
end)

Ball:AddSlider('hbe', {
    Text = 'Size',
    Default = 2,
    Min = 1,
    Max = 3,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        hitboxSize = Value
    end
})



local pred = Ball:AddToggle('pred', {
    Text = 'Ball Prediction',
    Default = false,
    Callback = function(aa)
            local a = {}
        if aa then
            repeat wait() until workspace:FindFirstChild("Ball")

            local _=game:GetService("UserInputService")
            local __=game:GetService("RunService")
            local ___=function(v,p)
                local q=-workspace.Gravity
                local r=(-v.y-math.sqrt(v.y*v.y-4*0.5*q*p.y))/(2*0.5*q)
                local s=Vector3.new(v.x,0,v.z)
                return p+s*r+Vector3.new(0,-p.y,0)
            end

            __:BindToRenderStep("a",Enum.RenderPriority.Camera.Value,function()
                for _,b in ipairs(workspace:GetChildren()) do
                    if b:IsA("Model") and b.Name == "Ball" then
                        local c = b:FindFirstChild("BallPart")
                        if c then
                            local d = a[b]
                            if not d then
                                d = Instance.new("Part")
                                d.Name = "Marker"
                                d.Size = Vector3.new(3,3,3)
                                d.Shape = Enum.PartType.Ball
                                d.BrickColor = BrickColor.new("Red")
                                d.CanCollide = false
                                d.Anchored = true
                                d.Transparency = 0.5
                                d.Material = Enum.Material.Neon
                                d.Parent = workspace
                                a[b] = d
                            end
                            local e = b.Velocity
                            local f = ___(e.Value, c.Position)
                            d.CFrame = CFrame.new(f)
                        end
                    end
                end
                for g, h in pairs(a) do
                            if not g.Parent then
                                h:Destroy()
                                a[g] = nil
                            end
                          end
                     end)
                 else
                     for _, marker in pairs(a) do
                          marker:Destroy()
                     end
                     a = {}
                     game:GetService("RunService"):UnbindFromRenderStep("a")
                 end
           end
     })

local FovChangerTab = Tabs.Main:AddRightTabbox()
local FovChanger = FovChangerTab:AddTab('Fov Changer')

FovChanger:AddToggle('fovtoggle', {
    Text = 'Fov Changer',
    Default = false,
    Callback = function(Value)
    fovChangerEnabled = state

     local fovChangerEnabled = false
     local originalFov = 80
     local customFov = originalFov

           if fovChangerEnabled then
                originalFov = workspace.CurrentCamera.FieldOfView
                workspace.CurrentCamera.FieldOfView = customFov
           else
                workspace.CurrentCamera.FieldOfView = originalFov
           end
     end
})

FovChanger:AddSlider('distancemax', {
    Text = 'Fov',
    Default = 80,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end
})
-- UI Settings --
local MenuGroup = Tabs.UISettings:AddLeftGroupbox('Sushi UI')
MenuGroup:AddButton('Unload Script', function()
     Library:Unload()
end)
MenuGroup:AddLabel('Keybind')
:AddKeyPicker('MenuKeybind', {Default = 'RightShift', NoUI = true, Text = 'Menu
keybind'})
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
ThemeManager:SetFolder('SushiHub')
SaveManager:SetFolder('SushiHub/SushiHub-Settings')
SaveManager:BuildConfigSection(Tabs.UISettings)
ThemeManager:ApplyToTab(Tabs.UISettings)
SaveManager:LoadAutoloadConfig()

