local Splash = {
    init = function(self)
    end;

    enter = function(self, prev)
        self.timer = 0
    end;

    update = function(self, dt)
        self.timer = self.timer + dt
        if self.timer >= 3 then
            Gamestate.switch(MainMenu)
        end
    end;

    draw = function(self)
        love.graphics.print("Splash", 0, 0)
    end;

    keypressed = function(self, key, scancode, isrepeat)
        if key then
            Gamestate.switch(MainMenu)
        end
    end;
}

return Splash
