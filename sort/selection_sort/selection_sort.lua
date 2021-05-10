local function exch(vec, i, j)
    local t = vec[i]
    vec[i] = vec[j]
    vec[j] = t
end

-- 选择排序
local function sort(vec)
    local N = #vec
    for i = 1, N do
        local min = i
        for j = i+1, N do
            if vec[j] < vec[min] then
                min = j
            end
        end
        -- 交换 exchange
        exch(vec, i, min)
    end
end

local function show(vec)
    for i = 1, #vec, 1 do
        io.write(vec[i] .. " ")
    end
    print()
end

local function isSorted(vec)
    for i = 2, #vec do
        if vec[i] < vec[i-1] then
            return false
        end
    end
    return true
end

local function test()
    local vec = {3,5,7,1,4,9,2,6}
    show(vec)
    sort(vec)
    assert(isSorted(vec), "sorted failed!")
    show(vec)
end

test()