local function exch(vec, i, j)
    local t = vec[i]
    vec[i] = vec[j]
    vec[j] = t
end

local function show(vec)
    for i = 1, #vec, 1 do
        io.write(vec[i] .. " ")
    end
    print()
end

-- 希尔排序
local function sort(vec)
    local N = #vec
    local h = N // 2
    while h >= 1 do
    for i = h+1, N, 1 do
    -- show(vec)
        for j = i, h+1, -h do
            if vec[j] < vec[j-h] then
                exch(vec, j, j-h)
            else
                break
            end
        end
    end
    h = h // 2
    end
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
--    show(vec)
    sort(vec)
    -- assert(isSorted(vec), "sorted failed!")
--    show(vec)
end

test()
