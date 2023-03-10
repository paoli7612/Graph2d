local Vertex = require('sprites.vertex')
local Arch = require('sprites.arch')

function Graph()
    local graph = {}
    graph.vv = {}
    graph.aa = {}
    graph.maxLevel = 2

    function graph.resize()
        width, height, flags = love.window.getMode( )
        for i, v in ipairs(graph.vv) do
            v.resize(width, height)
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

    function graph.add_vertex(name)
        local v = Vertex(graph, name)
    end

    function graph.add_vertexs(...)
        for i, name in ipairs({...}) do
            graph.add_vertex(name)
        end
    end

    function graph.get_vertex(name)
        for i, v in ipairs(graph.vv) do
            if v.name == name then
                return v
            end
        end
    end

    function graph.get_vertex_pos(x, y) 
        for i, v in ipairs(graph.vv) do
            if v.isPos(x, y) then
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