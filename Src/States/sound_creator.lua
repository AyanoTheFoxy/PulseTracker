soundCreator = {}

function soundCreator:enter()
    core = require 'Src/Components/SoundCreator/core'
    
    core:init()
end

function soundCreator:draw()
    core:render()
end

function soundCreator:update(deltaTime)
    core:update()
end

return soundCreator