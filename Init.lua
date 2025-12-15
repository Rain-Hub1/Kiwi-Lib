local bas = "https://raw.githubusercontent.com/Rain-Hub1/Kiwi-Lib/main/"

local function Import(path)
    return loadstring(game:HttpGet(bas .. path))()
end

local Lib = {}

Lib.Util = {
    New   = Import("src/Util/New.lua"),
    Drag  = Import("src/Util/Drag.lua"),
    Theme = Import("src/Util/Theme.lua"),
    Icons = Import("src/Util/Icons.lua")
}

Lib.Elements = {
    Label = Import("src/Ui/Elements/Label.lua"),
    Paragraph = Import("src/Ui/Elements/Paragraph.lua"),
    Button    = Import("src/Ui/Elements/Button.lua"),
    Toggle    = Import("src/Ui/Elements/Toggle.lua")
}

Lib.Components = {
    Window = Import("src/Ui/Components/Window.lua"),
    Tab    = Import("src/Ui/Components/Tab.lua")
}

function Lib:Window(info)
    return Lib.Components.Window.new(info, Lib)
end

return Lib
