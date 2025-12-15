local Win = {}
  function Win:Print(Info)
    local Info = Info or {}
    local Hi = Info.Name or "Oi"
    print(Hi)
  end
return Win
