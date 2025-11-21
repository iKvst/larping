--================================================--
--                    GUI                           --
--==================================================--

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Crash gui @fearthedestiny"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Pet Spawner"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(20,20,20)
Title.TextSize = 20
Title.Active = true
Title.Parent = Frame


--==================================================--
--                  DRAGGING (FULLY FIXED)          --
--==================================================--

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
	if not (dragging and dragStart and startPos) then return end

	local delta = input.Position - dragStart
	Frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

Title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = Frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				dragInput = nil
			end
		end)
	end
end)

Title.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		update(input)
	end
end)


--==================================================--
--                PLAYER LIST GUI                   --
--==================================================--

local Scrolling = Instance.new("ScrollingFrame")
Scrolling.Size = UDim2.new(1, 0, 1, -40)
Scrolling.Position = UDim2.new(0, 0, 0, 40)
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
Scrolling.ScrollBarThickness = 6
Scrolling.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Scrolling.Active = true
Scrolling.Parent = Frame

local UIList = Instance.new("UIListLayout")
UIList.Parent = Scrolling
UIList.Padding = UDim.new(0, 5)


--==================================================--
--     YOUR EXACT SPAWN CODE (NOT MODIFIED)         --
--==================================================--

local function spawnPetsForPlayer(player)
	local success, playerData = pcall(function()
		return workspace.__REMOTES.Core["Get Other Stats"]:InvokeServer()[player.Name]
	end)

	if success and playerData and playerData.Save and playerData.Save.Pets then
		for _, pet in ipairs(playerData.Save.Pets) do

			local args = {
				{
					{
						"Spawn",
						player,
						pet.id
					},
					{
						"PetMovement",
						player,
						pet.id,
						player.Character and player.Character:FindFirstChild("UpperTorso"),
						false
					}
				}
			}

			workspace.__REMOTES.Game.Pets:FireServer(unpack(args))
		end
		print("Spawned ALL pets for " .. player.Name)
	end
end


--==================================================--
--      YOUR 99990 LOOP (NOT MODIFIED AT ALL)       --
--==================================================--

local function spam99990(player)
	for i = 1, 99990 do
		spawnPetsForPlayer(player)
	end
end


--==================================================--
--  PLAYER BUTTONS (SPAWN ONCE / SPAWN ×99990)      --
--==================================================--

local function refresh()
	-- clear only frames, not UIListLayout
	for _, v in ipairs(Scrolling:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then

			local Container = Instance.new("Frame")
			Container.Size = UDim2.new(1, -10, 0, 60)
			Container.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			Container.Parent = Scrolling

			local NameLabel = Instance.new("TextLabel")
			NameLabel.Size = UDim2.new(1, 0, 0, 20)
			NameLabel.BackgroundTransparency = 1
			NameLabel.Text = plr.Name
			NameLabel.TextColor3 = Color3.new(1,1,1)
			NameLabel.TextSize = 16
			NameLabel.Parent = Container

			local Btn1 = Instance.new("TextButton")
			Btn1.Size = UDim2.new(0.5, -5, 0, 30)
			Btn1.Position = UDim2.new(0, 0, 0, 25)
			Btn1.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
			Btn1.Text = "Spawn Once"
			Btn1.TextSize = 14
			Btn1.Parent = Container

			Btn1.MouseButton1Click:Connect(function()
				spawnPetsForPlayer(plr)
			end)

			local Btn2 = Instance.new("TextButton")
			Btn2.Size = UDim2.new(0.5, -5, 0, 30)
			Btn2.Position = UDim2.new(0.5, 5, 0, 25)
			Btn2.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
			Btn2.Text = "Spawn x99990"
			Btn2.TextSize = 14
			Btn2.Parent = Container

			Btn2.MouseButton1Click:Connect(function()
				spam99990(plr)
			end)
		end
	end

	Scrolling.CanvasSize = UDim2.new(0, 0, 0, #Players:GetPlayers() * 65)
end

refresh()

Players.PlayerAdded:Connect(refresh)
Players.PlayerRemoving:Connect(refresh)
