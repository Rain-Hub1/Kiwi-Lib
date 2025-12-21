local Lib = {}

function new(c, p)
 local k = Instance.new(c)
 for pp, v in pairs(p or {}) do
  k[pp] = v
 end
 return k
end

local Themes = {
 Dark = {
  ["UIStroke"] = Color3.fromHex("#605c5b"),
  ["Frame1"] = Color3.fromHex("#0f0f0f"),
  ["Frame2"] = Color3.fromHex("#393737"),
  ["Container"] = Color3.fromHex("#3b3b3b"),
  ["Text"] = Color3.fromHex("#ffffff"),
  ["Button"] = Color3.fromHex("#2f2f2f")
 }
}

local LInfo = {
 Name = "Kiwi Lib",
 Version = 1.0,
 Author = "Zaquel"
}

local Camera = workspace.CurrentCamera
local ViewptS = Camera.ViewportSize

function Lib:Window(Info)
 Info = Info or {}

 local CoreGui = game:GetService("CoreGui")

 if CoreGui:FindFirstChild(LInfo.Name) then
  CoreGui:FindFirstChild(LInfo.Name):Destroy()
 end

 local s = new("ScreenGui", {
  Name = LInfo.Name,
  Parent = CoreGui
 })

 local Win = new("Frame", {
  Size = UDim2.new(0, 440, 0, 337),
  Position = UDim2.new(0, (ViewptS.X / 2) - (440 / 2), 0, (ViewptS.Y / 2) - (350 / 2)),
  BackgroundColor3 = Themes.Dark["Frame1"],
  BackgroundTransparency = 0.1,
  ClipsDescendants = true,
  Parent = s
 })
 new("UICorner", {
  CornerRadius = UDim.new(0, 3),
  Parent = Win
 })
 new("UIStroke", {
  Color = Themes.Dark["UIStroke"],
  Parent = Win
 })

 local Tbar = new("Frame", {
  Size = UDim2.new(1, 0, 0, 40),
  BackgroundColor3 = Themes.Dark["Frame2"],
  ClipsDescendants = true,
  Parent = Win
 })
 new("UICorner", {
  CornerRadius = UDim.new(0, 3),
  Parent = Tbar
 })
 new("UIStroke", {
  Color = Themes.Dark["UIStroke"],
  Parent = Tbar
 })

 local Title = new("TextLabel", {
  Size = UDim2.new(1, -20, 1, 0),
  Position = UDim2.new(0, 5, 0, 0),
  BackgroundTransparency = 1,
  Text = Info.Title or "Library: " .. LInfo.Name,
  TextColor3 = Themes.Dark["Text"],
  TextXAlignment = Enum.TextXAlignment.Left,
  Font = Enum.Font.SourceSansBold,
  TextSize = 16,
  Parent = Tbar
 })
 
 local WApp = {}
 
 local Tbbar = new("ScrollingFrame", {
  Size = UDim2.new(0, 125, 0, 277),
  Position = UDim2.new(0, 5, 0, 50),
  ScrollBarThickness = 0.1,
  BackgroundColor3 = Themes.Dark["Frame2"],
  AutomaticCanvasSize = Enum.AutomaticSize.Y,
  ScrollingDirection = Enum.ScrollingDirection.Y,
  Parent = Win
 })
 new("UICorner", {
  CornerRadius = UDim.new(0, 3),
  Parent = Tbbar
 })
 new("UIStroke", {
  Color = Themes.Dark["UIStroke"],
  Parent = Tbbar
 })
 new("UIListLayout", {
  Padding = UDim.new(0, 5),
  HorizontalAlignment = Enum.HorizontalAlignment.Center,
  Parent = Tbbar
 })
 
 local PageContainer = new("Frame", {
  Size = UDim2.new(0, 295, 0, 277),
  Position = UDim2.new(0, 140, 0, 50),
  BackgroundColor3 = Themes.Dark["Container"],
  ClipsDescendants = true,
  Parent = Win
 })
 new("UICorner", {
  CornerRadius = UDim.new(0, 3),
  Parent = PageContainer
 })
 new("UIStroke", {
  Color = Themes.Dark["UIStroke"],
  Parent = PageContainer
 })
 
 local Pages = {}
 local CurrentPage = nil
 
 function WApp:Tab(tabInfo)
  tabInfo = tabInfo or {}
  local tabName = tabInfo.Name or "Tab"
  
  local Con = new("Frame", {
   Size = UDim2.new(0, 115, 0, 30),
   Position = UDim2.new(0, 0, 0, 0),
   BackgroundColor3 = Themes.Dark["Container"],
   ClipsDescendants = true,
   Parent = Tbbar
  })
  new("UICorner", {
   CornerRadius = UDim.new(0, 3),
   Parent = Con
  })
  new("UIStroke", {
   Color = Themes.Dark["UIStroke"],
   Parent = Con
  })

  local Name = new("TextLabel", {
   Size = UDim2.new(1, -6, 1, 0),
   Position = UDim2.new(0, 6, 0, 0),
   TextXAlignment = Enum.TextXAlignment.Left,
   Text = tabName,
   TextColor3 = Themes.Dark["Text"],
   BackgroundTransparency = 1,
   Parent = Con
  })

  local Page = new("Frame", {
   Size = UDim2.new(1, -5, 1, 0),
   BackgroundColor3 = Color3.fromRGB(27, 23, 28),
   BackgroundTransparency = 1,
   Visible = true,
   Parent = PageContainer
  })
  
  Pages[Page] = {Tab = Con, Name = tabName}
  
  if not CurrentPage then
   CurrentPage = Page
   Page.Visible = true
   Con.BackgroundColor3 = Color3.fromRGB(27, 23, 28)
  end

  local Router = new("TextButton", {
   Size = UDim2.new(1, 1, 1, 1),
   BackgroundTransparency = 1,
   Text = "",
   Parent = Con
  })

  Router.MouseButton1Click:Connect(function()
   if CurrentPage ~= Page then
    CurrentPage.Visible = false
    Pages[CurrentPage].Tab.BackgroundColor3 = Themes.Dark["Button"]
    
    Page.Visible = true
    Con.BackgroundColor3 = Themes.Dark["Frame2"]
    
    CurrentPage = Page
   end
  end)
  
  local TApp = {}
  
  return TApp
 end
 
 return WApp
end

function Lib:Demo()
 local Win = Lib:Window({
  Title = "Demo title"
 })
 
 local Tab1 = Win:Tab({
   Name = "Tab 1"
  })
 local Tab2 = Win:Tab({
   Name = "Tab 2"
  })
 local Tab3 = Win:Tab({
   Name = "Tab 3"
  })
end

Lib:Demo()
return Lib
