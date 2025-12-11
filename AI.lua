local Lib = {}
Lib.__index = Lib

function new(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props) do
        if k ~= "Parent" then inst[k] = v end
    end
    if props.Parent then inst.Parent = props.Parent end
    return inst
end

function Lib:Window(Info)
    local screenGui = new("ScreenGui", {
        Name = "FlowithTinyUILib",
        ResetOnSpawn = false,
        Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
    })

    local mainFrame = new("Frame", {
        Name = "Window",
        Size = UDim2.new(0, 410, 0, 305),
        Position = UDim2.new(0.5, -205, 0.5, -152),
        BackgroundColor3 = Color3.fromRGB(26, 26, 38),
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = screenGui,
    })

    new("UICorner", {
        CornerRadius = UDim.new(0, 10),
        Parent = mainFrame,
    })

    local titleBar = new("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Color3.fromRGB(36, 36, 54),
        BorderSizePixel = 0,
        Parent = mainFrame,
    })

    new("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = titleBar,
    })

    local titleLabel = new("TextLabel", {
        Name = "Title",
        Text = Info.Title or "Window",
        Font = Enum.Font.GothamBold,
        TextColor3 = Color3.new(1,1,1),
        TextSize = 22,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = titleBar,
    })

    -- Drag logic
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end)

    local body = new("Frame", {
        Name = "Body",
        Size = UDim2.new(1, 0, 1, -36),
        Position = UDim2.new(0, 0, 0, 36),
        BackgroundTransparency = 1,
        Parent = mainFrame,
    })

    return {
        Body = body,
        Main = mainFrame,
        Gui = screenGui,
    }
end

Lib.new = new
return Lib
