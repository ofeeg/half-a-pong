extends GutTest

class TestPong:
	extends GutTest
	var pong
	func before_all():
		pong = load('res://scripts/pong.gd').new()
		gut.p("ran setup", 2)
	func after_all():
		pong.free()
		gut.p("ran cleanup", 2)
	func test_movement():
		pong.move(1)
		assert_ne(pong.paddle_velocity, Vector2(0,0), "It moves")
