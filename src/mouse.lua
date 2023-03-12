function Mouse(graph)
    local mouse = {}

    function mouse.draw()
        y = 0
        if mouse.selected then
            love.graphics.setColor( 1, 0, 0, 1 )
            love.graphics.print("SELECTED: " .. mouse.selected.name, 10, 10, 0, 2, 2)
            love.graphics.circle('line', mouse.selected.x, mouse.selected.y, 40, 5)
            y = 70
        end
        if mouse.arch then
            love.graphics.setColor( 0, 0, 1, 1 )
            love.graphics.print("START ARCH: " .. mouse.arch.name, 10, y, 0, 2, 2)
            love.graphics.circle('line', mouse.arch.x, mouse.arch.y, 40, 8)
        end
    end

    function left(vertex) -- MOVE VERTEX
        if mouse.selected then -- if a vertex is selected
            mouse.selected = nil -- deselect the vertex
        else
            mouse.selected = vertex -- select the vertex
        end
    end

    function middle(index) -- REMOVE ARCH
        table.remove(graph.vv, index)
        graph.alive()
    end

    function right(vertex) -- NEW ARCH
        if mouse.arch then
            graph.add_arch(vertex, mouse.arch)
            mouse.arch = nil
        else
            mouse.arch = vertex
        end
    end

    function mouse.pressed(x, y, button)
        local index, vertex = graph.get_vertex_pos(x, y)
        if vertex then
            if button == 1 then -- LEFT
                left(vertex)
            elseif button == 2 then -- RIGHT
                right(vertex)
            elseif button == 3 then -- MIDDLE
                middle(index)
            end
        else
            mouse.selected = nil
            mouse.arch = nil
        end
    end

    function mouse.move(x, y)
        if mouse.selected then
            mouse.selected.x = x
            mouse.selected.y = y
        end
    end

    return mouse
end

return Mouse
