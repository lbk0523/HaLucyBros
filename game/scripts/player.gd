extends ColorRect

const SPEED := 220.0
const CUE_DISTANCE := 8.0

@onready var heading_cue: ColorRect = $HeadingCue

var last_direction := Vector2.UP

func _process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		last_direction = direction.normalized()
	position += direction * SPEED * delta
	_update_heading_cue()

func _update_heading_cue() -> void:
	var body_size: Vector2 = size
	var cue_size: Vector2 = heading_cue.size
	var body_center: Vector2 = body_size * 0.5
	var cue_center: Vector2 = body_center + last_direction * ((min(body_size.x, body_size.y) * 0.5) + CUE_DISTANCE)
	heading_cue.position = cue_center - (cue_size * 0.5)
