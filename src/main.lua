local settings = require('settings')
local Graph = require('sprites/graph')

function love.load()

    love.window.setMode(settings.WIDTH, settings.HEIGHT, settings.FLAGS)
    love.window.setTitle(settings.TITLE)
    love.graphics.setBackgroundColor(settings.BGCOLOR)

    graph = Graph()
    graph.add_vertex('A')
    graph.add_vertex('B')
end

function love.update(dt)
    
end

function love.draw()
    graph.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
