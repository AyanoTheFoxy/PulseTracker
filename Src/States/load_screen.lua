loadScreen = {} --the loadscreen table with the functions

function loadScreen:enter()
--tables
    self.img = {}
    
--vars
    self.alph = 0
    self.loadScreenTimer = timer.new()

--cmds
    for i = 1, #preLoad.assets.images.loadScreen do
        table.insert( self.img, love.graphics.newImage(preLoad.assets.images.loadScreen[i])) --load preLoad images
    end
    
    self.loadScreenTimer:after( 5,
        function()
            self.img[1]:release()
            gamestate.switch(states.soundCreator)
        end
    )
end

function loadScreen:draw()
    love.graphics.setColor( 1, 1, 1, self.alph)
        love.graphics.draw( self.img[1],
            0,
            0,
            nil,
            love.graphics.getWidth() / 256,
            love.graphics.getHeight() / 128
        )
end

function loadScreen:update(deltaTime)
    self.loadScreenTimer:update(deltaTime)
    
    if self.alph < 1 then
        self.alph = self.alph + .005
    end
end

return loadScreen