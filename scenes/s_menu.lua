local s_menu = {}

function s_menu:enter(previous, ...)
	-- setup
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
