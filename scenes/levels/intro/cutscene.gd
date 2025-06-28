extends Node

@onready var manager_label: Label = %ManagerLabel
@onready var themanager: Sprite2D = $Themanager



func _ready() -> void:
	determine_cut_scene()

func determine_cut_scene() -> void:
	if GameStates.day:
		GameStates.manager_count_good += 1
		_good_job()
	else:
		GameStates.manager_count_bad += 1
		_bad_job()


func _good_job() -> void:
	var tween = create_tween()
	var audio_time: float

	manager_label.visible_ratio = 0.0

	match GameStates.manager_count_good:
		2:
			ManageDialogue.play_pill_1_monika()
			audio_time = 10.82
		3:
			ManageDialogue.play_pill_2_monika()
			audio_time = 11.90
		4:
			ManageDialogue.play_pill_3_monika()
			audio_time = 13.46
		5:
			ManageDialogue.play_pill_4_monika()
			themanager.visible = true
			audio_time = 5.15

	manager_label.text = ManageDialogue.manager_text[GameStates.manager_count_good]

	tween.tween_property(manager_label,"visible_ratio", 1.0, audio_time)
	await tween.finished
	await get_tree().create_timer(2.0).timeout

	if GameStates.manager_count_good == 5:
		ScreenTransition.transition_to_scene("uid://d02yx5wbuhnlk")
	else:
		ScreenTransition.transition_to_scene("uid://c7y7kh8k4adgv")

func _bad_job() -> void:
	var tween = create_tween()
	var audio_time: float

	manager_label.visible_ratio = 0.0
	match GameStates.manager_count_bad:
		9:
			ManageDialogue.play_saving_1_monika()
			audio_time = 9.10
		10:
			ManageDialogue.play_saving_2_monika()
			audio_time = 11.93
		11:
			ManageDialogue.play_saving_3_monika()
			audio_time = 6.62
			themanager.visible = true
		12:
			ManageDialogue.play_saving_4_monika()
			audio_time = 19.95

	manager_label.text = ManageDialogue.manager_text[GameStates.manager_count_bad]

	tween.tween_property(manager_label,"visible_ratio", 1.0, audio_time)
	await tween.finished
	await get_tree().create_timer(2.0).timeout
	if GameStates.manager_count_bad == 12:
		ScreenTransition.transition_to_scene("uid://d02yx5wbuhnlk")
	else:
		ScreenTransition.transition_to_scene("uid://c7y7kh8k4adgv")
