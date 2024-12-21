EnemyController = Object:extend()
require("obj/o_enemy")
local words = require("res/r_words")
local currentKey = 0
local keyPressed = "space"

function EnemyController:new()
	-- do something
end

function EnemyController:create()
	table.insert(GameState.enemies, Enemy(currentKey, words[love.math.random(99)]))
	EnemyController:refreshActive()
	currentKey = currentKey + 1
end

function EnemyController:refreshActive()
	local toActivate = nil

	for k, v in pairs(GameState.enemies) do
		if v.completed == false and toActivate == nil then
			toActivate = k
		end
	end

	if toActivate ~= nil then
		GameState.enemies[toActivate]:activate()
	end
end

function EnemyController:handleKey(key)
	-- something
	keyPressed = key
end

function EnemyController:tick()
	if GameState.timeToNextWord == 0 then
		EnemyController:create()
		GameState.timeToNextWord = GameState.timeBetweenWords
	end

	GameState.timeToNextWord = GameState.timeToNextWord - 1

	for k in pairs(GameState.enemies) do
		if GameState.enemies[k].offScreen == true then
			table.remove(GameState.enemies, k)
			EnemyController:refreshActive()
		else
			GameState.enemies[k]:update()
		end
	end
end

function EnemyController:drawTick()
	for k in pairs(GameState.enemies) do
		GameState.enemies[k]:draw()
	end
	love.graphics.print("Key: " .. keyPressed, 0, 6)
end

function EnemyController:splitWord(word)
	local t = {}
	for str in string.gmatch(word, "([^%s]+)") do
		table.insert(t, str)
	end
	return t
end
