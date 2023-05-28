soundthread = {} 
  
function soundthread.newTone( freq, waveLength, waveType, bitTax, channel, volume, amplitude, rate)
    --I stole this shit from litium >w<
    if volume == nil then
        volume = 1
    end
    
    if bitTax == nil then
        bitTax = 16
    end
    
    if channel == nil then
        channel = 1
    end
    
    if waveType == nil then
        waveType = 'square'
    end
    
    if amplitude == nil then
        amplitude = 1
    end
    
    if rate == nil then
        rate = 44100
    end
    
    local rate      = 44100
    local length    = waveLength / 32
    local phase     = math.floor(rate / freq)
    local soundData = love.sound.newSoundData( math.floor(length * rate), rate, bitTax, channel)
    
    for i = 0, soundData:getSampleCount() - 1 do 
        if waveType == 'noise' then
            soundData:setSample( i, math.random()) 
        elseif waveType == 'sine' then
            soundData:setSample( i, math.sin(2 * math.pi * i / phase))
        elseif waveType == 'square' then
            soundData:setSample( i, i % phase < phase / 2 and amplitude or -amplitude)
        elseif waveType == 'triangle' then
            soundData:setSample( i, 4 * amplitude / phase * math.abs((((i - phase / 4) % phase) + phase) % phase - phase / 2) - amplitude)
        elseif waveType == 'sawtooth' then
            soundData:setSample( i, 2 * math.atan(math.tan(i / 2)))
        end
    end
    
    snd = love.audio.newSource(soundData)
    
    snd:setVolume(volume)
    return snd
 end 
  
 return soundthread