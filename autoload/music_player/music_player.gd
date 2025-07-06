extends Node



func _ready() -> void:
	pass
	#TODO Add default music track
	##fade_in(audio_stream_player, -12, 3.0)
	##audio_stream_player.finished.connect(audio_stream_player.play)

func _pause() -> void:
	var _volume_db: float
	_volume_db = AudioServer.get_bus_volume_db(1)
	AudioServer.set_bus_volume_db(1, _volume_db - 6.0)
	AudioServer.set_bus_volume_db(0, _volume_db - 6.0)


func _unpause() -> void:
	var _volume_db: float
	_volume_db = AudioServer.get_bus_volume_db(1)
	AudioServer.set_bus_volume_db(1, _volume_db + 6.0)
	AudioServer.set_bus_volume_db(0, _volume_db + 6.0)


func fade_in(sound: AudioStreamPlayer, _stop_volume, _duration) -> void:
	var _tween_in: Tween = get_tree().create_tween()
	(
		_tween_in
		. tween_property(sound, "volume_db", _stop_volume, _duration)
		. set_ease(Tween.EASE_OUT)
		. set_trans(Tween.TRANS_SINE)
	)


func _fade_out(sound: AudioStreamPlayer, _stop_volume) -> void:
	var _tween_out: Tween = get_tree().create_tween()
	(
		_tween_out
		. tween_property(sound, "volume_db", _stop_volume, 1.0)
		. set_ease(Tween.EASE_IN)
		. set_trans(Tween.TRANS_SINE)
	)
