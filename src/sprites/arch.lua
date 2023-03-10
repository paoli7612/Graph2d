

function Arch(graph, v1, v2)
    local arch = {}
    arch.A = graph.get_vertex(v1)
    arch.B = graph.get_vertex(v2)

    function arch.draw()
        love.graphics.line( arch.A.x, arch.A.y, arch.B.x, arch.B.y )
    end

    table.insert(graph.aa, arch)
    return arch
end

return Arch