class UF
    attr_reader :count

    def initialize()
        @count = 0
        @ids = []
    end
    
    def init(n)
        (0...n).each do |i|
            @ids[i] = i
        end
        @count = n
    end

    def connected(p, q)
        find(p) == find(q)
    end

    # quick-find
    def find(p)
        @ids[p]
    end

    def union(p, q)
        # 将p, q 归并到相同分量中
        pid = find(p)
        qid = find(q)

        # 如果 分量相同，则已经连通
        if pid == qid 
            return
        end

        # 将p的分量，重命名为 q的分量
        @ids.each do |id|
            if pid == id
                qid = id
            end
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
