extends GutTest

class TestGame:
	extends GutTest
	var game
	var game_scene
	onready var rounds = get_node("/root/Singleton")

	func before_all():
		game_scene = preload("res://scenes/game.tscn")
		game  = game_scene.instance()
		game.add_child($Ball)
		game.add_child($pong_paddle)
		gut.p("ran setup", 2)
	func after_all():
		game.free()
		gut.p("ran cleanup", 2)
	func test_play_ball():
		game.play_ball()
		var ball = game.get_child(1)
		assert_ne(ball.ball_velocity, Vector2(0,0), "It moves")
	func test_move_paddle_down():
		var paddle = game.get_child(0)
		var ball = game.get_child(1)
		ball.move(0,1)
		game.move_paddle()
		assert_gt(paddle.paddle_velocity.y, 0)
