local Lib = {}
local UserInputService = game:GetService("UserInputService")
local Icon = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/Utils/Icons.lua"))()

function new(c, p)
  local k = Instance.new(c)
  for x, v in pairs(p or {}) do
    k[x] = v
  end
  return k
end

local function MDrag(Frame, DragObject)
    local Dragging, DragInput, DragStart, StartPos

    local function Update(Input)
        local Delta = Input.Position - DragStart
        Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end

    DragObject.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
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
        if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
            DragInput = Input
        end
    end)

    UserInputService.InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            Update(Input)
        end
    end)
end

local DefTheme = {
  ["UIStroke"] = Color3.fromHex("#1D3339"),
  ["Frame"] = Color3.fromHex("#11181A"),
  ["Button"] = Color3.fromHex("#00BFFF"),
  ["Title"] = Color3.fromHex("#00E5FF"),
  ["Name"] = Color3.fromHex("#B3D1D9"),
  ["Desc"] = Color3.fromHex("#5B7A84")
}
local CoreGui = game:GetService("CoreGui")

function Lib:Window(Info)
  local Info = Info or {}
  local WApp = {}
  if CoreGui:FindFirstChild("Kiwi Lib") then
    CoreGui:FindFirstChild("Kiwi Lib"):Destroy()
  end
  
  local s = new("ScreenGui", {
    Name = "Kiwi Lib",
    Parent = CoreGui,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  })
  
  local ViewportSize = workspace.CurrentCamera.ViewportSize
  
  local Win = new("Frame", {
    Size = UDim2.new(0, 410, 0, 305),
    Position = UDim2.new(0, (ViewportSize.X / 2) - (410 / 2), 0, (ViewportSize.Y / 2) - (305 / 2)),
    BackgroundColor3 = DefTheme["Frame"],
    ClipsDescendants = true,
    Parent = s
  })

  new("TextButton", {
    Size = UDim2.new(1, 0, 1, 0),
    Transparency = 1,
    Parent = Win
  })
  new("UICorner", {
    CornerRadius = UDim.new(0.01, 0),
    Parent = Win
  })
  new("UIStroke", {
    Color = DefTheme["UIStroke"],
    Parent = Win
  })

  local Tbar = new("Frame", {
    Size = UDim2.new(0, 410, 0, 35),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = DefTheme["Frame"],
    Parent = Win
  })
  new("UICorner", {
    CornerRadius = UDim.new(0.1, 0),
    Parent = Tbar
  })
  new("UIStroke", {
    Color = DefTheme["UIStroke"],
    Parent = Tbar
  })

  MDrag(Win, Tbar)

  local CloseBtn = new("ImageButton", {
    Size = UDim2.new(0, 29, 0, 29),
    Position = UDim2.new(0, 377, 0, 3),
    Image = "rbxassetid://10747384394",
    BackgroundColor3 = DefTheme["Button"],
    AutoButtonColor = false,
    Parent = Tbar
  })
  CloseBtn.MouseButton1Click:Connect(function()
    s:Destroy()
  end)
  new("UICorner", {
    CornerRadius = UDim.new(0.2, 0),
    Parent = CloseBtn
  })
  new("UIStroke", {
    Color = DefTheme["UIStroke"],
    Parent = CloseBtn
  })
  
  local TabBar
  local PageContainer = new("Frame", {
    Size = UDim2.new(0, 315, 0, 258),
    Position = UDim2.new(0, 88, 0, 40),
    BackgroundTransparency = 1,
    Parent = Win
  })

  local isMin = false
  local MinBtn = new("ImageButton", {
    Size = UDim2.new(0, 29, 0, 29),
    Position = UDim2.new(0, 343, 0, 3),
    Image = "rbxassetid://10734896206",
    BackgroundColor3 = DefTheme["Button"],
    AutoButtonColor = false,
    Parent = Tbar
  })
  MinBtn.MouseButton1Click:Connect(function()
    isMin = not isMin
    if isMin then
      Win.Size = UDim2.new(0, 410, 0, 35)
      TabBar.Visible = false
      PageContainer.Visible = false
      MinBtn.Image = "rbxassetid://10734924532"
    elseif not isMin then
      Win.Size = UDim2.new(0, 410, 0, 305)
      TabBar.Visible = true
      PageContainer.Visible = true
      MinBtn.Image = "rbxassetid://10734896206"
    end
  end)
  new("UICorner", {
    CornerRadius = UDim.new(0.2, 0),
    Parent = MinBtn
  })
  new("UIStroke", {
    Color = DefTheme["UIStroke"],
    Parent = MinBtn
  })
  
  local S1 = new("Frame", {
    Size = UDim2.new(0, 0.0001, 0, 35),
    Position = UDim2.new(0, 338, 0, 0),
    BorderSizePixel = 0,
    Parent = Tbar
  })

  new("UIStroke", {
    Color = DefTheme["UIStroke"],
    Parent = S1
  })

  local Title = new("TextLabel", {
    Size = UDim2.new(0, 332, 0, 20),
    Position = UDim2.new(0, 4, 0, 7),
    TextColor3 = DefTheme["Title"],
    TextSize = 10,
    TextWrap = true,
    TextWrapped = true,
    BackgroundTransparency = 1,
    TextXAlignment = Enum.TextXAlignment.Left,
    Text = Info.Title or "Title",
    Parent = Tbar
  })
  new("UIStroke", {Parent=Title})
  
  TabBar = new("ScrollingFrame", {
    Size = UDim2.new(0, 74, 0, 258),
    Position = UDim2.new(0, 6, 0, 40),
    BackgroundColor3 = DefTheme["Frame"],
    ScrollBarThickness = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollingDirection = Enum.ScrollingDirection.Y,
    Parent = Win
  })
  new("UICorner", {
    CornerRadius = UDim.new(0.09, 0),
    Parent = TabBar
  })
  new("UIStroke", {
    Color = DefTheme["UIStroke"],
    Parent = TabBar
  })
  new("UIListLayout", {
    Parent = TabBar,
    Padding = UDim.new(0, 5),
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    SortOrder = Enum.SortOrder.LayoutOrder
  })
  new("UIPadding", {
    Parent = TabBar,
    PaddingTop = UDim.new(0, 5)
  })

  local SelectedTab = nil

  function WApp:Tab(Info)
    local Info = Info or {}
    local TApp = {}
    local TabContainer = new("Frame", {
      Size = UDim2.new(0, 65, 0, 20),
      BackgroundColor3 = DefTheme["Frame"],
      BackgroundTransparency = 0.6,
      Parent = TabBar
    })
    new("UICorner", {CornerRadius = UDim.new(0.2, 0), Parent = TabContainer})
    new("UIStroke", {
      Color = DefTheme["UIStroke"],
      Parent = TabContainer
    })

    if Info.Icon then
        new("ImageLabel", {
            Size = UDim2.new(0, 30, 0, 30),
            Position = UDim2.new(0.5, -15, 0.5, -15),
            BackgroundTransparency = 1,
            Image = Info.Icon or Icon.mail,
            Parent = TabContainer
        })
    end
    
    new("TextLabel", {
        Size = UDim2.new(1,0,0,15),
        Position = UDim2.new(0,0,1,-17.5),
        BackgroundTransparency = 1,
        Text = Info.Title or "Tab",
        TextColor3 = DefTheme["Name"],
        TextSize = 10,
        TextScaled = false,
        Parent = TabContainer
    })
    
    local TabBtn = new("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = TabContainer
    })

    local Page = new("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 2,
        Visible = false,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = PageContainer
    })
    new("UIListLayout", {Parent = Page, Padding = UDim.new(0, 5)})
    new("UIPadding", {Parent = Page, PaddingLeft = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})
    new("UIStroke", {
      Color = DefTheme["UIStroke"],
      Parent = Page
    })
    local function Show()
        if SelectedTab then
            SelectedTab.Btn.BackgroundTransparency = 0.6
            SelectedTab.Page.Visible = false
        end
        SelectedTab = {Btn = TabContainer, Page = Page}
        TabContainer.BackgroundTransparency = 0
        Page.Visible = true
    end

    TabBtn.MouseButton1Click:Connect(Show)

    if SelectedTab == nil then
        Show()
    end
    
    function TApp:Label(Info)
      local Info = Info or {}
      local Con = new("Frame", {
        Size = UDim2.new(0, 305, 0, 25),
        BackgroundColor3 = DefTheme["Frame"],
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        Parent = Page
      })
      new("UICorner", {
        CornerRadius = UDim.new(0.09, 0),
        Parent = Con
      })
      new("UIStroke", {
        Color = DefTheme["UIStroke"],
        Parent = Con
      })
      new("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        Parent = Con
      })
      
      local Name = new("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 2),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = Info.Name or "Label",
        TextColor3 = DefTheme["Name"],
        BackgroundTransparency = 1,
        TextSize = 8,
        TextWrap = true,
        TextWrapped = true,
        TextScaled = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Con
      })
    end
    
    function TApp:Paragraph(Info)
      local Info = Info or {}
      local Con = new("Frame", {
        Size = UDim2.new(0, 305, 0, 25),
        BackgroundColor3 = DefTheme["Frame"],
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = true,
        Parent = Page
      })
      
      new("UIListLayout", {
        Parent = Con,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3)
      })

      new("UICorner", {
        CornerRadius = UDim.new(0.09, 0),
        Parent = Con
      })
      new("UIStroke", {
        Color = DefTheme["UIStroke"],
        Parent = Con
      })
      new("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        Parent = Con
      })
        
      local Name = new("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 2),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = Info.Name or "Paragraph",
        TextColor3 = DefTheme["Name"],
        BackgroundTransparency = 1,
        TextSize = 8,
        TextWrap = true,
        TextWrapped = true,
        TextScaled = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        Parent = Con
      })
      
      if Info.Desc then
        local Desc = new("TextLabel", {
          Size = UDim2.new(1, 0, 0, 0),
          AutomaticSize = Enum.AutomaticSize.Y,
          Text = Info.Desc or "Description",
          TextColor3 = DefTheme["Desc"],
          BackgroundTransparency = 1,
          TextSize = 6,
          TextWrap = true,
          TextWrapped = true,
          TextScaled = false,
          TextXAlignment = Enum.TextXAlignment.Left,
          LayoutOrder = 2,
          Parent = Con
        })
      end
    end

    function TApp:Button(Info)
      local Info = Info or {}
      local Con = new("TextButton", {
        Size = UDim2.new(0, 305, 0, 25),
        BackgroundColor3 = DefTheme["Frame"],
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = "",
        ClipsDescendants = true,
        AutoButtonColor = false,
        Parent = Page,
        LayoutOrder = 0
      })
      
      new("UIListLayout", {
        Parent = Con,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3)
      })

      new("UICorner", {
        CornerRadius = UDim.new(0.09, 0),
        Parent = Con
      })
      new("UIStroke", {
        Color = DefTheme["UIStroke"],
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = Con
      })
      new("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        Parent = Con
      })
      
      local Name = new("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = Info.Name or "Button",
        TextColor3 = DefTheme["Name"],
        BackgroundTransparency = 1,
        TextSize = 8,
        TextWrap = true,
        TextWrapped = true,
        TextScaled = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        Parent = Con
      })
      
      local Desc
      if Info.Desc then
        Desc = new("TextLabel", {
          Size = UDim2.new(1, 0, 0, 0),
          AutomaticSize = Enum.AutomaticSize.Y,
          Text = Info.Desc or "Description",
          TextColor3 = DefTheme["Desc"],
          BackgroundTransparency = 1,
          TextSize = 6,
          TextWrap = true,
          TextWrapped = true,
          TextScaled = false,
          TextXAlignment = Enum.TextXAlignment.Left,
          LayoutOrder = 2,
          Parent = Con
        })
      end
      if Info.Callback then
        Con.MouseButton1Click:Connect(Info.Callback)
      end
    end
    
    function TApp:Toggle(Info)
      local Info = Info or {}
      local isEnabled = Info.Default or false
      local toggleIconImage = Info.Icon or Icon.dot 

      local Con = new("TextButton", {
        Size = UDim2.new(0, 305, 0, 25),
        BackgroundColor3 = DefTheme["Frame"],
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = "",
        ClipsDescendants = true,
        AutoButtonColor = false,
        Parent = Page,
        LayoutOrder = 0
      })
      
      new("UIListLayout", {
        Parent = Con,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3)
      })

      new("UICorner", {
        CornerRadius = UDim.new(0.09, 0),
        Parent = Con
      })
      new("UIStroke", {
        Color = DefTheme["UIStroke"],
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = Con
      })
      new("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        Parent = Con
      })
      
      local Name = new("TextLabel", {
        Size = UDim2.new(1, -30, 0, 0),
        Position = UDim2.new(0, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = Info.Name or "Toggle",
        TextColor3 = DefTheme["Name"],
        BackgroundTransparency = 1,
        TextSize = 8,
        TextWrap = true,
        TextWrapped = true,
        TextScaled = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        Parent = Con
      })
      
      local Desc
      if Info.Desc then
        Desc = new("TextLabel", {
          Size = UDim2.new(1, -30, 0, 0),
          AutomaticSize = Enum.AutomaticSize.Y,
          Text = Info.Desc or "Description",
          TextColor3 = DefTheme["Desc"],
          BackgroundTransparency = 1,
          TextSize = 6,
          TextWrap = true,
          TextWrapped = true,
          TextScaled = false,
          TextXAlignment = Enum.TextXAlignment.Left,
          LayoutOrder = 2,
          Parent = Con
        })
      end
      
      local ToggleIcon = new("ImageLabel", {
          Size = UDim2.new(0, 20, 0, 20),
          Position = UDim2.new(1, -25, 0, 5),
          AnchorPoint = Vector2.new(1, 0),
          BackgroundTransparency = 1,
          Image = toggleIconImage,
          ImageColor3 = DefTheme.Button, 
          ZIndex = 2,
          Parent = Con
      })

      local function UpdateToggleVisual(state)
          if state then
              ToggleIcon.BackgroundTransparency = 1
              ToggleIcon.ImageTransparency = 0 
              ToggleIcon.ImageColor3 = DefTheme.Button
          else
              ToggleIcon.ImageTransparency = 1 
              ToggleIcon.BackgroundTransparency = 1
          end
      end
      
      UpdateToggleVisual(isEnabled)

      Con.MouseButton1Click:Connect(function()
          isEnabled = not isEnabled
          UpdateToggleVisual(isEnabled)
          if Info.Callback and typeof(Info.Callback) == "function" then
              Info.Callback(isEnabled)
          end
      end)
    end
    return TApp
  end
  
  return WApp
end

function Lib:Demo()
  local Win = Lib:Window({
    Title = "Demo title"
  })
  local Tab1 = Win:Tab({Title = "Tab 1"})
  local Tab2 = Win:Tab({Title = "Tab 2"})

  Tab1:Label({
    Name = "Hello"
  })
  Tab1:Label({
    Name = "World!"
  })
  Tab2:Label({
    Name = "Long textttttt tttttttttt ttttt ttttttt ttttttttt tttttt ttttttt tttt ttttt tttt tttt tt t ttt tt t ttt tttt ttt ttttt ttttt"
  })
  Tab2:Paragraph({
    Name = "Paragraph",
    Desc = "This is a longer description texttttt tttttttttt ttttt ttttttt ttttttttt tttttt ttttttt tttt ttttt tttt tttt tt t ttt tt t ttt tttt ttt ttttt ttttt"
  })
  
  Tab2:Button({
    Name = "Main action",
    Desc = "Clique aqui para executar a função.",
    Callback = function()
      print("Botão Executar Clicado!")
    end
  })
  
  Tab2:Button({
    Name = "Button",
    Desc = "Este botão também funciona.",
    Callback = function()
      print("Botão Secundário Clicado!")
    end
  })
  
  
  Tab1:Toggle({
    Name = "Feature Toggle (Invisível/Ligado)",
    Desc = "Ícone é invisível desligado, aparece colorido ligado.",
    Default = false,
    Icon = Icon.circle, 
    Callback = function(state)
        print("Toggle 1 alterado para: " .. tostring(state))
    end
  })

  
  Tab1:Toggle({
    Name = "Start Enabled",
    Desc = "Começa LIGADO, fica invisível quando desligado.",
    Default = true,
    Icon = Icon.dot,
    Callback = function(state)
        print("Toggle 2 alterado para: " .. tostring(state))
    end
  })
end

Lib:Demo()
return Lib
