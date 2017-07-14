local Button = Class {
    init = function(self, x, y, image, text, action)
        self.x = x
        self.y = y
        self.image = image
        self.text = text
        self.action = action
        self.focused = false
        self.selected = false
    end;

    update = function(self, dt)
        if mouse_is_hovered(self.x, self.y, self.image:getWidth(),
                            self.image:getHeight()) then
            self.focused = true
        elseif not self.selected then
            self.focused = false
        end

        if self.focused and love.mouse.isDown(1)
           and mouse_is_hovered(self.x, self.y, self.image:getWidth(),
                                self.image:getHeight()) then
            self.selected = true
        end

        if self.selected and not love.mouse.isDown(1) then
            self.selected = false

            if mouse_is_hovered(self.x, self.y, self.image:getWidth(),
                                self.image:getHeight()) then
                self.action()
            end
        end
    end;

    -- TODO Juice up the focused/selected graphics.
    -- TODO Optionally, support button rotation/scale/shear/etc.
    draw = function(self)
        -- Save previous color and reapply it at the end in case of color
        -- changes.
        r, g, b, a = love.graphics.getColor()

        love.graphics.draw(self.image, self.x, self.y)

        if self.focused then
            if self.selected then
                love.graphics.setColor(255, 255, 0, 255)
            end

            love.graphics.rectangle("line", self.x - 1, self.y - 1,
                                    self.image:getWidth() + 2,
                                    self.image:getHeight() + 2)
        end

        love.graphics.setColor(r, g, b, a)
    end;
}

return Button
