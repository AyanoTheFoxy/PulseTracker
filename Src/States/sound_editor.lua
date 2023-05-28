soundEditor = {}
soundEditor.id = nil

function soundEditor:enter()
--sources
    core = require 'Src/Components/SoundEditor/core'
    
--cmds
    core:init()
end

function soundEditor:draw()
    core:render()
end

function soundEditor:update(deltaTime)
    core:update()
end

return soundEditor