class UF
    attr_reader :count

    def initialize()
        @count = 0
        @ids = []
        @sz = []
    end
    
    def init(n)
        (0...n).each do |i|
            @ids[i] = i
            @sz[i] = 1
        end
        @count = n
    end

    def connected(p, q)
        find(p) == find(q)
    end

    # weighted quick-union
    def find(p)
        while p != @ids[p]
            p = @ids[p]
        end
        return p
    end

    def union(p, q)
        # 将p, q 归并到相同分量中
        pid = find(p)
        qid = find(q)

        if pid == qid 
            return
        end

        # 小树 挂 大树
        if @sz[pid] < @sz[qid]
            @ids[pid] = qid
            @sz[qid] += @sz[pid]
        else
            @ids[qid] = pid
            @sz[pid] += @sz[qid]
        end

        @count -= 1
    end
end


def test
    pSet = [4,3,6,9,2,5,7,6]
    qSet = [3,8,5,4,1,0,2,1]

    n = 10
    uf = UF.new()
    uf.init(n)

    (0...pSet.length).each do |i|
        if !uf.connected(pSet[i], qSet[i])
            uf.union(pSet[i], qSet[i])
            puts "#{pSet[i]} --- #{qSet[i]}"
        end
    end

    puts "#{uf.count} components"
end

test
