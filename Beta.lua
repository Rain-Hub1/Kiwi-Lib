local Lib = {}

function new(c, p)
  local k = Instance.new(c)
  for pp, v in pairs(p or {}) do
    k[pp] = v
  end
  return k
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
end

return Lib
