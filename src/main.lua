local settings = require('settings')
local Graph = require('sprites.graph')

function love.load()
    settings.init()
    graph = require('src.input.test1')
    graph.resize()
end

time_resize = 0
function love.update(dt)
    time_resize = time_resize + dt
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
    if time_resize > 1 then
        graph.resize()
        time_resize = 0
    end
end