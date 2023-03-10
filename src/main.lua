local settings = require('settings')
local Graph = require('sprites.graph')
local Mouse = require('mouse')

function love.load()
    settings.init()
    graph = require('src.input.test1')
    mouse = Mouse(graph)
    graph.resize()
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

function love.resize(w, h)
    graph.resize()
end


-- MOUSE --
function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        mouse.click(x, y)
    elseif button == 2 then
        mouse.left(x, y)
    end
end

function love.mousemoved( x, y, dx, dy, istouch )
    if mouse.vertex then
        mouse.move(x, y)
    end
end