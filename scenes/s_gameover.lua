local s_gameover = {}

function s_gameover:enter(previous, ...) end

function s_gameover:update(dt)
	-- update
end

function s_gameover:leave(next, ...)
	-- cleanup
end

function s_gameover:draw()
	-- draw
	love.graphics.print("Game over! You scored: " .. GameState.score .. ". Press enter to go back to the menu.")
end

function s_gameover:keypressed(key)
	if key == "return" then
		SceneManager:enter(Scenes.menu)
	end
end

return s_gameover
