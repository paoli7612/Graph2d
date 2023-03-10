local settings = require('settings')
local Graph = require('sprites/graph')

function love.load()

    love.window.setMode(settings.WIDTH, settings.HEIGHT, settings.FLAGS)
    love.window.setTitle(settings.TITLE)
    love.graphics.setBackgroundColor(settings.BGCOLOR)
    font = love.graphics.newFont(settings.FONT_SIZE)
    love.graphics.setFont(font)

    graph = Graph()
    graph.add_vertex('A', 1)
    graph.add_vertex('B', 2)
    graph.add_vertex('C', 2)
    graph.add_vertex('D', 3)
    graph.add_vertex('E', 3)
    graph.add_vertex('F', 4)
    graph.add_vertex('G', 5)

    graph.add_arch('A', 'B')
    graph.add_arch('A', 'C')
    graph.add_arch('A', 'D')
    graph.add_arch('D', 'E')
    graph.add_arch('A', 'G')
    graph.add_arch('G', 'F')
end

time = 0
function love.update(dt)
    time = time + dt
end

function love.draw()
    graph.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.resize(w, h)
    if time > 1 then
        graph.resize()
        time = 0
    end
end