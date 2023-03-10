local Sprite = require('sprites/sprite')

function Vertex(name)
    local vertex = Sprite()
    vertex.name = name

    local _draw = vertex.draw
    function vertex.draw()
        _draw()
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print(vertex.name, vertex.x, vertex.y)
    end


    return vertex
end

return Vertex