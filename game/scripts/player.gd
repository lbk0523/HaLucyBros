extends CharacterBody2D

const MAX_SPEED := 190.0
const ACCELERATION := 900.0
const FRICTION := 1200.0
const GRAVITY := 980.0
const JUMP_VELOCITY := -420.0
const TIME_LIMIT := 24.0

@onready var goal_area: Area2D = $"../GoalArea"
@onready var timer_label: Label = $"../HUD/TimerLabel"
@onready var status_label: Label = $"../HUD/StatusLabel"

var time_left := TIME_LIMIT
var finished := false

func _ready() -> void:
	_update_hud("Reach the green goal")

func _physics_process(delta: float) -> void:
	if finished:
		velocity.x = move_toward(velocity.x, 0.0, FRICTION * delta)
		velocity.y += GRAVITY * delta
		move_and_slide()
		return

	_apply_horizontal_movement(delta)
	_apply_gravity_and_jump(delta)
	move_and_slide()

	time_left = max(time_left - delta, 0.0)
	if goal_area.overlaps_body(self):
		_finish("Goal reached")
	elif time_left <= 0.0:
		_finish("Time expired")
	else:
		_update_hud("Reach the green goal")

func _apply_horizontal_movement(delta: float) -> void:
	var input_axis := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if input_axis != 0.0:
		velocity.x = move_toward(velocity.x, input_axis * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, FRICTION * delta)

func _apply_gravity_and_jump(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	elif velocity.y > 0.0:
		velocity.y = 0.0

	if is_on_floor() and (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept")):
		velocity.y = JUMP_VELOCITY

func _finish(message: String) -> void:
	finished = true
	_update_hud(message)

func _update_hud(message: String) -> void:
	timer_label.text = "TIME %.1f" % time_left
	status_label.text = message
