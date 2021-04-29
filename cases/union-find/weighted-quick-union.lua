UF = {}
UF.__index = UF

function UF:new()
    local t ={}
    setmetatable(t, UF)
    t.cnt = 0 -- 连通分量的数量
    t.ids = {} -- 父链接数组(由触点索引)
    t.sz = {} -- (由触点索引的) 各个根节点所对应的分量的大小
    return t
end

function UF:init(n)
    self.cnt = n
    for i = 1, n do
        self.ids[i] = i
        self.sz[i] = 1
    end
end

function UF:count()
    return self.cnt
end

function UF:connected(p, q)
    return self:find(p) == self:find(q)
end

--[[ impl-3
    weighted quick-union
]]
function UF:find(p)
    -- 找出分量的名称 跟随连接找到根节点
    -- p != id[p]
    while p ~= self.ids[p]  do
        p = self.ids[p]
    end
    return p
end

function UF:union(p, q)
    -- 将 p 和 q 的根节点统一
    local i = self:find(p)
    local j = self:find(q)

    -- 将小树的根节点连接到大树的根节点
    if self.sz[i] < self.sz[j] then
        self.ids[i] = j
        self.sz[j] = self.sz[j] + self.sz[i]
    else
        self.ids[j] = i
        self.sz[i] = self.sz[i] + self.sz[j]
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
