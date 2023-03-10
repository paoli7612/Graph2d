local settings = require('settings')

function Sprite(x, y)
    local sprite = {}
    sprite.x = x or love.math.random(0, settings.WIDTH)
    sprite.y = y or love.math.random(0, settings.HEIGHT)
    sprite.r = 20

    function sprite.update(dt)

    end

    function sprite.draw()
        love.graphics.setColor(1, 1, 1)
        love.graphics.circle('line', sprite.x, sprite.y, sprite.r)
    end

    return sprite
end

return Sprite