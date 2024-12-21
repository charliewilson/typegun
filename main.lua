local roomy = require("lib/roomy")
SceneManager = roomy.new()

Object = require("lib/classic")
Scenes = require("scenes/s_all")

GameState = {
	currentSpeed = 0.1,
}

function love.load()
	Width = 402
	Height = 874

	SceneManager:hook()
	SceneManager:enter(Scenes.menu)
end
