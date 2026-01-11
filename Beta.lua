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
end

return Lib
