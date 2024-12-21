require("obj/o_enemy")
local s_gameplay = {}
local enemies = {}

function s_gameplay:enter(previous, ...)
	-- setup
	love.graphics.setColor(255, 0, 0, 1)
end

function s_gameplay:update(dt)
	for k, v in pairs(enemies) do
		if enemies[k].offScreen == true then
			table.remove(enemies, k)
		else
			enemies[k]:update()
		end
	end
end

function s_gameplay:leave(next, ...)
	-- cleanup
	love.graphics.setColor(255, 255, 255, 1)
end

function s_gameplay:draw()
	for k, v in pairs(enemies) do
		love.graphics.print("Enemy " .. k, 0, (12 * (k + 1)))

		enemies[k]:draw()
	end
end

function s_gameplay:keypressed(key)
	if key == "return" then
		SceneManager:enter(Scenes.menu)
	elseif key == "space" then
		table.insert(enemies, Enemy())
	end
end

return s_gameplay
