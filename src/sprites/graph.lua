local Vertex = require('sprites.vertex')
local Arch = require('sprites.arch')

function Graph()
    local graph = {}
    graph.vv = {}
    graph.aa = {}
    graph.maxLevel = 2

    function graph.resize()
        width, height, flags = love.window.getMode( )
        for i, vertex in ipairs(graph.vv) do
            vertex.resize(width, height) 
        end
    end

    function graph.draw()
        for i, vertex in ipairs(graph.vv) do
           vertex.draw() 
        end
        for i, arch in ipairs(graph.aa) do
            arch.draw() 
        end
    end

    function graph.add_vertex(name, level, x, y)
        if level > graph.maxLevel then
            graph.maxLevel = level + 1
        end
        local v = Vertex(graph, name, level, x, y)
    end

    function graph.add_vertexs(names, level)
        local n = table.getn(names) + 1
        step = love.graphics.getWidth( ) / n
        for i, name in ipairs(names) do
            x = i * step
            graph.add_vertex(name, level, x)
        end
    end

    function graph.get_vertex(name)
        for i, v in ipairs(graph.vv) do
            if v.name == name then
                return v
            end
        end
    end

    function graph.add_arch(v1, v2)
        local a = Arch(graph, v1, v2)
    end


    return graph
end

return Graph