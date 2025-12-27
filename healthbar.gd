extends ProgressBar


@export var player: CharacterBody2D

func _ready():
	max_value = player.max_health
	value = player.health

@warning_ignore("unused_parameter")
func _process(delta):
	value = player.health
