local UIS = game:GetService("UserInputService")

return function(Frame, DragObject)
    local Dragging, DragInput, DragStart, StartPos

    local function Update(Input)
        local Delta = Input.Position - DragStart
        Frame.Position = UDim2.new(
            StartPos.X.Scale,
            StartPos.X.Offset + Delta.X,
            StartPos.Y.Scale,
            StartPos.Y.Offset + Delta.Y
        )
    end

    DragObject.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = Input.Position
            StartPos = Frame.Position

            Input.Changed:Connect(function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    DragObject.InputChanged:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then
            DragInput = Input
        end
    end)

    UIS.InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            Update(Input)
        end
    end)
end
