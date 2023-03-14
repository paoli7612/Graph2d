local settings = {
    TITLE = 'GraphLove2d',
    WIDTH = 700,
    HEIGHT = 500,
    MARGIN = 100,
    FLAGS = {
        resizable = true,
        vsync = 0,
        minwidth = 400,
        minheight = 300
    },
    BGCOLOR = {1, 1, 1, 1},
    FONT_SIZE = 20,
    VERTEX = {
        RADIUS = 40
    },
    ARCH = {
        DIMENSION = 20
    }

}

function settings.init()
    love.window.setMode(settings.WIDTH, settings.HEIGHT, settings.FLAGS)
    love.window.setTitle(settings.TITLE)
    love.graphics.setBackgroundColor(settings.BGCOLOR)
    font = love.graphics.newFont(settings.FONT_SIZE)
    love.graphics.setFont(font)
    love.keyboard.setKeyRepeat(true)

end

return settings