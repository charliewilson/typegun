local s_menu = {}

function s_menu:enter(previous, ...)
	-- setup
	if previous == Scenes.gameover then
		GameState = {
			score = 0,
			currentSpeed = 0.2,
			timeBetweenWords = 100,
			timeToNextWord = 0,
			enemies = {},
			activeEnemy = 0,
		}
	end
end

function s_menu:update(dt)
	-- update
end

function s_menu:leave(next, ...)
	-- cleanup
end

function s_menu:draw()
	-- draw
	love.graphics.print("press enter to start or escape to quit")
end

function s_menu:keypressed(key)
	if key == "return" then
		SceneManager:enter(Scenes.gameplay)
	elseif key == "escape" then
		love.event.quit()
	end
end

return s_menu
