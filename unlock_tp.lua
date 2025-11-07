local Players = game:GetService("Players")
local pl = Players.LocalPlayer

local tb = pl.PlayerGui.Side.Frame.SideButtons.Teleport
local tg = pl.PlayerGui.Teleport

tg.Enabled = false

for _, conn in ipairs(getconnections(tb.MouseButton1Click)) do
    conn:Disconnect()
end

tb.MouseButton1Click:Connect(function()
    tg.Enabled = true
end)

local closeBtn = tg:FindFirstChild("Close")
if closeBtn then
    closeBtn.MouseButton1Click:Connect(function()
        tg.Enabled = false
    end)
end
