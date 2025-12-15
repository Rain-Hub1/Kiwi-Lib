return function(c, p)
    local k = Instance.new(c)
    for x, v in pairs(p or {}) do
        k[x] = v
    end
    return k
end
