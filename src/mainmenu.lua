local MainMenu = {
    init = function(self)
    end;

    enter = function(self, prev)
        self.buttons = {}
        table.insert(self.buttons, Button(30, 30, Button_1, "", function() end))
    end;

    update = function(self, dt)
        for _, button in ipairs(self.buttons) do
            button:update(dt)
        end
    end;

    draw = function(self)
        love.graphics.print("Main Menu", 0, 0)
        for _, button in ipairs(self.buttons) do
            button:draw()
        end
    end;
}

return MainMenu
