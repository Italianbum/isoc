extends Button

@onready var writing_sfx: AudioStreamPlayer = $writing_sfx

func _pressed() -> void:
	writing_sfx.play()
