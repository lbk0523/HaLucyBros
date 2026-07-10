extends SceneTree

const MAX_SEGMENT_FRAMES := 360
const MAX_FINISH_FRAMES := 720

func _initialize() -> void:
	call_deferred("_run")

func _emit_action(action: StringName, pressed: bool) -> void:
	var event := InputEventAction.new()
	event.action = action
	event.pressed = pressed
	Input.parse_input_event(event)
	Input.flush_buffered_events()

func _release_inputs() -> void:
	_emit_action("ui_right", false)
	_emit_action("ui_accept", false)

func _fail(message: String) -> void:
	_release_inputs()
	push_error("TRAVERSAL QA FAIL: %s" % message)
	quit(1)

func _jump() -> void:
	_emit_action("ui_accept", true)
	await physics_frame
	await physics_frame
	_emit_action("ui_accept", false)

func _move_right_until(player: CharacterBody2D, target_x: float) -> bool:
	_emit_action("ui_right", true)
	for _frame in range(MAX_SEGMENT_FRAMES):
		await physics_frame
		if bool(player.get("finished")):
			return false
		if player.global_position.x >= target_x:
			return true
	return false

func _wait_for_landing(player: CharacterBody2D) -> bool:
	var became_airborne := false
	for _frame in range(MAX_SEGMENT_FRAMES):
		await physics_frame
		if not player.is_on_floor():
			became_airborne = true
		elif became_airborne:
			return true
		if bool(player.get("finished")):
			return false
	return false

func _run() -> void:
	var packed_scene: PackedScene = load("res://scenes/main.tscn")
	var scene: Node2D = packed_scene.instantiate() as Node2D
	root.add_child(scene)
	await process_frame
	await physics_frame
	await physics_frame

	var player: CharacterBody2D = scene.get_node("Player") as CharacterBody2D
	var result_label: Label = scene.get_node("HUD/ResultLabel") as Label
	var status_label: Label = scene.get_node("HUD/StatusLabel") as Label

	if not await _move_right_until(player, 230.0):
		_fail("could not reach the warmup-step approach")
		return

	_emit_action("ui_right", false)
	await _jump()
	if not await _wait_for_landing(player):
		_fail("could not land on the warmup step")
		return
	if player.global_position.y > 300.0:
		_fail("the first jump landed on ground instead of the warmup step")
		return
	print("TRAVERSAL QA CHECKPOINT: warmup step x=%.2f y=%.2f" % [player.global_position.x, player.global_position.y])

	if not await _move_right_until(player, 315.0):
		_fail("could not traverse the warmup step")
		return
	await _jump()
	if not await _wait_for_landing(player):
		_fail("could not land on the elevated platform")
		return
	if player.global_position.y > 260.0:
		_fail("the second jump did not reach the elevated platform")
		return
	print("TRAVERSAL QA CHECKPOINT: elevated platform x=%.2f y=%.2f" % [player.global_position.x, player.global_position.y])

	if not await _move_right_until(player, 500.0):
		_fail("could not reach the platform hazard-jump point")
		return
	await _jump()

	for frame_count in range(MAX_FINISH_FRAMES):
		await physics_frame
		if bool(player.get("finished")):
			_release_inputs()
			print("TRAVERSAL QA TRACE: frames=%d x=%.2f y=%.2f item=%s result=%s status=%s" % [frame_count, player.global_position.x, player.global_position.y, player.get("has_collectible"), result_label.text, status_label.text])
			if not bool(player.get("has_collectible")):
				_fail("the input-driven route finished without collecting the item")
				return
			if result_label.text != "SUCCESS":
				_fail("the input-driven route finished with %s" % status_label.text)
				return
			if player.global_position.x < 1020.0:
				_fail("success occurred before reaching the goal region")
				return
			print("TRAVERSAL QA PASS: input-only route reached SUCCESS at x=%.2f with %.2fs remaining" % [player.global_position.x, float(player.get("time_left"))])
			quit(0)
			return

	_fail("the input-driven route did not finish within %d frames" % MAX_FINISH_FRAMES)
