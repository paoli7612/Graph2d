function Sprite(x, y)
    local sprite = {}
    sprite.x = x or love.math.random(100)*10
    sprite.y = y or 100
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