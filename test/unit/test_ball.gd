extends GutTest

class TestBall:
	extends GutTest
	var ball
	func before_all():
		ball = load('res://scripts/ball.gd').new()
		gut.p("ran setup", 2)
	func after_all():
		ball.free()
		gut.p("ran cleanup", 2)
	func test_movement():
		ball.move(1,1)
		assert_ne(ball.ball_velocity, Vector2(0,0), "It moves")

