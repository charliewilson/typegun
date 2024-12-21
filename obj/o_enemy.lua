Enemy = Object:extend()

function Enemy:new(key, word)
	self.key = key
	self.x = love.math.random(200, (love.graphics.getWidth() - 200))
	self.y = 0
	self.word = word
	self.characters = H:splitWord(word)
	self.attempt = ""
	self.attemptCharacters = {}
	self.attemptCursor = 1
	self.active = false
	self.offScreen = false
	self.completed = false
end

function Enemy:activate()
	for k in pairs(GameState.enemies) do
		GameState.enemies[k].active = false
	end

	self.active = true
end

function Enemy:markComplete()
	self.completed = true
	self.active = false
end

function Enemy:update()
	self.y = self.y + GameState.currentSpeed
	-- if it's offScreen, set the offScreen var to "true"
	-- this is then caught in c_enemy:tick() to pop the enemy from the
	-- enemies table and "deactivate"
	if (self.y > love.graphics.getHeight()) and self.offScreen == false then
		self.offScreen = true
	end
end

function Enemy:draw()
	local r, g, b = love.graphics.getColor()
	if self.completed then
		H:setColor("green")
	elseif self.active then
		H:setColor("white")
	else
		H:setColor("grey")
	end

	love.graphics.print(self.word, self.x, self.y)

	if self.completed == false then
		H:setColor("blue")
		love.graphics.print(self.attempt, self.x, self.y)
	end

	love.graphics.setColor(r, g, b)
end
