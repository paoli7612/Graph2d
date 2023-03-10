local Sprite = require('sprites/sprite')
local Vertex = require('sprites/vertex')

function Graph()
    local graph = Sprite()
    graph.vv = {}
    graph.aa = {}

    function graph.draw()
        for i, arch in ipairs(graph.vv) do
           arch.draw() 
        end
    end

    function graph.add_vertex(name)
        local v = Vertex(name)
        table.insert(graph.vv, v)
    end

    return graph
end

return Graph