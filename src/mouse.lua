local utf8 = require("utf8")
local settings = require('src.settings')

function love.textinput(t)
    if mouse.selected then
        mouse.selected.name = mouse.selected.name .. t
    end
end

function Mouse(graph)
    local mouse = {}

    function mouse.draw()
        y = 0
        if mouse.selected then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.print("SELECTED: " .. mouse.selected.name, 10, 10, 0, 2, 2)
            love.graphics.circle('line', mouse.selected.x, mouse.selected.y, settings.VERTEX.RADIUS, 5)
            y = 70
        end
        if mouse.arch then
            love.graphics.setColor(0, 0, 1, 1)
            love.graphics.print("START ARCH: " .. mouse.arch.name, 10, y, 0, 2, 2)
            love.graphics.circle('line', mouse.arch.x, mouse.arch.y, settings.VERTEX.RADIUS, 8)
        end
    end

    function mouse.backspace()
        if mouse.selected then
            local byteoffset = utf8.offset(mouse.selected.name, -1)
            if byteoffset then
                mouse.selected.name = string.sub(mouse.selected.name, 1, byteoffset - 1)
            end
        end
    end

    function left(vertex) -- MOVE VERTEX
        if mouse.selected == nil then -- if a vertex is selected
            mouse.selected = vertex -- select the vertex
        else
            mouse.selected = nil -- deselect the vertex
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

    function mouse.move(x, y, dx, dy)
        if mouse.selected then
            mouse.selected.x = mouse.selected.x + dx
            mouse.selected.y = mouse.selected.y + dy
        end
    end

    return mouse
end

return Mouse
