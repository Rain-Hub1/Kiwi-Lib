local Lib = {}

function new(c, p)
 local k = Instance.new(c)
  for pp, v in pairs(p or {}) do
   k[pp] = v
  end
 return k
end

function Lib:Window(Info)
 local Info = Info or {}
 local CoreGui = game:GetService("CoreGui")
 local s = new("ScreenGui", {
  Parent = CoreGui
 })
 
 local Win
 
 local Tbar
 
 local Title
end

function Lib:Demo()
 Lib:Window()
end
Lib:Demo()

return Lib
-- Preto "#0f0f0f"
-- Azul "#265dff"
