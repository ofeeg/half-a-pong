extends KinematicBody2D
signal deflect_ball(num)
export (int) var p_speed = 200
var paddle_velocity = Vector2(0, 0)
func move(num):
	paddle_velocity.y += num
	paddle_velocity = paddle_velocity.normalized() * p_speed


func _physics_process(delta):
	paddle_velocity = move_and_slide(paddle_velocity)
