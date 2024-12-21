Enemy = Object:extend()

function Enemy:new(x, word)
	self.x = x or (love.math.random(love.graphics.getWidth()))
	self.y = 0
	self.word = word or "undefined"
	self.active = false
	self.offScreen = false
end

function Enemy:update()
	self.y = self.y + GameState.currentSpeed
	-- if it's offScreen, set the offScreen var to "true"
	-- this is then caught in s_gameplay:update to pop the enemy from the
	-- enemies table and "deactivate"
	if (self.y > love.graphics.getHeight()) and self.offScreen == false then
		self.offScreen = true
	end
end

function Enemy:draw()
	love.graphics.setColor(255, 255, 255, 1)
	love.graphics.print(self.word, self.x, self.y)
end
