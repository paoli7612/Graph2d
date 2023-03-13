local settings = require('settings')

function Vertex(graph, name)
    local vertex = {}
    vertex.name = name or ""
    vertex.aa = {}

    function vertex.print()
        print("VERTEX", vertex.name)
    end

    function vertex.resize(width, height)
        vertex.x = love.math.random(settings.MARGIN, width - settings.MARGIN)
        vertex.y = love.math.random(settings.MARGIN, height - settings.MARGIN)
        vertex.r = settings.VERTEX.RADIUS
    end

    function vertex.draw()
        love.graphics.setColor(1/2, 1/2, 1/2)
        love.graphics.circle('line', vertex.x, vertex.y, vertex.r)
        love.graphics.setColor(0, 0, 0, 1)
        len = string.len(vertex.name)
        love.graphics.print(vertex.name, vertex.x - len*5, vertex.y)
    end

    function getDistance(x1, y1, x2, y2)
        local dx = x1-x2
        local dy = y1-y2
        return math.sqrt((dx * dx + dy * dy))
    end

    function vertex.isPos(x, y) 
        if getDistance(x,y, vertex.x, vertex.y) < vertex.r then
            return true
        end
    end

    function vertex.move(dx, dy)
        vertex.x = vertex.x + dx
        vertex.y = vertex.y + dy        
    end

    vertex.resize(settings.WIDTH, settings.HEIGHT)
    table.insert(graph.vv, vertex)
    return vertex
end

return Vertex
