local Win = {}

function Win:Print(info)
  info = info or {}
  print(info.Text or "Ola!")
end

return Win
