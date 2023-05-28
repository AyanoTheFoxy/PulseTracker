init = {}

function init:init()
--main tables
    slider = {}
        slider.volume    = { value = .5; min = .01; max = 1}
        slider.amplitude = { value = 1; min = .01; max = 1}
        
    song   = json.decode(love.filesystem.read('Songs/' .. soundEditor.id .. '/song.json')) --loadsong
    
    trash  = {}
    
--main vars
    cx                = love.graphics.getWidth() / 2 - 326
    editorOffSet      = 0
    timer             = -.25
    tx, ty            = -1, -1
    wave              = 'square'
    mode              = 'create'
    openGradeOpitions = false
    songIsPlay        = false
    
end

return init