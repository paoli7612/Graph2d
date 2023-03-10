local Graph = require('sprites/graph')


function love.load()
    graph = Graph()
    graph.add_vertex('A')
    graph.add_vertex('B')
end

function love.update(dt)

end

function love.draw()
    graph.draw()
end
