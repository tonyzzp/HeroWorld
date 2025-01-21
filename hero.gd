extends CharacterBody2D


@onready var state_machine:AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.set("parameters/idle/blend_position", Vector2.DOWN)
	state_machine.travel("idle")

func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	$AnimationTree.set("parameters/walk/blend_position", direction)
	if direction != Vector2.ZERO :
		$AnimationTree.set("parameters/idle/blend_position", direction)
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")
	pass
