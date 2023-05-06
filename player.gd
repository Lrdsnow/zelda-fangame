extends CharacterBody2D

@export var username : String

func _ready():
	if not Global.singleplayer:
		set_multiplayer_authority(name.to_int())
		if is_multiplayer_authority():
			username=Global.username
			$name.text = username+" (You)"
		else:
			$PlayerCamera.queue_free()
			await $MultiplayerSynchronizer.synchronized
			$name.text = username
	else:
		$name.queue_free()

func _physics_process(delta):
	if not Global.singleplayer and not is_multiplayer_authority(): return
	frames()
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 500
	move_and_slide()

var last_dir = Vector2(0,0)
func frames():
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") == Vector2(-1, 0):
		last_dir = Vector2(-1, 0)
		$frames.play("walk_left")
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") == Vector2(1, 0):
		last_dir = Vector2(1, 0)
		$frames.play("walk_right")
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") == Vector2(0, -1):
		last_dir = Vector2(0, -1)
		$frames.play("walk_up")
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") == Vector2(0, 1):
		last_dir = Vector2(0, 1)
		$frames.play("walk_down")
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") == Vector2(0, 0):
		if last_dir == Vector2(-1, 0):
			$frames.play("idle_left")
		elif last_dir == Vector2(1, 0):
			$frames.play("idle_right")
		elif last_dir == Vector2(0, -1):
			$frames.play("idle_up")
		else:
			$frames.play("idle_down")
