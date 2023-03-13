local settings = require('settings')
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
    print(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'f1' then
        graph.print()
    elseif key == 'f2' then
        graph.new_vertex()
    elseif key == "backspace" then
        mouse.backspace()
    elseif key == "left" then
        graph.move(-10, 0)
    elseif key == "right" then
        graph.move(10, 0)
    elseif key == "up" then
        graph.move(0, -10)
    elseif key == "down" then
        graph.move(0, 10)
    end
end

function love.mousepressed(x, y, button, istouch)
    mouse.pressed(x, y, button)
end

function love.mousemoved(x, y, dx, dy, istouch)
    mouse.move(x, y, dx, dy)
end
