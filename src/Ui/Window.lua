local Win = {}
  function Win:Print(Info)
    local Info = Info or {}
    print(Info.Text or "Ola!")
  end
return Win
