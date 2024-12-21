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

function EnemyController:getActive()
	return GameState.enemies[GameState.activeEnemy]
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
		GameState.activeEnemy = toActivate
	end
end

function EnemyController:handleKey(key)
	local ae = EnemyController:getActive()

	-- if the key matches the next character in Enemy.characters
	if ae.characters[ae.attemptCursor] == key then
		--append to attemptCharacters
		table.insert(ae.attemptCharacters, ae.characters[ae.attemptCursor])

		if ae.word == table.concat(ae.attemptCharacters) then
			--if it's the last character (check if characters and attemptCharacters are the same), handle the end, if not,
			ae:markComplete()
			GameState.score = GameState.score + 1
			GameState.currentSpeed = 0.2 + (0.001 * GameState.score)
			--GameState.timeBetweenWords = (GameState.timeBetweenWords >= 100) and (GameState.timeBetweenWords - 10)
			--or 100
			EnemyController:refreshActive()
		else
			--add to the attemptCharacters and increase attemptCursor
			ae.attemptCursor = ae.attemptCursor + 1
		end
	else
		-- reset
		ae.attemptCursor = 1
		ae.attemptCharacters = {}
	end

	ae.attempt = table.concat(EnemyController:getActive().attemptCharacters)
end

function EnemyController:tick()
	if GameState.timeToNextWord == 0 then
		EnemyController:create()
		GameState.timeToNextWord = GameState.timeBetweenWords
	end

	GameState.timeToNextWord = GameState.timeToNextWord - 1

	for k in pairs(GameState.enemies) do
		if GameState.enemies[k].offScreen == true then
			if GameState.enemies[k].completed == false then
				SceneManager:enter(Scenes.gameover)
			else
				table.remove(GameState.enemies, k)
				EnemyController:refreshActive()
			end
		else
			GameState.enemies[k]:update()
		end
	end
end

function EnemyController:drawTick()
	for k in pairs(GameState.enemies) do
		GameState.enemies[k]:draw()
	end
end
