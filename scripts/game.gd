extends Node2D
#Most of this is unfinished on purpose. Please add onto or remove completely whatever you like.
onready var game_objects = [$Ball, $pong_paddle]
const BALL = 0
const PONG = 1
onready var rounds = get_node("/root/Singleton")
onready var direction_decider = rounds.round_count % 3

func play_ball():
	match direction_decider:
		0:
			$Ball.move(1,0)
		1:
			$Ball.move(1, -0.5)
		_:
			$Ball.move(1, 0.5)

func move_paddle():
	if $Ball.ball_velocity.y > 0:
		$pong_paddle.move(1)
	elif $Ball.ball_velocity.y < 0:
		$pong_paddle.move(-1)
	else:
		$pong_paddle.move(0)

func _ready():
	play_ball()

func _physics_process(delta):
	move_paddle()

func _on_P1Side_body_entered(body):
	rounds.round_count += 1
	get_tree().reload_current_scene()
