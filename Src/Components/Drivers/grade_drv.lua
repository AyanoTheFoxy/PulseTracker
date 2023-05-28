gradeDrv = {}

function gradeDrv:canPlace( timer, id)
    for i, grade in ipairs(song.grades) do
        if grade.timer == timer and grade.id == id then
            return true
        end
    end
end

function gradeDrv:createGrade( id, hz, lenght, timer, waveType, volume, amplitude)
    local grade = {}
        grade.id        = id
        grade.hz        = hz
        grade.lenght    = lenght
        grade.timer     = timer
        grade.wave      = waveType
        grade.volume    = volume
        grade.amplitude = amplitude
    table.insert( song.grades, grade)
end

function gradeDrv:removeGrade( id, timer)
    for i, note in ipairs(song.grades) do
        if id == note.id and timer == note.timer then
            table.insert( trash, 1, song.grades[i])
            table.remove( song.grades, i)
            break
        end
    end
end

return gradeDrv