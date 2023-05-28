ultilities = {}

function ultilities:init()
    
--arrays
    self.tones = { { 261.625519; 1.314856}; --C
        { 277.182648; 1.271059}; --C#
        { 293.664734; 1.171404}; --D
        { 311.126984; 1.105658}; --D#
        { 329.627533; 1.043602}; --E
        { 349.228241; .985029}; --F
        { 369.994385; .929744}; --F#
        { 391.995392; .877561}; --G
        { 415.304688; .828308}; --G#
        { 440; .781818}; --A
        { 466.163788; .737938}; --A#
        { 493.883301; .696521}; --B
        { 523.251099; .657428}; --C
        { 554.365234; .620529}; --D
        { 622.253906; .585829}; --D#
        { 659.255127; .521801} --E
    }
    
--vars
    self.timeSpeed = .25
end

function ultilities:update()
    --cx
    if tx <= 512 and ty >= 32 and ty <= 272 then
        cx = math.floor(tx / 32) * 32
    end
    
    --buttons
    if suit.isActive("save") then
        love.filesystem.write( 'Songs/' .. soundEditor.id .. '/song.json', json.encode(song))
    elseif suit.isActive("play") then
        if not songIsPlay then
            songIsPlay = true
        end
    elseif suit.isActive("pause") then
        songIsPlay = false
    elseif suit.isActive("restart") then
        timer = -.25
        songIsPlay = false
    elseif suit.isActive('speedUp') then
        if songIsPlay then
            self.timerSpeed = .5
        end
    elseif suit.isActive('delete') then
        if mode == 'create' then
            mode = 'remove'
        else
            mode = 'create'
        end
    elseif suit.isActive("squareWave") then
        wave = 'square'
    elseif suit.isActive("sineWave") then
        wave = 'sine'
    elseif suit.isActive("noiseWave") then
        wave = 'noise'
    elseif suit.isActive("triangleWave") then
        wave = 'triangle'
    elseif suit.isActive("sawtoothWave") then
        wave = 'sawtooth'
    elseif suit.isActive("left") then
        if editorOffSet < 0 then
            editorOffSet = editorOffSet + 1
        end
    elseif suit.isActive("right") then
        editorOffSet = editorOffSet - 1
    elseif suit.isActive("undo") then
        if #trash > 0 then
            table.insert( song.grades, trash[#trash])
            table.remove( trash, #trash)
        end
    elseif suit.isActive("redo") then
        if #song.grades > 0 then
            table.insert( trash, 1, song.grades[#song.grades])
            table.remove( song.grades, #song.grades)
        end
    elseif suit.isActive("gradeOptions") then
        if not openGradeOpitions then
            openGradeOpitions = true
        else
            openGradeOpitions = false
        end
    elseif suit.isActive("8BitsEditor") then
        song.bitTax = 8
    elseif suit.isActive("16BitsEditor") then
        song.bitTax = 16
    elseif suit.isActive("estereo") then
        song.channel = 2
    elseif suit.isActive("mono") then
        song.channel = 1
    elseif suit.isActive("highQuality") then
        song.rate = 44100
    elseif suit.isActive("lowQuality") then
        song.rate = 22050
    else
        self.timerSpeed = .25
    end
    
    --grade buttons
    for i, key in ipairs(keys) do
        if touchOnButton( tx, ty, keys[i]) then
            if not gradeDrv:canPlace( math.floor(cx / 32) - editorOffSet, key.id) and mode == 'create' then
                
                soundDrv.newTone( self.tones[key.id][1], self.tones[key.id][2], wave, song.bitTax, song.channel, slider.volume.value, slider.amplitude.value, song.rate):play()
                
                gradeDrv:createGrade( key.id, self.tones[i][1], self.tones[i][2], math.floor(cx / 32) - editorOffSet, wave, slider.volume.value, slider.amplitude.value)
                break
            elseif mode == 'remove' then
                gradeDrv:removeGrade( key.id, math.floor(cx / 32) - editorOffSet)
            end
        end
    end

    if songIsPlay then
        for i, grade in ipairs(song.grades) do
            if timer == grade.timer then
                soundDrv.newTone( grade.hz, grade.lenght, grade.wave, song.bitTax, song.channel, grade.volume, grade.amplitude, song.rate):play()
            end
        end
        
        timer = timer + self.timeSpeed
        
        if #song.grades > 0 then
            if timer > song.grades[#song.grades].timer + 1 then
                timer = -self.timeSpeed
            end
        end
    end
end

return ultilities