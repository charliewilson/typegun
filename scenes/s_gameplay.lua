require("controllers/c_enemy")
local s_gameplay = {}
local ec = EnemyController()

function s_gameplay:enter(previous, ...)
	-- setup
	love.graphics.setColor(255, 255, 255, 1)
end

function s_gameplay:update(dt)
	ec:tick()
end

function s_gameplay:leave(next, ...)
	-- cleanup
	--love.graphics.setColor(255, 255, 255, 1)
end

function s_gameplay:draw()
	love.graphics.print("TTNW: " .. GameState.timeToNextWord)

	ec:drawTick()

	for k, v in pairs(GameState.enemies) do
		love.graphics.print(k .. ": " .. v.word .. " (active: " .. (v.active and "yes" or "no"), 0, (12 * (k + 1)))
	end
end

function s_gameplay:keypressed(key)
	if key == "return" then
		SceneManager:enter(Scenes.menu)
	elseif key == "space" then
		--do something
	else
		ec:handleKey(key)
	end
end

return s_gameplay
