function Mouse(graph)
    local mouse = {
        selected = {}
    }

    function mouse.draw()
        y = 0
        if not next(mouse.selected) == nil  then
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
        if love.keyboard.isDown('lctrl') then
            table.insert(mouse.selected, vertex)
        elseif next(mouse.selected) == nil then -- if a vertex is selected
            mouse.selected = {} -- deselect the vertex
        else
            table.insert(mouse.selected, vertex)
            -- mouse.selected = vertex -- select the vertex
        end
        for i, v in ipairs(mouse.selected) do
            print(i, v)
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
            mouse.selected = {}
            mouse.arch = nil
        end
    end

    function mouse.move(x, y, dx, dy)
        for i, v in ipairs(mouse.selected) do
            v.x = v.x + dx
            v.y = v.y + dy
        end
    end

    return mouse
end

return Mouse
