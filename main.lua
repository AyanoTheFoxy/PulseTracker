function love.load()
--sources
    --libs
    json      = require 'FoxToolBox/Libs/json'
    timer     = require 'FoxToolBox/Libs/timer'
    suit      = require 'FoxToolBox/Libs/suit'
    gamestate = require 'FoxToolBox/Libs/gamestate'
    
    --addons
    
--tables
    --sources
    preLoad = {}
    preLoad = json.decode(love.filesystem.read('Src/Components/preLoad.json'))
    
    states              = {}
        states.soundEditor  = require 'Src/States/sound_editor'
        states.soundCreator = require 'Src/States/sound_creator'
        states.loadScreen   = require 'Src/States/load_screen'
    
--vars
    tx, ty = -1, -1
    
    --assets
    font = love.graphics.newFont( 'Assets/Fonts/LouisGeorgeCafe.ttf', 16, 'normal', 2)
    
--cmds
    love.graphics.setDefaultFilter( 'nearest', 'nearest') --image quality
    love.graphics.setFont(font) --editor font
    
    gamestate.switch(states.loadScreen)
    gamestate.registerEvents({ 'update', 'keypressed', 'textinput', 'textedited'})
    
--cmds
    suit.theme.color.normal  = { bg = { .1; .1; .1}; fg    = { 1; 1; 1}}
    suit.theme.color.hovered = { bg = { .1; .1; .1}; fg    = { 1; 1; 1}}
    suit.theme.color.active  = { bg = { .25; .25; .25}; fg = { 1; 1; 1}}
end

function love.draw()
    love.graphics.setBackgroundColor( .1, .1, .1)
    gamestate.current():draw()
    suit.draw()
end

function love.update(deltaTime)
    local touches = love.touch.getTouches()
    
    for i, touch in ipairs(touches) do
        tx, ty = love.touch.getPosition(touch)
    end
end

function love.keypressed(k)
    suit.keypressed(k)
end

function love.textedited( t, s, l)
    suit.textedited( t, s, l)
end

function love.textinput(k)
    suit.textinput(k)
end

function touchOnButton( tx, ty, button)
    if tx >= button.x and ty >= button.y and tx <= button.x + button.w and ty <= button.y + button.h then
        return true
    else
        return false
    end
end