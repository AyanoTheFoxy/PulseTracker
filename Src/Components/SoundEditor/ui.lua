ui = {}

function ui:init()
--tables
    --assets
    self.img = {}
    keys     = {}
    keysId = {
        {   1;
            3;
            5;
            6;
            8;
            10;
            12;
            13;
            14;
            16
        };
        {   2;
            4;
            7;
            9;
            11;
            15
        }
    }
    
--cmds
    for i = 1, #preLoad.assets.images.soundEditor do
        table.insert( self.img, love.graphics.newImage(preLoad.assets.images.soundEditor[i])) --load preLoad images
    end
end

function ui:render()
--background parts
    --top
    love.graphics.setColor( .25, .25, .25)
        love.graphics.rectangle( 'fill', 0, 0, love.graphics.getWidth(), 32)
    love.graphics.setColor( 1, 1, 1)
--txts
    if openGradeOpitions then
        love.graphics.print( "Wave type:", 512, 32)
        love.graphics.print( "Square: Sine: Noise: Triangle: Sawtooth: ", 512, 64)
        love.graphics.print( "Volume:", 512, 96)
        love.graphics.print( math.floor(slider.volume.value * 100) .. "%", 728, 96 + font:getHeight())
        love.graphics.print( "Amplitude:", 512, 128)
        love.graphics.print( math.floor(slider.amplitude.value * 100) .. "%", 728, 128 + font:getHeight())
        love.graphics.print( "BitTax:            Channel:", 512, 166)
        love.graphics.print( "8Bits: 16Bits:  Estereo: Mono:", 512, 166 + font:getHeight())
        love.graphics.print( "Quality: ", 512, 223)
        love.graphics.print( "High: Low:", 512, 223 + font:getHeight())
        
--sliders
        suit.Slider( slider.volume, {vertical = false}, 512, 96 + font:getHeight(), 200, 16)
        suit.Slider( slider.amplitude, {vertical = false}, 512, 128 + font:getHeight(), 200, 16)
    end
--buttons
    --save
    suit.ImageButton( self.img[1], {id = 'save'}, 0, 0)
    
    --song, play, restart and speedup
    if not songIsPlay then
        suit.ImageButton( self.img[2], {id = 'play'}, love.graphics.getWidth() / 2 - self.img[2]:getWidth() / 2, 290)
    else
        suit.ImageButton( self.img[3], {id = 'pause'}, love.graphics.getWidth() / 2 - self.img[3]:getWidth() / 2, 290)
    end
    
    suit.ImageButton( self.img[8], {id = 'restart'}, love.graphics.getWidth() / 2 - 48, 290)
    
    suit.ImageButton( self.img[9], {id = 'speedUp'}, love.graphics.getWidth() / 2 + 16, 290)
    
    --wavetypes
    if openGradeOpitions then
        if wave == 'square' then
            suit.ImageButton( self.img[5], {id = 'squareWave'}, 512+ font:getWidth("Square: ") / 6, 64 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'squareWave'}, 512+ font:getWidth("Square: ") / 6, 64 + font:getHeight())
        end
        
        if wave == 'sine' then
            suit.ImageButton( self.img[5], {id = 'sineWave'}, 512 + font:getWidth("Square: "), 64 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'sineWave'}, 512 + font:getWidth("Square: "), 64 + font:getHeight())
        end
    
        if wave == 'noise' then
            suit.ImageButton( self.img[5], {id = 'noiseWave'}, 512 + font:getWidth("Square: Sine: ") + font:getWidth("Noise : ") / 8, 64 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'noiseWave'}, 512 + font:getWidth("Square: Sine: ") + font:getWidth("Noise: ") / 8, 64 + font:getHeight())
        end
    
        if wave == 'triangle' then
            suit.ImageButton( self.img[5], {id = 'triangleWave'}, 512 + font:getWidth("Square: Sine: Noise: ") + font:getWidth("Triangle: ") / 6, 64 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'triangleWave'}, 512 + font:getWidth("Square: Sine: Noise: ") + font:getWidth("Triangle: ") / 6, 64 + font:getHeight())
        end
    
        if wave == 'sawtooth' then
            suit.ImageButton( self.img[5], {id = 'sawtoothWave'}, 512 + font:getWidth("Square: Sine: Noise: Triangle: ") + font:getWidth("Sawtooth: ") / 4, 64 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'sawtoothWave'}, 512 + font:getWidth("Square: Sine: Noise: Triangle: ") + font:getWidth("Sawtooth: ") / 4, 64 + font:getHeight())
        end
    end
    
    --editoroffset
    suit.ImageButton( self.img[6], {id = 'left'}, love.graphics.getWidth() / 2 - 80, 290)
    suit.ImageButton( self.img[7], {id = 'right'}, love.graphics.getWidth() / 2 + 48, 290)
    
    --delete and create
    suit.ImageButton( self.img[10], {id = 'delete'}, 32, 0)
    
    --undo e redo
    suit.ImageButton( self.img[11], {id = 'undo'}, love.graphics.getWidth() - 96, 0)
    suit.ImageButton( self.img[12], {id = 'redo'}, love.graphics.getWidth() - 64, 0)
    
    --grade opitions
    suit.ImageButton( self.img[13], {id = 'gradeOptions'}, love.graphics.getWidth() - 32, 0)
    
    --quality
    if openGradeOpitions then
        if song.bitTax == 16 then
            suit.ImageButton( self.img[5], {id = '16BitsEditor'}, 512 + font:getWidth("8Bits: ") + font:getWidth("16Bits:") / 4, 188 + font:getHeight())
            suit.ImageButton( self.img[4], {id = '8BitsEditor'}, 512, 188 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = '16BitsEditor'}, 512 + font:getWidth("8Bits: ") + font:getWidth("8Bits:") / 4, 188 + font:getHeight())
            suit.ImageButton( self.img[5], {id = '8BitsEditor'}, 512, 188 + font:getHeight())
        end
        
