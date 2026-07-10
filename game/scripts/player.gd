extends CharacterBody2D

const MAX_SPEED := 190.0
const ACCELERATION := 900.0
const FRICTION := 1200.0
const GRAVITY := 980.0
const JUMP_VELOCITY := -420.0
const TIME_LIMIT := 24.0
const START_POSITION := Vector2(72, 320)

@onready var goal_area: Area2D = $"../GoalArea"
@onready var hazard_area: Area2D = $"../HazardArea"
@onready var collectible_area: Area2D = $"../CollectibleArea"
@onready var collectible_collision: CollisionShape2D = $"../CollectibleArea/CollectibleCollision"
@onready var timer_label: Label = $"../HUD/TimerLabel"
@onready var item_label: Label = $"../HUD/ItemLabel"
@onready var status_label: Label = $"../HUD/StatusLabel"
@onready var result_label: Label = $"../HUD/ResultLabel"
@onready var retry_button: Button = $"../HUD/RetryButton"

var time_left := TIME_LIMIT
var finished := false
var has_collectible := false
var reset_overlap_grace_frames := 0

func _ready() -> void:
	retry_button.pressed.connect(_reset_run)
	_reset_run()

func _physics_process(delta: float) -> void:
	if finished:
		if Input.is_action_just_pressed("ui_accept"):
			_reset_run()
			return
		velocity.x = move_toward(velocity.x, 0.0, FRICTION * delta)
		velocity.y += GRAVITY * delta
		move_and_slide()
		return

	_apply_horizontal_movement(delta)
	_apply_gravity_and_jump(delta)
	move_and_slide()

	time_left = max(time_left - delta, 0.0)
	if reset_overlap_grace_frames > 0:
		reset_overlap_grace_frames -= 1
		return
	if hazard_area.overlaps_body(self):
		_finish(false, "FAIL: hazard touched - press Retry")
	elif collectible_area.overlaps_body(self) and not has_collectible:
		_collect_item()
	elif goal_area.overlaps_body(self):
		if has_collectible:
			_finish(true, "SUCCESS: ITEM delivered to Goal")
		else:
			_update_hud("ITEM needed before Goal", "RUNNING")
	elif time_left <= 0.0:
		_finish(false, "FAIL: time expired - press Retry")
	else:
		_update_hud("SECTION 2: avoid HAZARD, collect ITEM, reach Goal", "RUNNING")

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

func _collect_item() -> void:
	has_collectible = true
	collectible_area.visible = false
	collectible_collision.set_deferred("disabled", true)
	_update_hud("ITEM collected - Goal is active", "RUNNING")

func _finish(success: bool, message: String) -> void:
	finished = true
	retry_button.visible = true
	_update_hud(message, "SUCCESS" if success else "FAIL")

func _reset_run() -> void:
	global_position = START_POSITION
	velocity = Vector2.ZERO
	time_left = TIME_LIMIT
	finished = false
	has_collectible = false
	reset_overlap_grace_frames = 2
	collectible_area.visible = true
	collectible_collision.disabled = false
	retry_button.visible = false
	_update_hud("START: move right, jump, collect ITEM, reach Goal", "RUNNING")

func _update_hud(message: String, result: String) -> void:
	timer_label.text = "TIME %.1f" % time_left
	item_label.text = "ITEM 1/1" if has_collectible else "ITEM 0/1"
	status_label.text = message
	result_label.text = result
