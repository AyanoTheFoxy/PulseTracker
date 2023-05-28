ultilities = {}

function ultilities:update()
    fileName.text = string.gsub( fileName.text, '[%s%p]+', "")
    meta.fileName = fileName.text
    
    --buttons 
    if suit.isActive('new file') then
        love.filesystem.createDirectory('Songs/' .. meta.fileName)
        
        local songPath = love.filesystem.getInfo('Songs/' .. meta.fileName .. '/song.json')
        
        if songPath == nil then
            songFile = love.filesystem.newFile( 'Songs/' .. meta.fileName .. '/song.json', 'w')
            songFile:write(json.encode(meta))
            songFile:close()
        end
        
        soundEditor.id = fileName.text
        gamestate.switch( states.soundEditor)
    elseif suit.isActive('8Bits') then
        meta.bitTax = 8
    elseif suit.isActive('16Bits') then
        meta.bitTax = 16
    elseif suit.isActive('mono') then
        meta.channel = 1
    elseif suit.isActive('estereo') then
        meta.channel = 2
    elseif suit.isActive('highQuality') then
        meta.rate = 44100
    elseif suit.isActive('lowQuality') then
        meta.rate = 22050
    end
end

return ultilities