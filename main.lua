require("asset/init")
require("lib/init")
require("src/init")

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Splash)
end
