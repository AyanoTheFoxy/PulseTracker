core = {}

function core:init()
--core parts
    ui         = require 'Src/Components/SoundEditor/ui'
    ultilities = require 'Src/Components/SoundEditor/ultilities'
    init       = require 'Src/Components/SoundEditor/init'
    
--drivers
    soundDrv = require 'Src/Components/Drivers/sound_drv'
    gradeDrv = require 'Src/Components/Drivers/grade_drv'
    
--cmds
    ui:init()
    init:init()
    ultilities:init()
end

function core:render()
    ui:render()
end

function core:update()
    ultilities:update()
end

return core