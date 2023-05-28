core = {}

function core:init()
    ui         = require 'Src/Components/SoundCreator/ui'
    ultilities = require 'Src/Components/SoundCreator/ultilities'
    init       = require 'Src/Components/SoundCreator/init'

    init:init()
    ui:init()
end

function core:render()
    ui:render()
end

function core:update()
    ultilities:update()
end

return core