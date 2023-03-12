function Arch(graph, A, B)
    local arch = {}

    function arch.print()
        print("ARCH", A.name, B.name)
    end

    function arch.draw()
        love.graphics.line(A.x, A.y, B.x, B.y)
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