ui = {}

function ui:init()
--tables
    fileName = {text = "untituled"}
    
end

function ui:render()
    --texts
    love.graphics.print( "Channel: ",
        love.graphics.getWidth() / 2,
        128,
        nil,
        nil,
        nil,
        font:getWidth( "Channel: "),
        nil
    )
    love.graphics.print( "File name: ",
        love.graphics.getWidth() / 2,
        64,
        nil,
        nil,
        nil,
        font:getWidth("File name: "),
        nil
    )
    love.graphics.print( "New file",
        love.graphics.getWidth() / 2,
        0,
        nil,
        nil,
        nil,
        font:getWidth("New file") / 2,
        nil
    )
    love.graphics.print( "BitTax: ",
        love.graphics.getWidth() / 2,
        96,
        nil,
        nil,
        nil,
        font:getWidth("BitTax: "),
        nil
    )
    love.graphics.print( "Quality: ",
        love.graphics.getWidth() / 2,
        160,
        nil,
        nil,
        nil,
        font:getWidth("Quality: "),
        nil
    )
    --inputs
    suit.Input( fileName, love.graphics.getWidth() / 2, 62)
    
    --buttons
    suit.Button( "Create",
        {id = 'new file'},
        love.graphics.getWidth() - 64,
        love.graphics.getHeight() - 64,
        64,
        64
    )
    suit.Button( "8Bits", {id = '8Bits'}, love.graphics.getWidth() / 2, 96)
    suit.Button( "16Bits", {id = '16Bits'}, love.graphics.getWidth() / 2 + font:getWidth("8Bits") + 8, 96)
    suit.Button( "mono", {id = 'mono'}, love.graphics.getWidth() / 2 , 128)
    suit.Button( "estereo", {id = 'estereo'}, love.graphics.getWidth() / 2 + font:getWidth("mono") + 8, 128)
    suit.Button( "High", {id = 'highQuality'}, love.graphics.getWidth() / 2, 160)
    suit.Button( "Low", {id = 'lowQuality'}, love.graphics.getWidth() / 2 + font:getWidth("High "), 160)
end

return ui