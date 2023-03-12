local settings = require('settings')
local Graph = require('sprites.graph')
local Mouse = require('mouse')

function love.load()
    settings.init()
    graph = require('src.input.test1')
    mouse = Mouse(graph)
end

function love.draw()
    graph.draw()
    mouse.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'q' then
        graph.print()
    end
end

-- MOUSE --
function love.mousepressed(x, y, button, istouch)
    mouse.pressed(x, y, button)
end

function love.mousemoved(x, y, dx, dy, istouch)
    mouse.move(x, y)
end