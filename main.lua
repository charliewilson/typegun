local roomy = require("lib/roomy")
SceneManager = roomy.new()

Debug = false

Object = require("lib/classic")
Scenes = require("scenes/s_all")

Colours = require("res/r_colours")
Fonts = require("res/r_fonts")
H = require("res/r_helpers")

GameState = {
	score = 0,
	currentSpeed = 0.2,
	timeBetweenWords = 100,
	timeToNextWord = 0,
	enemies = {},
	activeEnemy = 0,
}

function love.load()
	Width = 402
	Height = 874

	love.graphics.setFont(Fonts.words)

	SceneManager:hook()
	SceneManager:enter(Scenes.menu)
end
