settings = require('src.settings')

function Arch(graph, A, B)
    local arch = {}

    function arch.print()
        print("ARCH", A.name, B.name)
    end

    function distance(ax, ay, bx, by, ar, br)
        return math.sqrt((bx - ax)^2 + (by - ay)^2)
    end

    function arch.draw()
        angle = math.atan2(B.y-A.y, B.x-A.x)
        print(angle)
        
        a = {x=A.x + math.cos(angle) * settings.VERTEX.RADIUS, y=A.y + math.sin(angle) * settings.VERTEX.RADIUS}
        b = {x=a.x + math.cos(angle+0.5) * settings.ARCH.DIMENSION, y=a.y + math.sin(angle+0.5) * settings.ARCH.DIMENSION}
        c = {x=a.x - math.cos(-angle-math.pi+0.5) * settings.ARCH.DIMENSION, y=a.y + math.sin(-angle-math.pi+0.5) * settings.ARCH.DIMENSION}
        
        love.graphics.polygon('fill', a.x, a.y, b.x, b.y, c.x, c.y )
        love.graphics.line(A.x + math.cos(angle) * settings.VERTEX.RADIUS, A.y + math.sin(angle) * settings.VERTEX.RADIUS, B.x - math.cos(angle) * settings.VERTEX.RADIUS, B.y - math.sin(angle) * settings.VERTEX.RADIUS)
    end

    function arch.is_alive()
        if graph.get_vertex_name(A.name) and graph.get_vertex_name(B.name) then
            return true
        else
            return false
        end
    end

    table.insert(graph.aa, arch)
    return arch
end

return Arch