UF = {cnt=0, ids = {}}
UF.__index = UF

function UF:new()
    local t ={}
    setmetatable(t, UF)
    t.cnt = 0
    t.ids = {}
    return t
end

function UF:init(n)
    self.cnt = n
    for i = 1, n do
        self.ids[i] = i
    end
end

function UF:count()
    return self.cnt
end

function UF:connected(p, q)
    return self:find(p) == self:find(q)
end

--[[ impl-1
    quick-find
]]
function UF:find(p)
    return self.ids[p]
end

function UF:union(p, q)
    -- 将 p, q 归并到相同的分量中
    local pID = self:find(p)
    local qID = self:find(q)

    -- 如果 p 和 q 已经在相同的分量之中，就不需要做啥
    if pID == qID then
        return
    end

    -- 将p的分量，重命名为 q的名称
    for i = 1, #self.ids do
        if pID == self.ids[i] then
            qID = self.ids[i]
        end
    end
    self.cnt = self.cnt - 1
end

local function test()
    local N = 10  -- 读取触点数量
    local uf = UF:new()
    uf:init(N)

    local pSet = {5,4,7,10,3,6,8,7}
    local qSet = {4,9,6,5,2,1,3,2}

    for i = 1, #pSet, 1 do
        if uf:connected(pSet[i], qSet[i]) then
            -- 如果已经联通 则忽略
            goto continue
        end
        uf:union(pSet[i], qSet[i]) -- 归并分量
        print(pSet[i] .. " --- " .. qSet[i])
        ::continue::
    end
    print(uf:count() .. " components")
end

test()
