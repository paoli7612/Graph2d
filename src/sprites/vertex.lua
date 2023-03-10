local settings = require('settings')

function Vertex(graph, name, level, x, y)
    local vertex = {}
    vertex.level = level
    vertex.name = name

    function vertex.resize(width, height)
        vertex.x = love.math.random(settings.MARGIN, width - settings.MARGIN)
        vertex.y = love.math.random(height/settings.LEVEL * level, height/settings.LEVEL * level + settings.MARGIN)
        vertex.r = settings.VERTEX.radius or 50
    end

    function vertex.draw()
        love.graphics.setColor(1/2, 1/2, 1/2)
        love.graphics.circle('line', vertex.x, vertex.y, vertex.r)
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print(vertex.name, vertex.x, vertex.y)
    end

    vertex.resize(settings.WIDTH, settings.HEIGHT)
    table.insert(graph.vv, vertex)
    return vertex
end

return Vertex
