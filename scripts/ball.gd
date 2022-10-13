extends KinematicBody2D

export (int) var speed = 200

var ball_velocity = Vector2()

func move(num1, num2):
	ball_velocity.x += num1
	ball_velocity.y += num2
	ball_velocity = ball_velocity.normalized() * speed

func _physics_process(delta):
	var collision = move_and_collide(ball_velocity * delta)
	if collision:
		ball_velocity = ball_velocity.bounce(collision.normal)
