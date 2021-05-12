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

-- 归并排序

-- 原地归并
local function merge(vec, lo, mid, hi)
    local i = lo
    local j = mid + 1

    -- 复制一份数组
    local aux = {}
    for k = lo, hi do
        aux[k] = vec[k]
    end

    -- 通过 [lo..mid][mid..hi] 将数组分成左右两个 子数组
    -- 当 左子数组耗尽，取右子数组元素
    -- 当 右子数组耗尽, 取左子数组元素
    -- 右子数组当前元素小于左子数组当前元素，取右子数组元素
    -- 右子数组当前元素大于等于左子数组当前元素，取左子数组元素
    for k = lo, hi do
        if i > mid then
	    vec[k] = aux[j]
	    j = j + 1
	elseif j > hi then
	    vec[k] = aux[i] 
	    i = i + 1
	elseif aux[j] < aux[i] then
	    vec[k] = aux[j]
	    j = j + 1
	else
	    vec[k] = aux[i]
	    i = i + 1
	end
    end
end

local function sort(vec, lo, hi)
    if hi <= lo then
        return
    end
    local mid = lo + (hi - lo) // 2
    sort(vec, lo, mid)
    sort(vec, mid + 1, hi)
    merge(vec, lo, mid, hi)
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
    sort(vec, 1, #vec)
    -- assert(isSorted(vec), "sorted failed!")
    show(vec)
end

test()
