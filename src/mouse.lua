function Mouse(graph)
    local mouse = {}

    function mouse.click(x, y)
        if mouse.vertex then
            mouse.vertex = nil
        else
            local vertex = graph.get_vertex_pos(x, y)
            if vertex then
                mouse.vertex = vertex
            end
        end
    end

    function mouse.left(x, y)
        if mouse.left1 then
            mouse.left2 = graph.get_vertex_pos(x, y)
            if mouse.left2 then
                graph.add_arch(mouse.left1, mouse.left2)
                mouse.left1 = nil
                mouse.left2 = nil
                return
            else

            end
        
        end
    end

    function mouse.move(x, y)
        mouse.vertex.x = x
        mouse.vertex.y = y
    end


    return mouse
end

return Mouse