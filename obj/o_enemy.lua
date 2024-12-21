Enemy = Object:extend()
local helpers = require("res/r_helpers")

function Enemy:new(key, word)
	self.key = key
	self.x = love.math.random(love.graphics.getWidth())
	self.y = 0
	self.word = word
	self.characters = helpers:splitWord(word)
	self.active = false
	self.offScreen = false
	self.completed = false

	print(helpers:dump(self.characters))
end

function Enemy:activate()
	for k in pairs(GameState.enemies) do
		GameState.enemies[k].active = false
	end

	self.active = true
end

function Enemy:complete()
	--GameState.enemies[k].active = false
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
	local r, g, b = love.graphics.getColor()
	if self.completed then
		love.graphics.setColor(love.math.colorFromBytes(0, 255, 0))
	elseif self.active then
		love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
	else
		love.graphics.setColor(love.math.colorFromBytes(150, 150, 150))
	end
	love.graphics.print(self.word, self.x, self.y)
	love.graphics.setColor(r, g, b)
end
