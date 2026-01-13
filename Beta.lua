local Lib = {}

function new(c, p)
  local k = Instance.new(c)
  for pp, v in pairs(p or {}) do
    k[pp] = v
  end
  return k
end

local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer

function MDrag(Area, Parent)
  local isDragging = false
  local dragStart
  local startPos
  Area.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      isDragging = true
      dragStart = input.Position
      startPos = Parent.Position
      return Enum.UserInputState.Begin
    end
  end)
  Area.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
      isDragging = false
    end
  end)
  UserInputService.InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
      local delta = input.Position - dragStart
      Parent.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
  end)
end

local Def = {
  ["T"] = {
    ["Dark"] = {
      ["MainBackground"] = Color3.fromRGB(25, 25, 25),
      ["SubBackground"] = Color3.fromRGB(32, 32, 32),
      ["BorderColor"] = Color3.fromRGB(60, 60, 60),
      ["DividerColor"] = Color3.fromRGB(60, 60, 60),
      ["MainText"] = Color3.fromRGB(240, 240, 240),
      ["SubText"] = Color3.fromRGB(150, 150, 150)
    }
  },
  ["..."] = false
}

function Lib:Window(Info)
  local Info = Info or {}
  local s
  local Win
  local Tbar
end

return Lib