--channel
        if song.channel == 1 then
            suit.ImageButton( self.img[5], {id = 'mono'}, 512 + font:getWidth("8Bits: 16Bits:  Estereo: ") + font:getWidth("Mono:") / 4, 188 + font:getHeight())
            suit.ImageButton( self.img[4], {id = 'estereo'}, 512 + font:getWidth("8Bits: 16Bits: ") + font:getWidth("Estereo: ") / 4, 188 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'mono'}, 512 + font:getWidth("8Bits: 16Bits:  Estereo:") + font:getWidth("Mono:") / 4, 188 + font:getHeight())
            suit.ImageButton( self.img[5], {id = 'estereo'}, 512 + font:getWidth("8Bits: 16Bits: ") + font:getWidth("Estereo: ") / 4, 188 + font:getHeight())
        end
        
        if song.rate == 44100 then
            suit.ImageButton( self.img[5], {id = 'highQuality'}, 512, 244 + font:getHeight())
            suit.ImageButton( self.img[4], {id = 'lowQuality'}, 512 + 40, 244 + font:getHeight())
        else
            suit.ImageButton( self.img[4], {id = 'highQuality'}, 512, 244 + font:getHeight())
            suit.ImageButton( self.img[5], {id = 'lowQuality'}, 512 + 40, 244 + font:getHeight())
        end
    end
--keyboard
    --white keys
    local whiteId = 1
    for i = love.graphics.getWidth() / 2 - 222, love.graphics.getWidth() / 2 + 222, 48 do
        love.graphics.setColor( 1, 1, 1)
            love.graphics.rectangle( 'fill',
                i,
                love.graphics.getHeight() - 80,
                48,
                80
            )
        love.graphics.setColor( 0, 0, 0)
        local key = {}
            key.x = i
            key.y = love.graphics.getHeight() - 80
            key.w = 48
            key.h = 80
            key.id = keysId[1][whiteId]
         
            love.graphics.rectangle( 'line',
                key.x,
                key.y,
                key.w,
                key.h
            )
        table.insert( keys, key)
        whiteId = whiteId + 1
    end
    
    --black keys
    local blackId = 1
    for i = love.graphics.getWidth() / 2 - 186, love.graphics.getWidth() / 2 + 222, 48 do
        if i == love.graphics.getWidth() / 2 - 186 or i == love.graphics.getWidth() / 2 - 138 or i == love.graphics.getWidth() / 2 - 42 or i == love.graphics.getWidth() / 2 + 6 or i == love.graphics.getWidth() / 2 + 54 or i == love.graphics.getWidth() / 2 + 198 then
            love.graphics.rectangle( 'fill',
               i,
               love.graphics.getHeight() - 80,
               24,
               64
            )
            
            local key = {}
                key.x = i
                key.y = love.graphics.getHeight() - 80
                key.w = 24
                key.h = 64
                key.id = keysId[2][blackId]
                
            table.insert( keys, key)
            blackId = blackId + 1
        end
    end
    
    --show notes
    for i, grade in ipairs(song.grades) do
        if grade.wave == 'square' then
            love.graphics.setColor( 1, 0, 0)
        elseif grade.wave == 'sine' then
            love.graphics.setColor( 0, 1, 0)
        elseif grade.wave == 'noise' then
            love.graphics.setColor( 0, 0, 1)
        elseif grade.wave == 'triangle' then
            love.graphics.setColor( 1, 1, 0)
        else
            love.graphics.setColor( 1, 0, 1)
        end
        
        if grade.timer * 32 + editorOffSet * 32 < 481 and grade.timer * 32 + editorOffSet * 32 > -1 then
            love.graphics.rectangle( 'fill',
                grade.timer * 32 + editorOffSet * 32,
                grade.id * 16 + 16,
                32,
                16
            )
        end
    end
    
    --grid
    for x = 0, 480, 32 do
        for y = 32, 272, 16 do
            love.graphics.setColor( 1, 1, 1, .2)
                love.graphics.rectangle( 'line',
                    x,
                    y,
                    32,
                    16
                )
        end
    end
    
    --show song
    if timer * 32 + editorOffSet * 32 < 512 and timer * 32 + editorOffSet * 32 > 0 then
        love.graphics.setColor( 0, 1, 1)
            love.graphics.rectangle( 'line',
                timer * 32 + editorOffSet * 32,
                32,
                1,
                256
            )
    end
    
    --timer
    love.graphics.setColor( 0, 1, 0)
        love.graphics.rectangle( 'line',
            cx,
            32,
            32,
            256
        )
        --last grade
        if #song.grades > 0 and song.grades[#song.grades].timer * 32 + editorOffSet * 32 < 620 and song.grades[#song.grades].timer * 32 + editorOffSet * 32 > -1 then
            love.graphics.rectangle( 'line',
                song.grades[#song.grades].timer * 32 + editorOffSet * 32,
                song.grades[#song.grades].id * 16 + 16,
                32,
                16
            )
        end
    love.graphics.setColor( 1, 1, 1)
end

return ui